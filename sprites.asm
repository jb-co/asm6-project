UpdateSprites:

	;clear OAM
	ldx #$0c
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
	beq +done
	
-loop
	jsr DrawObject

	lda nextActiveSlot, y
	cmp #$ff
	beq +done

	tay
	
	jmp -loop
+done

	rts
	
; Draws objects of size entity_width x entity_height
DrawObject:

	lda #$00 	
	sta testY
	ldx sprite_counter
	
	lda entity_xHi, y
	sec 
	sbc scrollX_hi
	sta tempPos
	
	lda entity_width, y 
	lsr a
	sta temp
@yLoop

	lda #$00
	sta testX
	
	lda testY
	asl a
	sta counter
	
	lda entity_flags, y
	and #%01000000
	beq @xLoop		;if the sprite is flipped, add width and draw in reverse order
	
	lda entity_width, y
	lsr a
	lsr a
	lsr a
	clc
	adc counter
	sta counter
	dec counter
	
@xLoop
		
		;check if sprite is in the wrong room 
		lda entity_xHi, y 
		clc
		adc testX 
		sta temp
		lda worldX_hi, y
		adc #$00
		sta tempRoom
		
		bcs @next	
	
		lda temp
		sec 
		sbc scrollX_hi
		lda tempRoom
		sbc roomNumber
		bne @next 
		
		;sprite number
		lda entity_sprite, y
		clc
		adc counter
		sta SPRITE_RAM+1, x
		
		;sprite direction and palette
		lda entity_flags, y
		sta SPRITE_RAM+2, x
		
		;sprite x
		LDA tempPos
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

		lda entity_flags, y
		and #%01000000
		beq @right
		dec counter
		jmp @evaluate
@right
		inc counter
@evaluate				;check if x has reached entity width
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
	
	

	
