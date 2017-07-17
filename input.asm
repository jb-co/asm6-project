
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

	lda isJumping
	beq @notInAir
	lda #$08
	sta walkCounter
@notInAir

;start 
	lda buttons
	and #$10
	beq @notStart
	
	
	
	
@notStart
;select
	LDA buttons
	and #$20
	beq +notSelect
	

	dec entity_hAccHi

+notSelect

	
@AButtonCheck
	;;A button
	LDA buttons
	AND #$80
	BEQ @notA
	
	lda entity_airborne
	bne @checkB
	
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
	LDA #$00
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
	
	lda #RIGHT
	sta entity_hDir
	
	lda walkCounter
	cmp #$07
	bcs @fullSpeed
	
	inc walkCounter
	lda #$20
	sta entity_hAccLo	
	lda #$00	
	sta entity_hAccHi
	
	jmp @doneWalking
@fullSpeed
	lda #$40
	sta entity_hAccLo
	lda #$01	
	sta entity_hAccHi		
	
@doneWalking	
	inc entity_animFrame
	
	RTS
	
	
NotRight:

	LDA buttons
	AND	#$02
	
	BEQ NotLeft
	
	lda #LEFT
	sta entity_hDir
	
	lda walkCounter
	cmp #$07
	bcs @fullSpeed
	
	inc walkCounter
	lda #$20
	sta entity_hAccLo
	lda #$00
	sta entity_hAccHi
	
	jmp @doneWalking
	
@fullSpeed
	
	lda #$40
	sta entity_hAccLo
	lda #$01
	sta entity_hAccHi

@doneWalking
	inc entity_animFrame
	lda #LEFT
	sta entity_hDir
	rts
NotLeft:

	lda #$00
	sta walkCounter

	RTS