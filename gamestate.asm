 ;; [PHYSICS AND SUCH]
 
GameState_Playing:

	lda frameCounter
	and #%00000010
	cmp #$02
	bne @spawnCheckDone
	;spawn check
	LDA entity_hAccHi
	beq @spawnCheckDone
	Bmi @notRight
	jsr EnemySpawnRight
	jmp @spawnCheckDone
@notRight
	jsr EnemySpawnLeft
@spawnCheckDone
  
	LDY #$00 ;entity counter loop in the future
	sty entity_counter
	
	lda firstActiveSlot		;put player first in the list
	sta nextActiveSlot, y
	
@entityPhysicsLoop

	ldy entity_counter

	lda #$00
	sta entity_hAccHi, y
	sta entity_hAccLo, y
	
	

	
	lda entity_type, y
	jsr DoRoutine
	

	
	;check if entity is offscreen
	ldy entity_counter
	lda entity_width, y	;half width
	lsr a
	sec
	sbc #$01
	sta temp
	
	lda entity_xHi, y
	clc 
	adc temp
	sta testX
	lda worldX_hi, y
	adc #$00
	sta temp
	
	bcs @killit	;if it's less than 0, kill it with kindness
	
	lda testX
	sec 
	sbc scrollX_hi
	lda temp
	sbc roomNumber
	beq @alive
@killit	
	lda #$f0
	sta entity_yHi, y

	jmp @playerSkipsThis
@alive
		
	;sprite player collision (might move this to the objects later, if i found that some objects don't need it)
	tya
	beq @playerSkipsThis
	jsr PlayerObjectCollision
@playerSkipsThis
	
	ldy entity_counter
	lda nextActiveSlot, y
	cmp #$ff
	bne @notDone
	
	rts
@notDone
	
	sta entity_counter
	jmp @entityPhysicsLoop
	
	rts

;;waits for waitFrames frames with nmi running
GameState_WaitFrames:
	
	lda waitCounter
	clc 
	adc #$01 
	sta waitCounter
	
	cmp #$10
	bne @keepWaiting
	
	;moved this here. having it before drew sceen and THEN waited. Might be useful :thinkingface:
	lda #$01
	sta gamePaused
	
	lda #$00
	sta waitCounter
	sta gameState
	

@keepWaiting	
	rts
	
;hitbox overlap test
;the object type is in temp
PlayerObjectCollision:
	tax ;transfer object index to x
	
@beginSpriteCollisionCheck
	
	;is right side >= player left
	lda entity_xHi
	clc
	adc HitBox_Player
	sta temp
	
	lda entity_xHi, x
	ldy #$02
	clc
	adc (pHitBox), y
	
	cmp temp
	bcc @endSpriteCollisionCheck
	
	;is left side <= player right
	lda entity_xHi
	clc 
	adc HitBox_Player+2
	sta temp
	
	lda entity_xHi, x
	ldy #$00
	clc
	adc (pHitBox), y
	
	cmp temp
	bcs @endSpriteCollisionCheck
	
	;is top <= player bottom
	lda entity_yHi
	clc
	adc HitBox_Player+3
	sta temp
	
	lda entity_yHi, x
	ldy #$01
	clc
	adc (pHitBox), y
	
	cmp temp
	bcs @endSpriteCollisionCheck
	
	;is bottom >= player top
	lda entity_yHi
	clc
	adc HitBox_Player+1
	sta temp
	
	lda entity_yHi, x
	ldy #$03
	clc
	adc (pHitBox), y
	
	cmp temp
	bcc @endSpriteCollisionCheck
	
	;got hit
	stx collidedWithIndex
	inc collided
	
	
	
	;jmp PlayHit
	
	
@endSpriteCollisionCheck

	rts
	

PlayHit:
	lda #%10011111; Duty 10 (50%), volume F (max!)
    sta $4000
	
	 lda #$C9    ;0C9 is a C# in NTSC mode
    sta $4002
	
	lda #$01
    sta $4003
	rts
	
PlayJump
	lda #%10010110; Duty 10 (50%), volume F (max!)
    sta $4000
	
	lda #$FE    ;0C9 is a C# in NTSC mode
    sta $4002
	
	lda #%11101000
    sta $4003
	rts
	
PlayThud:
	lda #%00000001  ;Triangle channel on
    sta $4008
	
	lda #%10011111; Duty 10 (50%), volume F (max!)
    sta $4000
	
	 lda #$42    ;0C9 is a C# in NTSC mode
    sta $400A
	
	lda #$01
    sta $400B
	rts
	
	
