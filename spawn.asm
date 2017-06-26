FullRoomSpawn:

	lda #$04
	jsr PRGBankWrite
	
	ldy roomNumber
	
	lda #$60
	sta sourceHi
	lda pEnemyDataPointers, y
	sta sourceLo
	
	;sta gurras
	
	lda #LEFT
	sta temp
@loop

	ldy #$00
	lda (sourceLo), y	;gets roomNumber
	
	cmp roomNumber
	bne @endLoop
	
	ldy #$01
	lda (sourceLo), y	;x
	sta spawn_x
	
	lda roomNumber
	sta spawn_room
	jsr SpawnEnemyFromMap
	
	lda sourceLo
	clc
	adc #$05
	sta sourceLo
	
	jmp @loop
	
@endLoop

	lda #$00
	jsr PRGBankWrite
	rts


EnemySpawnRight:
	
	lda scrollX_hi
	clc
	adc #$ff
	and #%11110000
	sta spawn_x
	lda roomNumber
	adc #$00
	sta spawn_room	;store room spawn
	tay
	
	lda #$60
	sta sourceHi
	lda pEnemyDataPointers, y
	sta sourceLo
	
@checkLoop
	
	ldy #$00
	lda (sourceLo), y
	
	cmp spawn_room	;compare to room spawn
	bne @notASpawn
	
	ldy #$01	;;x
	lda (sourceLo), y
	
	cmp spawn_x
	beq @spawn
	
	lda sourceLo
	clc
	adc #$05
	sta sourceLo
	
	
	jmp @checkLoop
	
@spawn
	ldy #$04
	lda (sourceLo), y ;entity_index
	tax
	jsr FindSlotIndex
	beq @notASpawn
	
	lda #RIGHT
	sta temp
	
	;lda scrollX_hi
	;sta spawn_x
	
	jmp SpawnEnemyFromMap

@notASpawn
	rts
	
EnemySpawnLeft:
	
	ldy roomNumber
	
	lda #$60
	sta sourceHi
	lda pEnemyDataPointers, y
	sta sourceLo
	
	lda scrollX_hi
	and #%11110000
	sta spawn_x
	
@checkLoop
	
	ldy #$00
	lda (sourceLo), y
	
	cmp roomNumber
	bne @notASpawn
	
	ldy #$01	;;x
	lda (sourceLo), y
	
	cmp spawn_x
	beq @spawn
	
	lda sourceLo
	clc
	adc #$05
	sta sourceLo
	
	
	jmp @checkLoop
	
@spawn
	ldy #$04
	lda (sourceLo), y ;entity_index
	tax
	jsr FindSlotIndex
	beq @notASpawn
	
	
	lda #LEFT 
	sta temp
	
	lda roomNumber
	sta spawn_room
	
	jmp SpawnEnemyFromMap

@notASpawn
	rts
	

;; A reg holds room for found spawn
SpawnEnemyFromMap:
	
	;sta spawn_room
	
	jsr GetFreeSlot	;get object slot x
	
	;;GET OBJ TYPE
	ldy #$03
	lda (sourceLo), y ;entity_type
	sta entity_type, x
	
	;;SET OBJ SIZE
	asl a
	tay
	lda Objects, y
	sta pMetaTile
	lda Objects+1, y
	sta pMetaTile+1
	
	ldy #$00	;height
	lda (pMetaTile), y
	sta entity_height, x
	
	ldy #$01	;width
	lda (pMetaTile), y
	sta entity_width, x
	
	lda entity_width, x
	lsr a
	sta testX	;save width / 2
	
	;;SET X POS
	lda temp ;which side?
	cmp #LEFT
	bne @goRight
	
	lda spawn_x	;scrolls on either side of screen depending on scroll direction
	clc
	adc testX	;x - width / 2
	jmp @addWidth
@goRight
	lda spawn_x	;scrolls on either side of screen depending on scroll direction
	sec
	sbc testX	;x - width / 2
@addWidth
	
	
	STA entity_xHi, x
	
	lda spawn_room
	sta worldX_hi, x
	
	
	;;GET Y POS
	ldy #$02
	lda (sourceLo), y 
	STA entity_yHi, x
	
	;;GET OBJ INDEX
	ldy #$04
	lda (sourceLo), y ;entity_index
	sta entity_index, x
	

	;;SET OBJ TILE_NUMBER
	ldy #$02
	lda (pMetaTile), y
	sta entity_sprite, x
	
	;;GET ATTRIBUTES BITS
	ldy #$03
	lda (pMetaTile), y
	sta entity_attributes, x
	
	;;RESET stuff
	lda #$00
	sta entity_vAccHi, x
	sta entity_vAccLo, x
	
	;;SET OBJ DIRECTION
	lda entity_hDir	;; opposite of player facing direction
	cmp #LEFT
	bne @left
	lda #RIGHT
	jmp @end
@left
	lda #LEFT
@end	
	
	sta entity_hDir, x
	
	rts
	
;dynamically spawn enemy
SpawnEnemy:

	jsr GetFreeSlot ;get object slot x
	
	lda spawn_room
	sta worldX_hi, x
	
	lda spawn_x
	sta entity_xHi, x
	
	lda spawn_y
	sta entity_yHi, x
	
	lda #$00
	sta entity_xLo, x
	sta entity_yLo, x
	
	lda spawn_type
	sta entity_type, x
	
	asl a
	tay
	lda Objects, y
	sta pMetaTile
	lda Objects+1, y
	sta pMetaTile+1
	
	ldy #$00	;height
	lda (pMetaTile), y
	sta entity_height, x
	
	ldy #$01	;width
	lda (pMetaTile), y
	sta entity_width, x
	
	;;RESET stuff
	lda #$00
	sta entity_vAccHi, x
	sta entity_vAccLo, x
	
	;;SET OBJ DIRECTION
	lda entity_hDir	;; opposite of player facing direction
	cmp #LEFT
	bne @left
	lda #RIGHT
	jmp @end
@left
	lda #LEFT
@end	
	
	sta entity_hDir, x
	
	rts
	
SpawnPlayerBullet:

	ldy #$00
-
	lda playerBullets, y
	cmp #$ff
	beq +foundFree
	iny
	cpy #$03
	bne -
	rts
	
+foundFree

	jsr GetFreeSlot
	
	txa 
	sta playerBullets, y
	tya
	sta entity_index, x
	
	lda #BULLET
	sta entity_type, x
	
	lda #$08
	sta entity_width, x
	sta entity_height, x
	
	lda #$05
	sta entity_sprite, x
	
	lda entity_xHi
	sta entity_xHi, x
	
	lda entity_yHi
	sta entity_yHi, x
	
	lda worldX_hi
	sta worldX_hi, x
	
	lda #$00
	sta entity_vAccHi, x
	sta entity_vAccLo, x
	
	lda entity_hDir
	sta entity_hDir,x
	

	rts
	


	
