
ReadController:
	LDA #$01
	STA $4016
	LDA #$00
	STA $4016       ;tell both the controllers to latch buttons
	LDX #$08 ;00001000
	
ReadControllerLoop:
	LDA $4016
	LSR A
	ROL buttons 
	DEX
	BNE ReadControllerLoop
	RTS
	
	
	
CheckInputs:

;start 
	lda buttons
	and #$10
	beq @notStart
	
	
	
	
@notStart
;select
	LDA buttons
	and #$20
	beq @notSelect
	
	lda spawned
	bne @notSelect
	
	lda #$01
	sta spawned 
	
	lda entity_xHi
	clc
	adc #$20
	sta spawn_x
	lda #$40
	sta spawn_y
	
	lda #BLOB
	sta spawn_type
	
	lda worldX_hi
	sta spawn_room
	
	jsr SpawnEnemy

@notSelect

	
@AButtonCheck
	;;A button
	LDA buttons
	AND #$80
	BEQ @notA
	
	
	lda isJumping
	bne @checkB
	jsr playerJump
	
	JMP @checkB
	
@notA

	LDA jumpCounter
	BEQ @doneA
	
	LDA entity_vAccHi
	CMP #$01
	Bmi @dontReset
	LDA #$01
	STA entity_vAccHi
	
	lda entity_vAccLo
	CMP #$40
	Bmi @dontReset
	LDA #$40
	STA entity_vAccLo
	
@dontReset
	lda #$00
	sta jumpCounter
	
	jmp @checkB
@doneA
	;lda #$00
	;sta isJumping
	

@checkB

	LDA buttons
	AND #$40
	BEQ @notB
	
	lda B_down
	bne @checkR
	
	inc B_down
	jsr SpawnPlayerBullet
	ldy entity_counter
	jmp @checkR
	
@notB
	lda #$00
	sta B_down

@checkR
	LDA buttons
	AND	#$01

	BEQ NotRight
	
	
	
	lda walkCounter
	cmp #$07
	bcs @fullSpeed
	
	inc walkCounter
	lda entity_hAccLo
	clc
	adc #$20
	sta entity_hAccLo	
	lda entity_hAccHi
	clc
	adc #$00	
	sta entity_hAccHi
	
	jmp @doneWalking
@fullSpeed
	lda entity_hAccLo
	clc
	adc #$40
	sta entity_hAccLo
	lda entity_hAccHi
	clc
	adc #$01	
	sta entity_hAccHi		
	
@doneWalking	
	inc entity_animFrame
	
	lda #RIGHT
	sta entity_hDir, y
	RTS
	
	
NotRight:

	LDA buttons
	AND	#$02
	
	BEQ NotLeft
	
	lda walkCounter
	cmp #$07
	bcs @fullSpeed
	
	inc walkCounter
	
	lda entity_hAccLo
	sbc #$20
	sta entity_hAccLo
	lda entity_hAccHi
	sbc #$00
	sta entity_hAccHi
	
	jmp @doneWalking
	
@fullSpeed
	
	lda entity_hAccLo
	sbc #$40
	sta entity_hAccLo
	lda entity_hAccHi
	sbc #$01
	sta entity_hAccHi

@doneWalking
	inc entity_animFrame
	lda #LEFT
	sta entity_hDir, y
	rts
NotLeft:

	lda #$00
	sta walkCounter

	RTS