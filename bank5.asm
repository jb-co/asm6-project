
; AI ROUTINES FOR DAYS!

updateHP:
	
	;;clean up health bar sprites
	ldx #$00
-
	lda #$F0
	sta SPRITE_RAM, x
	inx
	inx
	inx
	inx
	cpx #$0c
	bne -
	
	;get the correct health bar sprites
	ldy entity_hp
	lda HealthTable, y
	sta pHealth
	lda HealthTable+1, y
	sta pHealth+1
	
	ldx #$16	;xPos
	stx temp 
	
	ldx #$00
	ldy #$00 
	
-
	lda (pHealth), y
	cmp #$f0
	beq @end
	sta SPRITE_RAM+1, x
	
	lda #$14
	sta SPRITE_RAM, x
	
	lda temp
	sta SPRITE_RAM+3, x
	
	lda #PALETTE_3
	and #$03
	sta SPRITE_RAM+2, x
	
	iny
	
	lda temp 
	clc
	adc #$09
	sta temp 
	
	inx
	inx
	inx 
	inx
	cpx #$0c
	bne -

@end
	rts

PlayerBulletCollision:	
	
	lda worldX_hi, x
	sta temp
	lda entity_xHi, x
	sta testX
	lda entity_yHi, x
	sta testY
	
	;bullets are objects 1-3 always 
	ldx #$01
	stx counter
@loop
	lda entity_yHi, x
	cmp #$f0 
	bne @activeBullet
	jmp @end
	
@activeBullet
	;tax
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
	
	
	lda #$f0
	sta entity_yHi, x
	
	ldy entity_counter ;remove object (decrease hp in the future)
	sta entity_yHi, y
	
	jmp PlayHit

@end	
	inc counter
	ldx counter
	cpx #$04
	beq @done
	jmp @loop
@done	

	rts
	
HealthTable:
	dw hp0, hp1, hp2, hp3, hp4, hp5, hp6, hp7, hp8, hp9

hp0:
	db $f0
hp1: 
	db $08, $f0
hp2: 
	db $07, $f0
hp3: 
	db $06, $f0
hp4: 
	db $06, $08, $f0
hp5: 
	db $06, $07, $f0 
hp6: 
	db $06, $06, $f0
hp7:
	db $06, $06, $08
hp8: 
	db $06, $06, $07
hp9: 
	db $06, $06, $06