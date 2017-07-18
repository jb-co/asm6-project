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
	
Boss_Pattern1_A:
	
	lda #$54
	sta entity_sprite, y
	
	lda #$04
	sta entity_vAccHi, y
	inc currentBossPattern
	rts
	

Boss_Pattern1_B:

	lda #$02
	sta entity_hAccHi, y
	jsr horizontalMovement
	
	jsr applyGravity
	
	lda entity_airborne, y
	bne +
	lda #$08
	sta entity_vAccHi, y
	inc currentBossPattern
+	
	rts

Boss_Pattern1_C:
	
	jsr applyGravity
	lda entity_yHi, y
	cmp #$40
	bcs +
	lda #$00
	sta entity_vAccHi, y
	sta entity_vAccLo, y
	sta entity_timer, y
	inc currentBossPattern
+	
	rts
	
Boss_Pattern1_D:
	
	jsr IncreaseTimer
	
	lda entity_timer, y
	cmp #$08
	bne +
	
	lda #$57
	sta entity_sprite, y
	
	lda entity_yHi, y
	sta spawn_y
	lda #ARC_BULLET
	sta spawn_type
	lda worldX_hi, y
	sta spawn_room
	lda #$00
	sta spawn_hAccHi
	sta spawn_vAccHi
	lda #$05
	sta spawn_sprite
	lda #LEFT
	sta spawn_dir 
	
	lda #$00
	sta counter
	
	lda entity_xHi
	and #$08
	clc
	adc #$08
	sta temp

-
	lda temp
	clc
	adc counter
	sta spawn_x

	jsr SpawnEnemy	
	
	lda counter
	clc
	adc #$20
	sta counter
	cmp #$00
	bne -
	
+

	lda entity_timer, y
	cmp #$20
	bne +
	lda #$00
	sta entity_timer, y
	inc currentBossPattern
+	
	
	rts

Boss1_Pattern2: ;move side to side
	
	jsr applyGravity
	lda entity_airborne, y
	bne +end
	
	lda entity_flags, y
	and #%01000000
	beq +right
+left
	lda entity_xHi, y
	cmp #$10
	bcs +
	
	jsr IncreaseTimer
	lda entity_flags, y ;change dir
	and #%10111111
	sta entity_flags, y
+
	jmp +move
+right
	lda entity_xHi, y
	cmp #$e0
	bcc +
	
	jsr IncreaseTimer
	lda entity_flags, y
	ora #%01000000
	sta entity_flags, y
		
+

+move	
	
	
	lda #$57
	sta entity_sprite, y
	
	lda entity_timer, y
	cmp #$04
	bne +
	lda #$00
	sta entity_timer, y
	inc currentBossPattern
+

	lda #$04
	sta entity_hAccHi, y
	jsr horizontalMovement
	
+end
	rts
	
Boss1_Pattern3:

	lda #$54
	sta entity_sprite, y
	
	lda frameCounter
	and #%00001111
	bne +
	
	lda #$57
	sta entity_sprite, y
	
	lda entity_xHi, y
	sta spawn_x
	lda entity_yHi, y
	sta spawn_y
	lda #GENERIC_BULLET
	sta spawn_type
	lda worldX_hi, y
	sta spawn_room

	lda #$02
	sta spawn_hAccHi

	lda #LEFT
	sta spawn_dir 
	jsr SpawnEnemy	
	
	jsr IncreaseTimer
	lda entity_timer, y
	cmp #$03
	bne +
	lda #$00
	sta entity_timer, y
	sta currentBossPattern
+
	rts
	
Boss1_Patterns:
	dw Boss_Pattern1_A-1, Boss_Pattern1_B-1, Boss_Pattern1_C-1, Boss_Pattern1_D-1
	dw Boss1_Pattern2-1, Boss1_Pattern3-1
	
BossPattern:
	asl a
	tax
	lda Boss1_Patterns+1,x
	pha
	lda Boss1_Patterns,x
	pha
	rts