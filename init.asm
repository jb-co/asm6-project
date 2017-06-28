ReadMetaTiles:
	

	LDA #$00
	STA counter
	STA colCount
	STA rowCount
	TAY
	TAX
	
	LDA #<(METABUFFER_RAM)
	STA pMetaBuffer_lo
	LDA #>(METABUFFER_RAM)
	STA pMetaBuffer_hi
	
	LDY #$00
	LDA MetaTileSets, y
	STA pMetaTileSet
	
	
	LDY #$02
	LDA MetaTileSets, y
	STA pMetaTile
	LDA MetaTileSets+1, y
	STA pMetaTile+1
	
	ldy #$01
	lda (pMetaTile), y

	LDA #<(columnData)
	STA pColumnData_lo
	LDA #>(columnData)
	STA pColumnData_hi
	ldx #$00
	
ABloop:
	
	LDA #$00
	CLC
	ADC rowCount ;;add current tile x
	TAY
	
	LDA (pColumnData_lo), y
	
	CMP #$FF
	BNE notEndOfFile
	rts
notEndOfFile:
	
	TAY
	
	LDA MetaTileSets, y
	STA pMetaTile
	LDA MetaTileSets+1, y
	STA pMetaTile+1
	
	;;FIRST TILE
	LDY #$00
	lda (pMetaTile), y
	
	LDY counter
	
	STA (pMetaBuffer_lo), y
	
	;;;SECOND TILE
	LDY #$02
	LDA (pMetaTile), y
	
	inc counter
	LDY counter
	
	STA (pMetaBuffer_lo), y
	
	
	;;THIRD TILE
	LDY #$01
	LDA (pMetaTile), y
	STA cdTiles, x
	inx
	
	LDY #$03
	LDA (pMetaTile), y
	STA cdTiles, x
	inx
	
	
	inc counter
	
	inc rowCount
	

	LDA rowCount
	CMP #$10
	BNE ABloop
	
	
	;;ADD 32 to the pointer
	LDA pMetaBuffer_lo
	CLC
	ADC #$20
	STA pMetaBuffer_lo
	LDA pMetaBuffer_hi
	ADC #$00
	STA pMetaBuffer_hi
	
	LDY #$00
	LDX #$00
	STX rowCount
	
-CDloop: ;CDloop
	LDA cdTiles, x
	STA  (pMetaBuffer_lo), y
	iny
	inx
	LDA cdTiles, x
	STA  (pMetaBuffer_lo), y
	inx
	iny
	CPX #$20
	BNE -CDloop
	
	;;ADD 32 to the pointer
	LDA pMetaBuffer_lo
	CLC
	ADC #$20
	STA pMetaBuffer_lo
	LDA pMetaBuffer_hi
	ADC #$00
	STA pMetaBuffer_hi
	
	LDA #$00
	STA counter;
	
	inc colCount ; This means we completed a column of cd tiles = full metatile row
		
	lda pColumnData_lo
	clc
	adc #$10
	sta pColumnData_lo
	lda pColumnData_hi
	adc #$00
	sta pColumnData_hi
	
	lda colCount
	CMP #$10
	BNE screenNotFilled
	lda #$00
	sta colCount
screenNotFilled:
	ldx #$00
	ldy #$00

	JMP ABloop

	rts
	
InitSlots:
	ldy #$01
	ldx #$02
	sty firstFreeSlot


-	txa
	sta nextFreeSlot, y
	iny 
	inx
	cpy #10
	bne -

	lda #$ff
	sta nextFreeSlot, y
	sta firstActiveSlot
	ldy #$00
	sta nextActiveSlot, y
	ldy #$01
	sta nextActiveSlot, y
		

	;init player bullets array
	
	ldy #$00
	lda #$ff

-	sta playerBullets, y
	iny
	cpy #$03
	bne -
		
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
	sta entity_airborne
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
	
	LDA #$40
	STA gravity
	
	STA entity_yHi
	
	LDA #$80
	STA entity_xHi

	sta deltaX
	
	lda #%11000000
	sta entity_flags
	
	lda #$10
	sta entity_width
	sta entity_height
	
	lda #RIGHT
	sta entity_hDir
	
	lda #$00
	sta entity_type
	lda #$B0
	sta entity_sprite
	
	
	;init sound
	lda #$0F
	sta $4015 
	
	rts
	
InitializeNametables:
	
	LDA #$01
	STA nametable
	
	InitializeNametablesLoop:
	JSR DrawNewColumn     ; draw bg column
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
	JSR DrawNewColumn     ; draw first column of second nametable

	LDA tempX_lo            ; go to next column
	CLC
	ADC #$08
	STA tempX_lo
	
	CMP #$00
	BNE InitializeNametables2Loop

	LDA #$00              ; set back to increment +1 mode
	STA $2000
 
  rts