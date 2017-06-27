;----------------------------------------------------------------
; constants
;----------------------------------------------------------------

MIRRORING = %0001 ;%0000 = horizontal, %0001 = vertical, %1000 = four-screen
;;;;;;;;;;;;
;constants
DOWN = $10
UP = $20
RIGHT = $80
LEFT = $40

PLAYER = $00
BLOB = $01
STOMPER = $02
PICKLE = $03
BULLET = $04

SPRITE_RAM = $200
SPAWN_RAM = $6000
METABUFFER_RAM = $6080

SCREEN_WIDTH		= $20

;----------------------------------------------------------------
; variables
;----------------------------------------------------------------

   include variables.asm
   
;----------------------------------------------------------------
; iNES header
;----------------------------------------------------------------

   .db "NES", $1a ;identification of the iNES header
   .db $08 ;number of 16KB PRG-ROM pages
   .db $00 ;number of 8KB CHR-ROM pages
   .db $10|MIRRORING ;mapper 2 and mirroring
   .dsb 9, $00 ;clear the remaining bytes
   

;----------------------------------------------------------------
; program bank 0
;----------------------------------------------------------------

   .base $8000

  

   .org $c000

;----------------------------------------------------------------
; program bank 1
;----------------------------------------------------------------

   .base $8000

   ;NOTE: contents of program bank 1 go here

   .org $c000

;----------------------------------------------------------------
; program bank 2
;----------------------------------------------------------------

   .base $8000

   ;NOTE: contents of program bank 2 go here

   .org $c000

;----------------------------------------------------------------
; program bank 3
;----------------------------------------------------------------

   .base $8000

   ;NOTE: contents of program bank 3 go here

   .org $c000

;----------------------------------------------------------------
; program bank 4
;
; Level data, level object data
;----------------------------------------------------------------

   .base $8000

   include bank4.asm

   .org $c000

;----------------------------------------------------------------
; program bank 5	(maybe don't need a full bank for these)
;
; Collision Routines
;----------------------------------------------------------------

   .base $8000

   ;include bank5.asm

   .org $c000

;----------------------------------------------------------------
; program bank 6
;
; Object AI routines
;----------------------------------------------------------------

   .base $8000

   include bank6.asm

   .org $c000

;----------------------------------------------------------------
; fixed program bank (15)
;----------------------------------------------------------------
   .base $c000

;include misc.asm
include columns.asm
include init.asm
include scroll.asm
include slots.asm
include spawn.asm
include sprites.asm
include gamestate.asm
include input.asm
include ai.asm
include collision.asm

Reset:

  sei          ; disable IRQs
  CLD          ; disable decimal mode
  LDX #$40
  STX $4017    ; disable APU frame IRQ
  LDX #$FF
  TXS          ; Set up stack
  INX          ; now X = 0
  STX $2000    ; disable NMI
  STX $2001    ; disable rendering
  STX $4010    ; disable DMC IRQs

vblankwait1:       ; First wait for vblank to make sure PPU is ready
  BIT $2002
  BPL vblankwait1
  
  jsr ConfigWrite
	lda #$00
	jsr PRGBankWrite
  
@clrmem:
  LDA #$00
  STA $0000, x
  STA $0100, x
  STA $0300, x
  STA $0400, x
  STA $0500, x
  STA $0600, x
  STA $0700, x
  LDA #$F0
  STA $0200, x
  INX
  BNE @clrmem

   
vblankwait2:      ; Second wait for vblank, PPU is ready after this
	BIT $2002
	BPL vblankwait2
	
	lda #$04
	jsr PRGBankWrite
	
	jsr LoadObjects
	jsr ReadMetaTiles
	
	lda #$00
	jsr PRGBankWrite
	
	jsr LoadCHRRAM
	jsr LoadPalettes
	
	jsr InitSlots
	jsr InitVariables
	;draws two full nametables from beginning of map
	;sets up nametables to draw from the beginning of map
	LDA #$00
	STA tempX_lo
	STA tempX_hi
	STA columnNumber
	jsr InitializeNametables
	
	LDA #$20
	STA columnNumber
	
	LDA #%10010000   ; enable NMI, sprites from Pattern Table 0, background from Pattern Table 1
	STA $2000

	LDA #%00011110   ; enable sprites, enable background, no clipping on left side
	STA $2001
	
	ldy #$00
	sty roomNumber
	
	jsr FullRoomSpawn
	
	; [forever alone]	
forever:
	
	jsr NextFrame	;;wait for nmi
	

	lda gameState
	jsr GameStateRoutine
	
	jsr UpdateSprites
	
	
	jmp forever   

; [THE ONE AND ONLY NMI] 
NMI:

	PHA                             
	TXA
	PHA
	TYA
	PHA
	
	lda gamePaused
	beq +
	
	LDA #%00011110   ; enable sprites, enable background, no clipping on left side
	STA $2001
	
	lda #$00
	sta gamePaused
+
	
	LDA entity_hAccHi
	ORA entity_hAccLo
	beq @ppuSection
	
	
	jsr ScrollLogic
	
;NewAttribCheck:
 ; LDA scroll
 ; AND #%00011111            ; check for multiple of 32
 ; BNE NewAttribCheckDone    ; if low 5 bits = 0, time to write new attribute bytes
 ; jsr DrawNewAttributes
;NewAttribCheckDone:

	jsr NewColumnCheck

@ppuSection 

	LDA #$00
	STA $2003       
	LDA #$02
	STA $4014       ; sprite DMA from $0200
	
	LDA #$00
	STA $2006        ; clean up PPU address registers
	STA $2006
	
	LDA scrollX_hi
	STA $2005        ; write the horizontal scroll count register
	
	LDA #$00        ; no vertical scrolling
	STA $2005
		
	;;This is the PPU clean up section, so rendering the next frame starts properly.
	LDA #%10010000   ; enable NMI, sprites from Pattern Table 0, background from Pattern Table 1
	ORA nametable    ; select correct nametable for bit 0
	STA $2000
	
	;[MUSIC GOES HERE]
	
	inc frameCounter
	
	lda #$0     
    sta sleeping
	
	;restore the registers
	PLA                              
	TAY 
	PLA
	TAX
	PLA
	
	rti
  

LoadPalettes:
  LDA $2002    ; read PPU status to reset the high/low latch
  LDA #$3F
  STA $2006    ; write the high byte of $3F00 address
  LDA #$00
  STA $2006    ; write the low byte of $3F00 address
  LDX #$00
LoadPalettesLoop:
  LDA palette, x        ;load palette byte
  STA $2007             ;write to PPU
  INX                   ;set index to next byte
  CPX #$20            
  BNE LoadPalettesLoop  ;if x = $20, 32 bytes copied, all done
  rts
  
 LoadCHRRAM:            ;;copies 8KB of graphics from PRG to CHR RAM
  lda $2002
  lda #$00
  sta $2006            ;set PPU to the CHR RAM area $0000-1FFF
  sta $2006
  ldy #$00
  ldx #$20             ;32 x 256 bytes = 8 KB
  lda #<Graphics
  sta source_lo
  lda #>Graphics  ;get the address of the graphics data ($C000)
  sta source_hi       ;put into our source pointer
@LoadCHRRamLoop:
  lda (source_lo), y    ;copy from source pointer
  sta $2007            ;to PPU CHR RAM area
  iny
  bne @LoadCHRRamLoop   ;;loop 256 times
  inc source_hi        ;;then increment the high address byte
  dex                  ;;do that 32 times
  bne @LoadCHRRamLoop   ;;32 x 256 = 8KB
LoadCHRRamDone:
  rts
  
 ConfigWrite:        ; make sure this is in a fixed PRG bank so the RTS doesn't get swapped away
  LDA #$80
  STA $8000         ; reset the shift register
  LDA #%00001110    ; 8KB CHR, 16KB PRG, $8000-BFFF swappable, vertical mirroring
  STA $8000         ; first data bit
  LSR A             ; shift to next bit
  STA $8000         ; second data bit
  LSR A             ; etc
  STA $8000
  LSR A
  STA $8000
  LSR A
  STA $8000         ; config bits written here, takes effect immediately
  RTS
  
 SwitchMirroring:        ; make sure this is in a fixed PRG bank so the RTS doesn't get swapped away
  LDA #$80
  STA $8000         ; reset the shift register
  LDA #%00001111  ; 8KB CHR, 16KB PRG, $8000-BFFF swappable, vertical mirroring
  STA $8000         ; first data bit
  LSR A             ; shift to next bit
  STA $8000         ; second data bit
  LSR A             ; etc
  STA $8000
  LSR A
  STA $8000
  LSR A
  STA $8000         ; config bits written here, takes effect immediately
  RTS

PRGBankWrite:       ; make sure this is in a fixed bank so it doesnt get swapped away
	  ; bank number in A
  
	STA $E000         ; first data bit
	LSR A             ; shift to next bit
	STA $E000
	LSR A
	STA $E000
	LSR A
	STA $E000
	LSR A
	STA $E000         ; bank switch happens immediately here
	RTS
	
GetTileValue: 
	
	lda testX
	and #%11110000
	sta temp
	
	LDA testY	;y / 16
	LSR A
	LSR A
	LSR A 
	LSR A
	
	clc
	adc temp
	STA pColumnData_lo ;save lo map address
	
	lda entity_xHi, x
	clc
	adc offsetX
	lda worldX_hi, x
	adc #$00
	sta temp
	
	lda #$04
	sta sourceBank
	jsr PRGBankWrite
	
	;get offset from map;
	LDA #>(columnData)
	clc
	adc temp
	STA pColumnData_hi

	LDY #<(columnData)
	LDA (pColumnData_lo), y
	
	sta currentTile
	
	lda #$00
	sta sourceBank
	jsr PRGBankWrite
	rts
	

NextFrame:
	inc sleeping
-   lda sleeping
    bne -
    rts
	
DoRoutine:
	asl a
	tax
	lda AI_Routines+1,x
	pha
	lda AI_Routines,x
	pha
	rts
	   
CollisionRoutine:
	asl a
	tax
	lda Collision_Routines+1,x
	pha
	lda Collision_Routines,x
	pha
	rts
	
GameStateRoutine:
	asl a
	tax
	lda GameState_Routines+1,x
	pha
	lda GameState_Routines,x
	pha
	rts
  
Graphics: 
	incbin "mario.chr"   ;includes 8KB graphics file from SMB1

palette:
	db $0f,$28,$10,$00,$0f,$01,$21,$31,$0f,$21,$10,$00,$0f,$09,$19,$29
	db $0f,$28,$10,$00,$0f,$01,$21,$31,$0f,$21,$10,$00,$0f,$09,$19,$29
	
  ;; [ META TILES ]
sky:
	db $00, $00, $00, $00
grass:
	db $25, $25, $25, $25
sand:
	db $24, $24, $24, $24
snow:
	db $B3, $B3, $B3, $B3
vertTrigger
	db $33, $33, $33, $33

 
MetaTileSets:
	dw sky, grass, sand, snow, vertTrigger
	

AI_Routines:
	.word Player-1, AI_Blob-1, AI_Stomper-1, AI_Pickle-1, AI_Bullet-1
	
;; [ ROUTINES ]

GameState_Routines:
	.word GameState_Playing-1, GameState_WaitFrames-1




	

 

IRQ:

   ;NOTE: IRQ code goes here

;----------------------------------------------------------------
; interrupt vectors
;----------------------------------------------------------------

   .org $fffa

   .dw NMI
   .dw Reset
   .dw IRQ