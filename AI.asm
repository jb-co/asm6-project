
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
	
PlayerMoveLeft:
	
	lda entity_xLo 
	sec 
	sbc entity_hAccLo
	sta entity_xLo
	lda entity_xHi
	sbc entity_hAccHi
	sta entity_xHi
	lda worldX_hi
	sbc #$00
	sta worldX_hi
	
	rts 
	
PlayerMoveRight:

	lda entity_xLo 
	clc 
	adc entity_hAccLo
	sta entity_xLo
	lda entity_xHi
	adc entity_hAccHi
	sta entity_xHi
	lda worldX_hi
	adc #$00
	sta worldX_hi

	rts 
	
;returns 0 if still on screen 
CheckOffscreen:
	;check if entity is offscreen
	ldy entity_counter
	lda entity_width, y	;half width
	lsr a
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
+	
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

	lda entity_flags, y
	and #%01000000
	bne +left
	
+right:
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
	
+left:
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
	
	;;set a max vertical acc to -6
	LDA entity_vAccHi, y
	CMP #$FA
	BPL @end
	SEC
	LDA #$FA
	STA entity_vAccHi, y
	LDA #$00
	STA entity_vAccLo, y
@end
	rts
	
	
Player:

	LDA entity_xLo, y
	STA storedX_lo
	LDA entity_xHi, y
	STA storedX_hi
	LDA worldX_hi, y
	STA storedWorldX_hi
	
	
	;On platform check 
	lda platformIndex
	bne +
	jsr applyGravity
	jmp +endPlatform
+	
	tax
	
	lda #$00
	sta entity_airborne
	sta entity_vAccHi
	sta entity_vAccLo
	
	lda entity_yHi, x
	sec
	sbc #$10
	sta entity_yHi
	
	lda entity_timer, x
	beq +endPlatform
	
	sta entity_hAccHi 
	lda #$00
	sta entity_hAccLo 

	lda entity_flags, x 
	and #%01000000
	bne +left

	
	jsr PlayerMoveRight
	jmp +endPlatform
+left
	jsr PlayerMoveLeft

+endPlatform

	;Object collision check 
	lda collided
	beq +hitDone
	inc collided
	
	cmp #$01
	bne +notFirstFrame

	;;ADD DAMAGE HERE later
	dec entity_hp
	dec entity_hp
	
	lda #$05
	jsr PRGBankWrite
	jsr updateHP
	;;
	
+notFirstFrame:
	lda collided
	cmp #$60	;iframes done
	bne +stillStunned 
	lda #$00
	sta collided
	jmp +hitDone
	
+stillStunned:
	lda collided
	cmp #STUN_TIME
	bcs +hitDone
	
	lda #$40
	sta entity_hAccLo
	lda #$00
	sta entity_hAccHi
	
	;knockback direction
	lda entity_flags
	and #%01000000
	bne + 
	jsr PlayerMoveLeft 
	jmp +skipInputs
+
	jsr PlayerMoveRight
	jmp +skipInputs

+hitDone



	;; [USER INPUT]
	JSR ReadController
	JSR CheckInputs
	
	

+skipInputs:	
	ldy entity_counter
	
	jsr BgrCollisionHorizontal

	;;calculate total x-movement
	lda entity_xHi
	sec 
	sbc storedX_hi
	sta deltaX
	
	jsr verticalMovement
	jsr BgrCollisionVertical
	
	lda #$00
	sta platformIndex

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
	
	sty prevSlot
	lda #$00
	sta entity_hAccHi, y
	lda #$80
	sta entity_hAccLo, y
	
	lda entity_airborne,y
	bne @dontJump
	lda #$00
	sta entity_vAccLo, y
	lda entity_vAccHi, y
	clc
	adc #$04
	sta entity_vAccHi, y
@dontJump
	jsr applyGravity
	
	jsr horizontalMovement
	jsr BgrCollisionHorizontal
	
	jsr verticalMovement
	jsr BgrCollisionVertical
	
	jsr CheckOffscreen
	beq +
	lda #$f0
	sta entity_yHi, y
	jmp +end
+
	
	lda #$06
	jsr PRGBankWrite
	
	lda #BLOB_SPRITE
	jsr Animation_Generic
	
	lda collided
	bne +
	jsr PlayerObjectCollision
+
	
	
	lda #$05
	jsr PRGBankWrite
	ldx entity_counter
	jmp PlayerBulletCollision

+end	
	rts
	
AI_Platform:
	sty prevSlot
	jsr CheckOffscreen
	;check if dead/off screen
	beq +onScreen
	
	lda #%10000000
	ora entity_flags, y
	sta entity_flags, y
	jmp +end
+onScreen:

	lda #$06
	jsr PRGBankWrite
	
	lda #PLATFORM_SPRITE
	jsr Animation_Generic
	
	lda #%01111111
	and entity_flags, y
	sta entity_flags, y
	
	lda entity_flags, y
	and #%00000100
	bne +secondFrame
+firstFrame:	
	lda entity_yHi
	clc 
	adc #$0d
	cmp entity_yHi, y
	bcs ++
	lda #%00000100
	ora entity_flags, y
	sta entity_flags, y

++
	jmp +end
	
+secondFrame:
	;check for player feet;
	lda entity_yHi
	clc 
	adc #$12	;this offset is kind of sketchy
	cmp entity_yHi, y
	bcc +resetFrame
	
	lda entity_xHi
	sec
	sbc scrollX_hi
	clc
	adc HitBox_Player+0
	sta testX
	lda entity_xHi, y
	sec
	sbc scrollX_hi
	clc 
	adc #$10
	cmp testX
	bcc +resetFrame
	
	lda entity_xHi
	sec
	sbc scrollX_hi
	clc 
	adc HitBox_Player+2
	sta testX
	lda entity_xHi, y
	sec
	sbc scrollX_hi
	cmp testX
	bcs +resetFrame
	
	sty platformIndex
	jmp +end 
+resetFrame:
	lda #%11111011
	and entity_flags, y
	sta entity_flags, y

+end

	lda #$80
	sta entity_hAccLo, y
	lda #$00
	sta entity_hAccHi, y
	
	jsr horizontalMovement
	jsr BgrCollisionHorizontal
	
	ldy entity_counter
	lda entity_xHi, y
	sec 
	sbc storedX_hi
	bne +
	sta entity_timer, y
	rts 
+
	lda #$01
	sta entity_timer, y
	;jmp CheckOffscreen
	rts
	
;STOMPER
AI_Stomper:
	
	;check if dead/off screen
	lda entity_yHi, y
	cmp #$f0
	bne +alive
	
	lda entity_index, y
	jsr GetActiveBit
	eor temp
	sta actives, x
	
	jmp ReturnFreeSlot
+alive

	sty prevSlot
	
	lda frameCounter
	and #%00111111
	cmp #$20
	bne +
	
	lda entity_airborne, y
	bne +
	
	lda entity_vAccHi, y
	clc
	adc #$05
	sta entity_vAccHi, y
+

	jsr applyGravity
	
	jsr verticalMovement
	jsr BgrCollisionVertical
	
	ldy entity_counter
	lda entity_airborne, y
	beq +noHorizontal

	;check which side player is 
	lda entity_xHi, y
	sec 
	sbc scrollX_hi
	sta temp
	lda entity_xHi
	sec 
	sbc scrollX_hi
	
	cmp temp
	bcc +left 
+right	
	lda #%10111111
	and entity_flags, y
	sta entity_flags, y
	jmp +setDirection
+left
	lda #%01000000
	ora entity_flags, y
	sta entity_flags, y
	
+setDirection:
	
	lda #$00
	sta entity_hAccHi, y
	lda #$40
	sta entity_hAccLo, y
	
	jsr horizontalMovement
	jsr BgrCollisionHorizontal

+noHorizontal:
	jsr CheckOffscreen
	beq +
	lda #$f0
	sta entity_yHi, y
	jmp +end 
+
	
	lda collided
	bne +
	jsr PlayerObjectCollision
+

	lda #$05
	jsr PRGBankWrite
	
	ldx entity_counter
	jsr PlayerBulletCollision
	

	lda #$06
	jsr PRGBankWrite
	
	lda #STOMPER
	jsr Animation_Stomper
+end 
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
	sty prevSlot
	lda entity_timer, y
	clc
	adc #$01
	sta entity_timer, y
	
	lda #$01
	sta entity_hAccHi, y
	jsr horizontalMovement
	
	jsr CheckOffscreen
	beq +
	lda #$f0
	sta entity_yHi, y
	jmp +end 
+
	
	lda entity_timer, y
	cmp #$30
	bne +
	lda #$00
	sta entity_timer, y
+
	cmp #$04
	bne +
	
	
	lda #$04
	jsr PRGBankWrite
	
	lda entity_xHi, y
	sta spawn_x
	lda entity_yHi, y
	sta spawn_y
	lda #BLOB
	sta spawn_type
	lda worldX_hi, y
	sta spawn_room
	lda #$02
	sta spawn_vAccHi
	
	lda entity_flags, y
	and #%01000000
	sta spawn_dir
	
	jsr SpawnEnemy
+
	
	lda #$06
	jsr PRGBankWrite
	
	lda #PICKLE_SPRITE
	jsr Animation_Generic
	
	lda collided
	bne +
	jsr PlayerObjectCollision
+
	
	lda #$05
	jsr PRGBankWrite
	ldx entity_counter
	jmp PlayerBulletCollision
+end
	
	rts

	
AI_Bullet:

	;check if dead/off screen
	lda entity_yHi, y
	cmp #$f0
	bne +alive

	jmp ReturnBulletSlot
+alive
	sty prevSlot
	lda #$04
	sta entity_hAccHi, y
	jsr horizontalMovement

	jsr CheckOffscreen
	beq +
	lda #$f0
	sta entity_yHi, y
+
	rts 
	
AI_GenericBullet:
			;check if dead/off screen
	lda entity_yHi, y
	cmp #$f0
	bne +alive
	jmp ReturnFreeSlot
+alive
	sty prevSlot
	jsr horizontalMovement

	jsr CheckOffscreen
	beq +
	lda #$f0
	sta entity_yHi, y
+	
	rts 
	
	

	
AI_Cannon:
	;check if dead/off screen
	lda entity_yHi, y
	cmp #$f0
	bne +alive
	
	lda entity_index, y
	jsr GetActiveBit
	eor temp
	sta actives, x
	
	jmp ReturnFreeSlot
+alive
	sty prevSlot
	lda frameCounter
	and #%001111111
	cmp #$20
	
	bne +
	
	
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
	lda #$01
	sta spawn_hAccHi
	lda #$00 
	sta spawn_sprite
	
	lda entity_xHi

	lda #%01000000
	sta spawn_dir 
	jsr SpawnEnemy	
	
	lda #%00000000
	sta spawn_dir
	jsr SpawnEnemy
+

	jsr CheckOffscreen
	beq +
	lda #$f0
	sta entity_yHi, y
	jmp +end 
+
	
	lda collided
	bne +end 
	jsr PlayerObjectCollision

+end:
	rts
	
AI_GenericArcBullet:
	;check if dead/off screen
	lda entity_yHi, y
	cmp #$f0
	bne @alive
	
	jmp ReturnFreeSlot
@alive
	sty prevSlot
	jsr applyGravity
		
	jsr horizontalMovement
	jsr verticalMovement
	jsr BgrCollisionVertical
	
	jsr CheckOffscreen
	beq +
	lda #$f0
	sta entity_yHi, y
	jmp +end 
+
	
	lda collided
	bne +end
	jsr PlayerObjectCollision

+end
	rts
	
AI_Boss1:
	
	;set boss pattern bank
	lda #$07
	jsr PRGBankWrite
	
	
	lda currentBossPattern
	jsr BossPattern
	;;
	
	
	ldy entity_counter
	
	
	jsr verticalMovement
	jsr BgrCollisionVertical

	
	rts
	
	
	

	