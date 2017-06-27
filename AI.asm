; AI ROUTINES FOR DAYS!

verticalMovement: 
	ldy entity_counter
	LDA entity_yLo, y
	STA storedY_lo
	LDA entity_yHi, y
	STA storedY_hi
	
	;;apply vertical acc to entity
	
	lda entity_yLo, y
	sec
	sbc entity_vAccLo, y
	sta entity_yLo, y
	lda entity_yHi, y
	sbc entity_vAccHi, y
	sta entity_yHi, y
	
	rts
	
horizontalMovement: 
;;save x for easy restore
	
	LDA entity_xLo, y
	STA storedX_lo
	LDA entity_xHi, y
	STA storedX_hi
	LDA worldX_hi, y
	STA storedWorldX_hi

	
	;apply horizontal acc
	
	;add_16 entity_hAccLo, y, entity_hAccHi, y, entity_xLo, y, entity_xHi, y
	lda entity_xLo, y
	clc
	adc entity_hAccLo, y
	sta entity_xLo, y
	lda entity_xHi, y
	adc entity_hAccHi, y
	sta entity_xHi, y
	
	
	lda entity_hAccHi, y
	bmi @negative

@positive
	lda worldX_hi, y
	adc #$00
	sta worldX_hi, y
	jmp @endWorld
@negative				; \(>.<);
	lda #$00
	adc #$00
	eor #$01
	beq @endWorld
	lda worldX_hi, y
	sec
	sbc #$01
	sta worldX_hi, y
@endWorld

	;;horizontal collision
	rts
	
	
applyGravity:
	
	;sub_16 gravity, #$00, entity_vAccLo, y, entity_vAccHi, y
	lda entity_vAccLo, y
	sec
	sbc gravity
	sta entity_vAccLo, y
	lda entity_vAccHi, y
	sbc #$00
	sta entity_vAccHi, y
	
	;;set a max vertical acc to -7
	LDA entity_vAccHi, y
	CMP #$F9
	BPL @end
	SEC
	LDA #$F9
	STA entity_vAccHi, y
	LDA #$00
	STA entity_vAccLo, y
@end
	rts
	
moveObject:

	lda entity_hDir, y
		cmp #RIGHT
		beq @right
@left
		cmp #LEFT
		bne @end
		lda entity_hAccHi, y
		sec
		sbc temp
		sta entity_hAccHi, y
		lda #$00
		sta entity_hAccLo, y
		jmp @end
@right
		lda entity_hAccHi, y
		clc
		adc temp
		sta entity_hAccHi, y
		lda #$00
		sta entity_hAccLo, y
	
@end
	rts
	
Player:


	;; [USER INPUT]
	JSR ReadController
	JSR CheckInputs
	


	lda HitBoxes, y
	sta pHitBox
	lda HitBoxes+1, y
	sta pHitBox+1
	
	jsr applyGravity
	
	lda entity_hAccHi
	ora entity_hAccLo
	beq @noHorizontalMovement
	
	jsr horizontalMovement
	;jsr BgrCollisionHorizontal
	
	
@noHorizontalMovement	

	
	jsr verticalMovement
	jsr BgrCollisionVertical


	
	;jmp Animation_Player
	
	rts

;BLOB

AI_Blob:

	;check if dead/off screen
	lda entity_yHi, y
	cmp #$f0
	bne @alive
	
	jsr ReturnFreeSlot
	rts
@alive


	
	lda #<(HitBox_Blob)
	sta pHitBox
	lda #>(HitBox_Blob)
	sta pHitBox+1
	
	lda #$01
	sta temp
	jsr moveObject
	
	jsr applyGravity
	
	jsr horizontalMovement
	jsr BgrCollisionHorizontal
	
	jsr verticalMovement
	jsr BgrCollisionVertical
	

	
	;lda Def_Blob+2
	;jsr Animation_Generic
	
	;ldx entity_counter
	;jmp PlayerBulletCollision
		
	rts
	
;STOMPER
AI_Stomper:
	
	;check if dead/off screen
	lda entity_yHi, y
	cmp #$f0
	bne @alive
	
	jmp ReturnFreeSlot
@alive


	
	lda #<(HitBox_Stomper)
	sta pHitBox
	lda #>(HitBox_Stomper)
	sta pHitBox+1
	
	lda frameCounter
	and #%00111111
	cmp #$20
	bne @skip
	lda entity_vAccHi, y
	clc
	adc #$04
	sta entity_vAccHi, y
	
@skip

	jsr applyGravity
	
	jsr verticalMovement
	;jsr BgrCollisionVertical

	ldx entity_counter
	;jsr PlayerBulletCollision

	
	rts

;;PICKLE
AI_Pickle:
	;check if dead/off screen
	lda entity_yHi, y
	cmp #$f0
	bne @alive
	
	jmp ReturnFreeSlot
@alive


	
	lda #<(HitBox_Pickle)
	sta pHitBox
	lda #>(HitBox_Pickle)
	sta pHitBox+1

	lda #$02
	sta temp
	jsr moveObject
	
	jsr horizontalMovement
	
	;lda Def_Pickle+2
	;jsr Animation_Generic
	
	;ldx entity_counter
	;jmp PlayerBulletCollision

	
AI_Bullet:

		;check if dead/off screen
	lda entity_yHi, y
	cmp #$f0
	bne @alive
	
	lda entity_index, y
	tax
	lda #$ff
	sta playerBullets, x
	
	jmp ReturnFreeSlot
@alive

	lda #<(HitBox_Bullet)
	sta pHitBox
	lda #>(HitBox_Bullet)
	sta pHitBox+1
	lda #$04
	sta temp
	jsr moveObject
	jsr horizontalMovement

	rts
	
	
PlayerBulletCollision:	
	lda worldX_hi, x
	sta temp
	lda entity_xHi, x
	sta testX
	lda entity_yHi, x
	sta testY
	
	ldy #$00
	sty counter
@loop
	lda playerBullets, y
	cmp #$ff 
	bne @activeBullet
	jmp @end
	
@activeBullet
	tax
	;lda worldX_hi, x
	;cmp temp
	;bne .done
	
	lda entity_xHi, x	
	clc
	adc HitBox_Bullet
	sta temp
	
	lda testX
	ldy #$02
	clc
	adc (pHitBox), y
	
	cmp temp
	bcc @end
	
	;is left side <= player right
	lda entity_xHi, x
	clc
	adc HitBox_Bullet+2
	sta temp
	
	lda testX
	ldy #$00
	clc
	adc (pHitBox), y
	
	cmp temp
	bcs @end
	
	;is top <= player bottom
	lda entity_yHi, x
	clc
	adc HitBox_Bullet+3
	sta temp
	
	lda testY
	ldy #$01
	clc
	adc (pHitBox), y
	
	cmp temp
	bcs @end
	
	;is bottom >= player top
	lda entity_yHi, x
	clc
	adc HitBox_Bullet+1
	sta temp
	
	lda testY
	ldy #$03
	clc
	adc (pHitBox), y
	
	cmp temp
	bcc @end
	
	;got hit
	stx collidedWithIndex
	inc collided
	
	lda #$f0
	sta entity_yHi, x
	
	ldy entity_counter ;remove object (decrease hp in the future)
	jsr ReturnFreeSlot
	
	jmp PlayHit

@end	
	inc counter
	ldy counter
	cpy #$03
	beq @done
	jmp @loop
@done	

	rts
	
	

	