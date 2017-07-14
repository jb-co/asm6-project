ReadMetaTiles:
	
	ldy #$00
	
	LDA #<(METABUFFER_RAM)
	STA pMetaBuffer_lo
	LDA #>(METABUFFER_RAM)
	STA pMetaBuffer_hi
	
	LDA #<(columnData)
	STA pColumnData_lo
	LDA #>(columnData)
	STA pColumnData_hi
	
@loop:
	lda (pColumnData_lo), y
	cmp #$ff
	beq @end
	sta (pMetaBuffer_lo), y
	
	lda pColumnData_lo
	clc 
	adc #$01
	sta pColumnData_lo
	lda pColumnData_hi
	adc #$00
	sta pColumnData_hi
	
	
	lda pMetaBuffer_lo
	clc 
	adc #$01
	sta pMetaBuffer_lo
	lda pMetaBuffer_hi
	adc #$00
	sta pMetaBuffer_hi
	
	jmp @loop
@end
	rts
	
InitSlots:
	ldy #$01
	ldx #$02
	sty firstFreeSlot


-	txa
	sta nextFreeSlot, y
	iny 
	inx
	cpy #18
	bne -

	lda #$ff
	sta nextFreeSlot, y
	sta firstActiveSlot
	ldy #$00
	sta nextActiveSlot, y
	ldy #$01
	sta nextActiveSlot, y
			
	rts
	
LoadObjects:

	;roomnumber - x - y - type
	
	lda #>(SPAWN_RAM)
	sta pMetaBuffer_hi
	lda #<(SPAWN_RAM)
	sta pMetaBuffer_lo

	lda $00
	sta counter
	sta roomNumber
	tay
	tax ; x = current room
	lda pMetaBuffer_lo
	sta pEnemyDataPointers, x
	
	
@outerLoop	

	ldx counter
	ldy #$00
@innerLoop
	
	;;third enemy of first screen
	lda level1_Objects, x
	cmp #$ff
	beq @endLoadingObjects
	cmp #$ef
	beq @breakInnerLoop
	sta (pMetaBuffer_lo), y
	iny
	inx
	
	jmp @innerLoop

@breakInnerLoop

	;NEXT ROOM
	stx counter
	inc roomNumber
	inc counter
	ldx roomNumber

	tya
	clc
	adc pMetaBuffer_lo
	sta pMetaBuffer_lo
	
	sta pEnemyDataPointers, x ;beginning of each room needs a pointer, a room is terminated by $ff
	
	jmp @outerLoop
	
@endLoadingObjects	
	sta (pMetaBuffer_lo), y
	rts
	
InitVariables:
	LDA #$00
	STA worldX_hi
	STA scrollX_hi
	STA entity_xLo
	STA entity_yLo
	STA roomNumber
	sta jumpCounter
	sta verticalScroll
	sta entity_counter
	sta frameCounter
	sta entity_type
	sta temp
	sta entity_sprite
	sta gameState
	sta deltaX
	sta spawned
	sta walkCounter
	sta attributesReady
	sta columnReady
	sta collided
	sta iframes
	sta entity_airborne
	
	LDA #$40
	STA gravity
	
	STA entity_yHi
	
	LDA #$80
	STA entity_xHi

	sta deltaX
	
	lda #%00000010
	sta entity_flags
	
	lda #$10
	sta entity_width
	sta entity_height
	
	;;set hp
	lda #$12	;full hp
	sta entity_hp	
	
	;;
	
	lda #RIGHT
	sta entity_hDir
	
	lda #$00
	sta entity_type
	lda #$B0
	sta entity_sprite
	
	
	;init sound .
	lda #$0F
	sta $4015 
	
	rts
	
InitializeNametables:
	
	LDA #$01
	STA nametable
	
	InitializeNametablesLoop:
	
	jsr GenerateColumnBuffer	;generates column in RAM
	
	JSR DrawNewColumn     ; draw bg column
	
	lda tempX_lo
	and #%00011110
	bne @skipAttributes
	jsr GenerateAttributeBuffer
	jsr UpdateAttributes
	
@skipAttributes:
	
	LDA tempX_lo            ; go to next column
	CLC
	ADC #$08
	STA tempX_lo
	
	CMP #$00
	BNE InitializeNametablesLoop

	LDA #$00
	STA nametable
	
	inc tempX_hi
	LDA #$00
	STA tempX_lo
	
InitializeNametables2Loop:
	jsr GenerateColumnBuffer
	JSR DrawNewColumn     ; draw first column of second nametable
	
	lda tempX_lo
	and #%00011110
	bne @skipAttributes
	jsr GenerateAttributeBuffer
	jsr UpdateAttributes
	
@skipAttributes:
	LDA tempX_lo            ; go to next column
	CLC
	ADC #$08
	STA tempX_lo
	
	CMP #$00
	BNE InitializeNametables2Loop

	LDA #$00              ; set back to increment +1 mode
	STA $2000
 
  rts