

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