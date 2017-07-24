GetFreeSlot:
	ldx firstFreeSlot 
	lda nextFreeSlot, x 
	sta firstFreeSlot 
	
	lda firstActiveSlot
	sta nextActiveSlot, x
	stx firstActiveSlot

	rts
	

	
ReturnBulletSlot:
	lda firstFreeBullet 
	sta nextFreeBullet, y
	sty firstFreeBullet 
	
	lda nextActiveSlot, y
	
	ldy prevSlot
	cpy #$fe 
	bne +
	sta firstActiveSlot
	rts
+
	sta nextActiveSlot, y
	rts 
	
ReturnFreeSlot: ;send in index as y here
	lda firstFreeSlot 
	sta nextFreeSlot, y 
	sty firstFreeSlot 
		
	lda nextActiveSlot, y
	
	ldy prevSlot
	cpy #$fe
	bne +
	sta firstActiveSlot
	rts
+
	sta nextActiveSlot, y
	
	rts
		

FindSlotIndex:  ;;looks for a object with entity_index a
	
	
	ldy firstActiveSlot
	lda nextActiveSlot, y
	cpy #$ff
	beq @notFound
	
@loop
		txa
		cmp entity_index, y
		beq @found
		lda nextActiveSlot, y
		cmp #$ff
		beq @notFound
		
		tay
		jmp @loop
		
@notFound
	lda #$ff
	rts
@found
	lda #$00
	rts

InitSlots:
	ldy #$01
	ldx #$02 
	sty firstFreeBullet
- 	txa
	sta nextFreeBullet, y
	lda #$ff
	sta nextActiveSlot, y
	iny
	inx 
	cpy #$03
	bne -
	
	lda #$ff
	sta nextFreeBullet, y
	sta nextActiveSlot, y
	
	ldy #$05
	ldx #$06
	sty firstFreeSlot


-	txa
	sta nextFreeSlot, y
	lda #$ff
	sta nextActiveSlot, y
	iny 
	inx
	cpy #28
	bne -

	lda #$ff
	sta nextFreeSlot, y
	sta firstActiveSlot
	ldy #$00
	sta nextActiveSlot, y
	
	lda #$11
	sta endOfSlots
			
	rts




	

	
	