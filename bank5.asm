GetTileValue: 
	
	lda testX
	and #%11110000
	sta temp
	
	LDA testY	;y / 16
	LSR A
	LSR A
	LSR A 
	LSR A
	
	clc
	adc temp
	STA pColumnData_lo ;save lo map address
	
	lda entity_xHi, x
	clc
	adc offsetX
	lda worldX_hi, x
	adc #$00
	sta temp
	
	lda #$04
	sta sourceBank
	jsr PRGBankWrite
	
	;get offset from map;
	LDA #>(columnData)
	clc
	adc temp
	STA pColumnData_hi

	LDY #<(columnData)
	LDA (pColumnData_lo), y
	
	sta currentTile
	
	lda #$05
	sta sourceBank
	jsr PRGBankWrite
	rts
	
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
	;jsr CollisionRoutine	;FIX THIS DUDE
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
	;jsr CollisionRoutine	;FIX THIS DUDE
	jmp @end
	
	
@notHorizontalCollision
	inc counter
	inc counter
	ldy counter
	cpy #$03
	BEQ @yOffsetLoop
@end	
	
	rts