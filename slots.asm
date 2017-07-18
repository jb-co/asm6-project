GetFreeSlot:
	ldx firstFreeSlot 
	lda nextFreeSlot, x 
	sta firstFreeSlot 
	
	lda firstActiveSlot
	sta nextActiveSlot, x
	stx firstActiveSlot

	rts
	
GetFreeBulletSlot: 
	ldx firstFreeBullet
	cpx #$ff
	bne +
	rts 
+
	lda nextFreeBullet, x
	sta firstFreeBullet 
	
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
	
;reset bullets:
ClearBullets:



	rts




	

	
	