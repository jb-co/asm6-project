Collision_Routines:
	.word Collision_Player-1, Collision_Blob-1, Collision_Stomper-1, Collision_Pickle-1, Collision_Bullet-1
	
;hitboxes
HitBox_Player:
	.db $01, $00, $0F, $10
HitBox_Blob:
	.db $00, $00, $07, $08
HitBox_Stomper:
	.db $01, $00, $0F, $18
HitBox_Pickle:
	.db $00, $00, $10, $10
HitBox_Bullet:
	.db $00, $00, $08, $08
	
HitBoxes:
	.dw HitBox_Player, HitBox_Blob, HitBox_Stomper, HitBox_Pickle, HitBox_Bullet

restoreY:

	;LDY entity_counter
	LDA #$00
	STA entity_vAccHi, y
	STA entity_vAccLo, y
	LDA storedY_hi
	STA entity_yHi, y
	LDA storedY_lo
	STA entity_yLo, y
	rts
	
	
restoreX:
	;LDY entity_counter
	LDa storedX_hi
	STA entity_xHi, y
	LDA storedX_lo
	STA entity_xLo, y
	LDA #$00
	STA entity_hAccHi, y
	STA entity_hAccLo, y
	LDA storedWorldX_hi
	STA worldX_hi, y
	rts
	
;; Collision Routines, Tile value is loaded in A, this will probably not be in here in the future
	
;;PLAYER
Collision_Player:
	
	lda collisionResult
	and #%00110000
	beq @horizontal

@vertical
	lda currentTile
	cmp #$08  ;;check for down transition
	BNE @notTransition
	rts
	;jmp VerticalTransition
	
@notTransition	
	;;if moving down reset jumpCounter
	lda collisionResult
	cmp #%00100000
	beq @hitUp
	
@hitDown
	
	lda isJumping
	beq @skipS
	;jsr PlayThud
@skipS
	STY isJumping
@hitUp	
	jmp restoreY

@horizontal
	jmp restoreX
	
	
;; Really basic collision objects goes here
Collision_Bullet:
Collision_Blob:
Collision_Stomper:
Collision_Pickle:

	lda collisionResult
	and #%00110000
	beq @horizontal

@vertical
	jmp restoreY
@horizontal
	
	lda entity_hDir, y		;flip the horizontal dir bits
	eor #%11000000
	sta entity_hDir, y
	jmp restoreX
	
	


	
BgrCollisionVertical:

	LDX #$00	
	stx counter

	;;Check if player is moving up or down;;
	ldx entity_counter
	LDA entity_vAccHi, x
	bpl @movingUp
	
@movingDown

	ldy #$03
	LDA (pHitBox), y
	clc
	adc entity_yHi, x
	STA testY
	
	lda #%00010000	;set down bit
	sta collisionResult
	
	JMP @collisionCheck
@movingUp
	LDA entity_yHi, x
	STA testY
	
	lda #%00100000	;set up bit
	sta collisionResult

@collisionCheck
	ldy counter	
@xOffsetLoop
	
	lda (pHitBox), y
	sta offsetX
	clc
	adc entity_xHi, x
	STA testX

	
	JSR GetTileValue
	lda currentTile
	

	BEQ @notFloor
	
	;;call routines
	ldy entity_counter
	lda entity_type, x
	jsr CollisionRoutine	
	jmp @end
	rts
	
@notFloor:
	
	inc counter
	inc counter
	ldy counter
	CPy #$02
	BEQ @xOffsetLoop

@end	
	

	rts
	
BgrCollisionHorizontal: 
	

;;check direction
	ldx entity_counter
	LDA entity_hAccHi, x
	bmi @movingLeft
	
	
@movingRight
	ldy #$02
	lda (pHitBox), y
	sta offsetX
	clc
	adc entity_xHi, x
	sta testX
	
	lda #%01000000
	sta collisionResult
	
	JMP @collisionCheck

@movingLeft
	ldy #$00
	lda (pHitBox), y
	sta offsetX
	clc
	adc entity_xHi, x
	sta testX
	
	lda #%10000000
	sta collisionResult

@collisionCheck
	ldy #$01
	sty counter
	
@yOffsetLoop
	
	lda (pHitBox), y
	clc
	adc entity_yHi, x
	STA testY

	
	JSR GetTileValue
	lda currentTile
	

	
	BEQ @notHorizontalCollision
	
	ldy entity_counter
	lda entity_type, x
	jsr CollisionRoutine	
	jmp @end
	
	
@notHorizontalCollision
	inc counter
	inc counter
	ldy counter
	cpy #$03
	BEQ @yOffsetLoop
@end	
	
	rts