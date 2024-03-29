;Bank 6, the animation bank (and probably something else?)


Animation_Player:
	
	lda collided
	beq +
	
	lda frameCounter
	and #$08
	bne +noFlicker
	lda #$f0
	sta entity_sprite
	rts
+noFlicker
	lda collided
	cmp #STUN_TIME
	bcs +
	lda Def_Player+2
	clc
	adc #$06
	jmp doneAnim
	
+
	;Idle sprite
	lda walkCounter
	bne +
	lda Def_Player+2
	jmp doneAnim
+	
	lda entity_animFrame
	and #$08
	beq @frame1
	lda Def_Player+2
	clc
	adc #$02
	jmp doneAnim
@frame1
	lda Def_Player+2
	clc
	adc #$04
doneAnim:
	sta entity_sprite

	rts

Animation_Stomper:

	ldy entity_counter
	lda entity_airborne, y
	bne +air
	lda Def_Stomper+2
	clc 
	adc #$02
	sta entity_sprite, y
	rts
+air:
	lda Def_Stomper+2
	sta entity_sprite, y

	rts

Animation_Generic:
	sta counter
	
	ldy entity_counter
	lda entity_width, y
	lsr a
	lsr a 
	lsr a 
	sta testX
	
	lda entity_animFrame, y
	clc
	adc #$01
	sta entity_animFrame, y
	and #$10
	beq @frame1
	lda counter
	jmp @doneAnim
@frame1
	lda counter
	clc
	adc testX
@doneAnim
	sta entity_sprite, y

	rts
	
	;jmp walkingAnimation