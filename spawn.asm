;Gets object byte in Actives table. A = index. 
;Correct bit is stored in temp.
;use AND to read bit and EOR to flip
GetActiveBit:

	sta testX
	
	and #%00000111	;get remainder to get bit in byte
	tax 
	lda BitPos, x
	sta temp
	
	lda testX
	lsr a  ;div 8 to get byte in Actives table
	lsr a 
	lsr a
	tax
	lda actives, x
	
	rts
	
FullRoomSpawn:

	lda #$04
	jsr PRGBankWrite
	
	ldy roomNumber
	
	lda #$60
	sta sourceHi
	lda pEnemyDataPointers, y
	sta sourceLo
	
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
	
	ldy #$04
	lda (sourceLo), y ;index
	jsr GetActiveBit
	ora temp
	sta actives, x
	
	ldy #$05 ; which room to spawn in (can be different for globals)
	lda (sourceLo), y
	sta spawn_room
	
	jsr SpawnEnemyFromMap
	
	lda sourceLo
	clc
	adc #$06
	sta sourceLo
	
	jmp @loop
	
@endLoop

	lda #$00
	jsr PRGBankWrite
	rts


EnemySpawnRight:

	lda #$04
	jsr PRGBankWrite
	
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
	adc #$06
	sta sourceLo
	
	
	jmp @checkLoop
	
@spawn
	ldy #$04
	lda (sourceLo), y ;index
	jsr GetActiveBit
	sta testX
	and temp 
	
	bne @notASpawn
	
	lda testX
	ora temp
	
	sta actives, x
	
	lda #RIGHT
	sta temp
	
	;lda scrollX_hi
	;sta spawn_x
	
	jsr SpawnEnemyFromMap

@notASpawn

	lda #$00
	jsr PRGBankWrite
	rts
	
EnemySpawnLeft:
	
	lda #$04
	jsr PRGBankWrite
	
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
	adc #$06
	sta sourceLo
	
	
	jmp @checkLoop
	
@spawn
	ldy #$04
	lda (sourceLo), y ;index
	jsr GetActiveBit
	sta testX
	and temp 
	
	bne @notASpawn
	
	lda testX
	ora temp
	
	sta actives, x
	
	lda #LEFT 
	sta temp
	
	lda roomNumber
	sta spawn_room
	
	jsr SpawnEnemyFromMap

@notASpawn
	lda #$00
	jsr PRGBankWrite
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
	sta entity_flags, x
	
	;;RESET stuff
	lda #$00
	sta entity_vAccHi, x
	sta entity_vAccLo, x
	sta entity_xLo, x
	sta entity_timer, x
	
	lda #$01
	sta entity_airborne, x
	
	;;SET OBJ DIRECTION
	lda deltaX	;; opposite of player facing direction
	bmi +
	lda #%01000000
	ora entity_flags, x
	jmp ++
+
	lda #%10111111
	and entity_flags,x
++	
	sta entity_flags, x
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
	lda #$01
	sta entity_airborne, x
	
	lda #$ee
	sta entity_index, x
	
	lda spawn_type
	sta entity_type, x
	
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
	
	ldy #$03 ;palette 
	lda (pMetaTile), y
	ora spawn_dir	;set object direction 
	sta entity_flags, x
		
	;;RESET stuff
	lda #$00
	sta entity_vAccLo, x
	sta entity_hAccLo, x
	
	lda spawn_vAccHi
	sta entity_vAccHi, x
	
	lda spawn_hAccHi
	sta entity_hAccHi, x
	
	lda spawn_sprite
	bne +
	ldy #$02
	lda (pMetaTile), y		
+
	sta entity_sprite, x
	
	rts
	
SpawnPlayerBullet:

	;GET BULLET SLOT (why keep this in separate routine?!!)
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
	;;
	
	stx nextActiveSlot ;set the bullet as next slot after player to avoid shenanigans
	
	lda #$ee
	sta entity_index, x
	
	lda #BULLET
	sta entity_type, x
	
	lda #$08
	sta entity_width, x
	sta entity_height, x
	
	lda #$81
	sta entity_sprite, x
		
	
	lda entity_yHi+0
	clc 
	adc #$07
	sta entity_yHi, x
	
	
	lda #$00
	sta entity_vAccHi, x
	sta entity_vAccLo, x

	
	lda entity_flags
	and #%01000000
	
	bne +
	ora #%00000011
	sta entity_flags, x
	;Spawn right side of player
	lda entity_xHi+0
	clc 
	adc #$0D
	sta entity_xHi, x
	lda worldX_hi
	adc #$00
	sta worldX_hi, x
	rts
+
	ora #%00000011
	sta entity_flags, x
	;Spawn left side of player
	lda entity_xHi+0
	sec 
	sbc #$05
	sta entity_xHi, x
	lda worldX_hi
	sbc #$00
	sta worldX_hi, x

	rts
	


	
