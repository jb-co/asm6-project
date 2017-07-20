ScrollLogic:

	lda #$04
	jsr PRGBankWrite
	
	LDA deltaX
	bmi @notRight
	
	ldy roomNumber
	lda Level1_ScrollLocks, y

	and #$01
	cmp #$01
	beq @endScrollLogic
	
	LDA entity_xHi
	sec
	sbc #$80
	CMP scrollX_hi
	bmi @endScrollLogic
	
@applyScrollX	
	
	lda scrollX_hi
	clc
	adc deltaX
	sta scrollX_hi	
	lda roomNumber	
	adc #$00
	sta roomNumber	

	JMP @endScrollLogic
	
@notRight
	
	lda roomNumber	
	bne @fine
	lda scrollX_hi
	beq @endScrollLogic
	
@fine
	
	lda scrollX_hi
	bne @leftScroll			;;check if scroll is just about to move in to new room
	
	ldy roomNumber
	lda Level1_ScrollLocks, y

	and #$02
	cmp #$02
	beq @endScrollLogic

@leftScroll	
	
	LDA entity_xHi
	sec
	sbc #$80
	CMP scrollX_hi
	bpl @endScrollLogic
	
@sameRoom	

	lda deltaX
	;bpl @positive
	dec roomNumber
;@positive:
	clc 
	adc scrollX_hi
	sta scrollX_hi
	lda #$00
	adc roomNumber
	sta roomNumber

@endScrollLogic	

;nametable swap check

	LDA roomNumber
	AND #$01
	STA nametable    
	rts
	
VerticalTransition:
	;jsr InitializeNametables
	
	;jsr ClearActiveSlots
	
	;disable ppu
	lda #$00
	sta $2001
	
	;inc roomNumber
	inc worldX_hi
	LDA #$00

	STA tempX_lo
	STA columnNumber
	
	lda worldX_hi
	STA tempX_hi
		
	jsr InitializeNametables
	
	inc roomNumber
	lda #$08
	sta entity_yHi
		
	LDA roomNumber
	AND #$01
	STA nametable   
	
	jsr FullRoomSpawn
	
	
	lda #$01
	sta gameState
	
	lda #%10010000   ; enable NMI, sprites from Pattern Table 0, background from Pattern Table 1
	STA $2000

	rts