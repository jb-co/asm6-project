
playerJump:
	
	LDA jumpCounter
	CMP #$10
	BCS +
	
	inc jumpCounter
	LDA #$04
	STA entity_vAccHi
	LDA #$40
	STA entity_vAccLo
	
+	
	inc isJumping
	
	rts
	
CheckOffscreen:
	;check if entity is offscreen
	ldy entity_counter
	lda entity_width, y	;half width
	lsr a
	;sec
	;sbc #$01
	sta temp
	
	lda entity_xHi, y
	clc 
	adc temp
	sta testX
	lda worldX_hi, y
	adc #$00
	sta temp
	
	bcs +	;if it's less than 0, kill it with kindness
	
	lda testX
	sec 
	sbc scrollX_hi
	lda temp
	sbc roomNumber
	bne +
	rts
+	;kill object
	lda #$f0
	sta entity_yHi, y
	rts

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
	LDA entity_xLo, y
	STA storedX_lo
	LDA entity_xHi, y
	STA storedX_hi
	LDA worldX_hi, y
	STA storedWorldX_hi

	
	lda entity_hDir, y
	cmp #LEFT
	beq @left
	
@right:
	lda entity_xLo, y
	clc
	adc entity_hAccLo, y
	sta entity_xLo, y
	lda entity_xHi, y
	adc entity_hAccHi, y
	sta entity_xHi, y
	lda worldX_hi, y
	adc #$00
	sta worldX_hi, y
	
	rts
	
@left:
	lda entity_xLo, y
	sec
	sbc entity_hAccLo, y
	sta entity_xLo, y
	lda entity_xHi, y
	sbc entity_hAccHi, y
	sta entity_xHi, y
	lda worldX_hi, y
	sbc #$00
	sta worldX_hi, y 
	

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
	
	
Player:

	lda collided
	beq @hitDone
	inc collided
	
	cmp #$01
	bne @notFirstFrame
	
	lda entity_hDir
	eor #%11000000
	sta entity_hDir
	
	;;ADD DAMAGE HERE later
	dec entity_hp
	dec entity_hp
	
	lda #$05
	jsr PRGBankWrite
	jsr updateHP
	;;
	
@notFirstFrame:
	lda collided
	cmp #$60	;iframes done
	bne @stillIframes
	lda #$00
	sta collided
	jmp @hitDone

@stillIframes:
	lda collided
	cmp #STUN_TIME
	bne @stillStunned
	lda entity_hDir
	eor #%11000000
	sta entity_hDir
	
	jmp @hitDone
	
@stillStunned:
	lda collided
	cmp #STUN_TIME
	bcs @hitDone
	
	lda #$40
	sta entity_hAccLo
	lda #$00
	sta entity_hAccHi
	
	jmp @skipInputs

	
@hitDone
	;; [USER INPUT]
	JSR ReadController
	JSR CheckInputs

@skipInputs:	
	ldy entity_counter

	jsr applyGravity
	
	lda entity_hAccHi
	ora entity_hAccLo
	beq @noHorizontalMovement
	
	jsr horizontalMovement
	jsr BgrCollisionHorizontal
	
	
@noHorizontalMovement	

	
	jsr verticalMovement
	jsr BgrCollisionVertical


	lda #$06
	jsr PRGBankWrite
	jmp Animation_Player
	
	rts

;BLOB

AI_Blob:

	;check if dead/off screen
	lda entity_yHi, y
	cmp #$f0
	bne @alive
	
	lda entity_index, y
	jsr GetActiveBit
	eor temp
	sta actives, x
	
	jsr ReturnFreeSlot
	rts
@alive

	ldy entity_counter
	lda #$01
	sta entity_hAccHi, y
	
	jsr applyGravity
	
	jsr horizontalMovement
	jsr BgrCollisionHorizontal
	
	jsr verticalMovement
	jsr BgrCollisionVertical
	
	jsr CheckOffscreen
	cmp #$f0
	beq @end
	
	lda #$06
	jsr PRGBankWrite
	
	lda #BLOB_SPRITE
	jsr Animation_Generic
	
	lda collided
	bne @skipPlayerCollision
	jsr PlayerObjectCollision
@skipPlayerCollision:
	
	
	lda #$05
	jsr PRGBankWrite
	ldx entity_counter
	jmp PlayerBulletCollision

@end	
	rts
	
;STOMPER
AI_Stomper:
	
	;check if dead/off screen
	lda entity_yHi, y
	cmp #$f0
	bne @alive
	
	lda entity_index, y
	jsr GetActiveBit
	eor temp
	sta actives, x
	
	jmp ReturnFreeSlot
@alive

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
	jsr BgrCollisionVertical
	
	jsr CheckOffscreen
	cmp #$f0
	beq @end
	
	lda collided
	bne @skipPlayerCollision
	jsr PlayerObjectCollision
@skipPlayerCollision:

	lda #$05
	jsr PRGBankWrite
	
	ldx entity_counter
	jsr PlayerBulletCollision

@end	
	rts

;;PICKLE
AI_Pickle:
	;check if dead/off screen
	lda entity_yHi, y
	cmp #$f0
	bne @alive
	
	lda entity_index, y
	jsr GetActiveBit
	eor temp
	sta actives, x
	
	jmp ReturnFreeSlot
@alive

	lda #$01
	sta entity_hAccHi, y
	jsr horizontalMovement
	
	jsr CheckOffscreen
	cmp #$f0
	beq @end
	
	lda #$06
	jsr PRGBankWrite
	
	lda #PICKLE_SPRITE
	jsr Animation_Generic
	
	lda collided
	bne @skipPlayerCollision
	jsr PlayerObjectCollision
@skipPlayerCollision:
	
	lda #$05
	jsr PRGBankWrite
	ldx entity_counter
	jmp PlayerBulletCollision
@end
	
	rts

	
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

	lda #$04
	sta entity_hAccHi, y
	jsr horizontalMovement

	jmp CheckOffscreen

	rts
	
AI_Cannon:
	;check if dead/off screen
	lda entity_yHi, y
	cmp #$f0
	bne @alive
	
	lda entity_index, y
	jsr GetActiveBit
	eor temp
	sta actives, x
	
	jmp ReturnFreeSlot
@alive

	lda frameCounter
	and #%001111111
	cmp #$20
	
	bne +
	
	lda #$04
	jsr PRGBankWrite
	
	lda entity_xHi, y
	sta spawn_x
	lda entity_yHi, y
	sta spawn_y
	lda #ARC_BULLET
	sta spawn_type
	lda worldX_hi, y
	sta spawn_room
	lda #$06
	sta spawn_vAccHi
	
	lda entity_xHi

	lda #LEFT
	sta spawn_dir 
	jsr SpawnEnemy	
	
	lda #RIGHT
	sta spawn_dir
	jsr SpawnEnemy
+

	jsr CheckOffscreen
	cmp #$f0
	beq @end
	
	lda collided
	bne @skipPlayerCollision
	jsr PlayerObjectCollision
@skipPlayerCollision:

@end:
	rts
	
AI_GenericArcBullet:
	;check if dead/off screen
	lda entity_yHi, y
	cmp #$f0
	bne @alive
	
	jmp ReturnFreeSlot
@alive
	
	jsr applyGravity
	
	lda #$01
	sta entity_hAccHi, y
	
	jsr horizontalMovement
	jsr verticalMovement
	jsr BgrCollisionVertical
	
	jsr CheckOffscreen
	cmp #$f0
	beq @end
	
	lda collided
	bne @skipPlayerCollision
	jsr PlayerObjectCollision
@skipPlayerCollision:

@end
	rts
	
	
	

	