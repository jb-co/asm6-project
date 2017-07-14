GetFreeSlot:
	ldx firstFreeSlot 
	lda nextFreeSlot, x 
	sta firstFreeSlot 
	
	lda firstActiveSlot
	sta nextActiveSlot, x
	stx firstActiveSlot

	rts
	
ReturnFreeSlot: ;send in index as y here
	lda firstFreeSlot 
	sta nextFreeSlot, y 
	sty firstFreeSlot 
	
	cpy firstActiveSlot
	bne @traverseList
	
	;;object was first in list
	lda nextActiveSlot, y
	sta firstActiveSlot
	
	rts
	
@traverseList
	ldx firstActiveSlot
	
@loop
	tya
	cmp nextActiveSlot, x
	beq @foundObject
	
	lda nextActiveSlot, x
	tax
	jmp @loop

@foundObject

	lda nextActiveSlot, y
	sta nextActiveSlot, x

	rts
		
ClearActiveSlots:
	
-	
	ldy firstActiveSlot
	cpy #$ff
	beq +
	
	jsr ReturnFreeSlot
	jmp -

+
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

	;init player bullets array
	
	ldy #$00
	lda #$ff

-	sta playerBullets, y
	iny
	cpy #$03
	bne -

	rts




	

	
	