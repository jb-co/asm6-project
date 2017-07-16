;
;	bossXacc = 2
;	(bossx - playerx) / 8 = tileDistance
;	tileDistance / bossXacc = frames to reach playerX
;	frames * gravity = jump height needed
;

IncreaseTimer:
	
	lda entity_timer, y
	clc
	adc #$01
	sta entity_timer, y
	rts
	
Boss_Pattern1:
	
	lda entity_timer, y
	bne +
	
	jsr IncreaseTimer
	lda #$04
	sta entity_vAccHi, y
	
+	

	lda entity_timer, y
	cmp #$01
	bne +
	lda #$02
	sta entity_hAccHi, y
	jsr horizontalMovement
	
	jsr applyGravity
	
	lda entity_airborne, y
	bne +
	jsr IncreaseTimer
	lda #$08
	sta entity_vAccHi, y
	
+	
	
	lda entity_timer, y
	cmp #$02
	bne +
	
	jsr applyGravity
	lda entity_yHi, y
	cmp #$40
	bcs +
	lda #$00
	sta entity_vAccHi, y
	sta entity_vAccLo, y
	jsr IncreaseTimer
+	
	lda entity_timer, y
	cmp #$03
	bcc +
	jsr IncreaseTimer
+
	lda entity_timer, y
	cmp #$08
	bne +
	
	
	lda entity_yHi, y
	sta spawn_y
	lda #ARC_BULLET
	sta spawn_type
	lda worldX_hi, y
	sta spawn_room
	lda #$00
	sta spawn_vAccHi
	
	lda #$00
	sta counter
	
	lda #$40
	sta temp

-
	lda temp
	clc
	adc counter
	sta spawn_x

	lda #LEFT
	sta spawn_dir 
	jsr SpawnEnemy	
	
	lda #RIGHT
	sta spawn_dir
	jsr SpawnEnemy
	
	lda counter
	clc
	adc #$20
	sta counter
	cmp #$a0
	bne -
	
+

	lda entity_timer, y
	cmp #$20
	bne +
	lda #$02
	sta currentBossPattern
+	
	
	rts

Boss1_Pattern2: ;move side to side
	
	jsr applyGravity
	lda entity_airborne, y
	bne +end
	
	lda entity_hDir, y
	cmp #LEFT
	bne +right
+left
	lda entity_xHi, y
	cmp #$10
	bcs +
	
	jsr IncreaseTimer
	lda #RIGHT ;change dir
	sta entity_hDir, y
+
	jmp +move
+right
	lda entity_xHi, y
	cmp #$e0
	bcc +
	
	jsr IncreaseTimer
	lda #LEFT
	sta entity_hDir, y
		
+

+move	
	
	
	lda #$57
	sta entity_sprite, y
	
	lda entity_timer, y
	and #%00000111
	cmp #$04
	bne +
	lda #$02
	sta currentBossPattern
+

	lda #$04
	sta entity_hAccHi, y
	jsr horizontalMovement
	
+end
	rts
	
Boss1_Pattern3:

	jsr IncreaseTimer
	
	lda entity_timer, y
	and #%00001111
	bne +
	
	lda entity_xHi, y
	sta spawn_x
	lda entity_yHi, y
	sta spawn_y
	lda #ARC_BULLET
	sta spawn_type
	lda worldX_hi, y
	sta spawn_room
	lda #$04
	sta spawn_vAccHi
	
	lda entity_xHi

	lda #LEFT
	sta spawn_dir 
	jsr SpawnEnemy	
	
	lda #RIGHT
	sta spawn_dir
	jsr SpawnEnemy
+
	ldy entity_counter
	lda #$40
	sta entity_hAccLo, y
	
	lda entity_xHi, y
	cmp entity_xHi 
	bcc +moveRight
+moveLeft
	lda #LEFT 
	sta entity_hDir, y
	jmp horizontalMovement
+moveRight
	lda #RIGHT
	sta entity_hDir, y
	jmp horizontalMovement
	
Boss1_Patterns:
	dw Boss_Pattern1-1, Boss1_Pattern2-1, Boss1_Pattern3-1
	
BossPattern:
	tax
	lda Boss1_Patterns+1,x
	pha
	lda Boss1_Patterns,x
	pha
	rts