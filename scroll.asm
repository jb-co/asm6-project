ScrollLogic:

	LDA entity_hAccHi
	bmi @notRight
	
	ldy roomNumber
	lda Level1_ScrollLocks, y

	and #$01
	cmp #$01
	beq @endScrollLogic
	
	LDA entity_xHi
	sub #$80
	CMP scrollX_hi
	bmi @endScrollLogic
	
@applyScrollX	
	
	lda entity_xLo
	add entity_hAccLo
	lda entity_hAccHi
	adc scrollX_hi
	sta scrollX_hi	
	lda roomNumber	
	adc #$00
	sta roomNumber	
	

	JMP @endScrollLogic
	
@notRight
	
	lda roomNumber	
	bne @fine
	lda scrollX_hi
	beq @endScrollLogic
	
@fine
	
	lda scrollX_hi
	bne @leftScroll			;;check if scroll is just about to move in to new room
	
	ldy roomNumber
	lda Level1_ScrollLocks, y

	and #$02
	cmp #$02
	beq @endScrollLogic

@leftScroll	
	
	LDA entity_xHi
	sec
	sbc #$80
	CMP scrollX_hi
	bpl @endScrollLogic
	
@sameRoom	

	lda entity_xLo
	add entity_hAccLo
	lda entity_hAccHi
	adc scrollX_hi
	sta scrollX_hi
	
	lda #$00
	sbc #$00
	beq @endScrollLogic
	dec roomNumber ;carry is retarded when subtracting


@endScrollLogic	

;nametable swap check

	LDA roomNumber
	AND #$01
	STA nametable    
	rts