StartScreen:
	
	jsr LoadBackground
	
	LDA #%10010000   ; enable NMI, sprites from Pattern Table 0, background from Pattern Table 1
	STA $2000
	
	LDA #%00111110   ; enable sprites, enable background, no clipping on left side
	STA $2001
@forever:

	jsr ReadController
	
	;start 
	lda buttons
	and #$10
	beq @notStart
	

	rts
	
@notStart
	jmp @forever
	rts
	
LoadBackground:
	LDA $2002             ; read PPU status to reset the high/low latch
	LDA #$20
	STA $2006             ; write the high byte of $2000 address
	LDA #$00
	STA $2006             ; write the low byte of $2000 address
	LDX #$00              ; start out at 0

	LDA #<(start+32)
	STA sourceLow
	LDA #>(start+32)
	STA sourceHigh
	
	LDX #$04  ; loop X 4 times
	LDY #$40 ; Loop Y 256 times
	
-
	LDA (sourceLow), y
	STA $2007             ; write to PPU
	INY                  
	BNE -
	
	inc sourceHigh ;increment high byte of address back to next 256 byte chunk
	DEX
	BNE -
	
	rts
	

	
	
start:
	incbin start.nam