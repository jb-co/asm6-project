UpdateSprites:

	;clear OAM
	ldx #$00
-
	lda #$F0
	sta SPRITE_RAM, x
	inx
	inx
	inx
	inx
	bne -
	
	LDY #$00 
	ldx #$00
	
	
	lda #$0c
	sta sprite_counter	;first 3 sprites are for health bar
	
	lda #$04
	sta OAMdirection
	
	;draw player first
	lda entity_sprite	;check if in iframes
	cmp #$f0
	beq +skipPlayer

	jsr DrawObject
+skipPlayer
	
	lda frameCounter ;base drawing order on frameCounter
	and #$01
	beq +
	
	lda #$fc	;draw backwards from $fc
	sta sprite_counter
	sta OAMdirection
+
	
	
	ldy firstActiveSlot
	cpy #$ff
	beq @done
	
@loop
	sty entity_counter
	
	
@onScreen
	ldy entity_counter
	jsr DrawObject
	
	ldy entity_counter
	lda nextActiveSlot, y
	cmp #$ff
	beq @done

	tay
	
	jmp @loop
@done

	rts
	
; Draws objects of size entity_width x entity_height
DrawObject:

	lda #$00 	
	sta testY
	ldx sprite_counter
	
@yLoop

	lda #$00
	sta testX
	
	lda testY
	asl a
	sta counter
	
	lda entity_hDir, y
	cmp #LEFT
	bne @xLoop		;if the sprite is flipped, add width and draw in reverse order
	
	lda entity_width, y
	lsr a
	lsr a
	lsr a
	clc
	adc counter
	sta counter
	dec counter
	
	
	

@xLoop
		
		lda worldX_hi, y
		cmp roomNumber
		bne @dright
		
		lda entity_width, y 
		lsr a
		sta temp
		
		lda entity_xHi, y
		sec 
		sbc scrollX_hi
		clc 
		adc testX
		clc 
		adc temp
		lda #$00
		adc #$00
		bne @next
		jmp @go

@dright	
		lda entity_xHi, y
		sec 
		sbc scrollX_hi
		clc
		adc testX
		lda #$00
		adc #$00
		bne @next

@go:
		;sprite number
		lda entity_sprite, y
		clc
		adc counter
		sta SPRITE_RAM+1, x
		
		;sprite direction
		lda entity_hDir, y
		and #%01000000
		ora entity_flags, y
		sta SPRITE_RAM+2, x
		
		;sprite x
		LDA entity_xHi, y	
		sec 
		sbc scrollX_hi
		clc 
		adc testX
		STA SPRITE_RAM+3, x		
		
		;sprite y
		LDA entity_yHi, y	
		clc
		adc testY
		STA SPRITE_RAM, x		
		
		txa
		clc 
		adc OAMdirection
		tax
@next:		
		lda #$08
		clc 
		adc testX
		sta testX

		lda entity_hDir, y
		cmp #LEFT
		bne @right
		dec counter
		jmp @evaluate
@right
		inc counter
@evaluate
		lda testX
		cmp entity_width, y
		beq @endX
		jmp @xLoop
@endX	
	
	lda testY
	clc
	adc #$08
	sta testY
	
	cmp entity_height, y
	beq @end 
	jmp @yLoop
@end 	
	
	stx sprite_counter
	rts
	
	
drawLifeMeter:
	
	lda #$05
	jsr PRGBankWrite
	
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
	
	lda #$00
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
	
