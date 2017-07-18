 ;; [PHYSICS AND SUCH]
 
GameState_Playing:

	lda frameCounter
	and #%00000010
	cmp #$02
	bne @spawnCheckDone
	;spawn check
	LDA entity_hAccHi
	ora entity_hAccLo
	beq @spawnCheckDone
	
	lda entity_flags
	and #%01000000
	bne @notRight
	
	jsr EnemySpawnRight
	jmp @spawnCheckDone
@notRight
	jsr EnemySpawnLeft
@spawnCheckDone
  
	LDY #$00 ;entity counter loop in the future
	sty entity_counter
	
	lda firstActiveSlot		;put player first in the list
	sta nextActiveSlot, y
	
	lda #$fe
	sta prevSlot
	
	lda #$00
	sta entity_hAccHi
	sta entity_hAccLo
	
-entityPhysicsLoop

	ldy entity_counter
	
	ldx entity_type, y

	lda HitBoxes, x
	sta pHitBox
	lda HitBoxes+1, x
	sta pHitBox+1
	
	txa
	jsr DoRoutine
			
	ldy entity_counter

	lda nextActiveSlot, y
	cmp #$ff
	bne +
	rts

+	
	
	sta entity_counter
	jmp -entityPhysicsLoop

GameState_StartScreen:
	lda #$01
	jsr PRGBankWrite
	
	
	jmp StartScreen
	
GameState_HorizontalTransition:
	lda #$00
	sta collided 
	
	lda #PLAYER_SPRITE
	sta entity_sprite
	
	jsr InitSlots
	jsr ClearBullets
	
	lda entity_xLo
	clc
	adc #$40
	sta entity_xLo
	lda entity_xHi
	adc #$00
	sta entity_xHi
	lda worldX_hi
	adc #$00
	sta worldX_hi
	
	inc scrollX_hi
	inc scrollX_hi
	
	lda scrollX_hi
	and #%11111110 ; just to make sure it doesn't skip 0
	bne +
	cmp #$01
	
	inc roomNumber
	
	lda #$00
	sta gameState	;so this will set the boss state later
	sta scrollX_hi
	
	
	jsr FullRoomSpawn
+	
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
	ldx entity_counter ;transfer object index to x
	
@beginSpriteCollisionCheck
	lda entity_xHi
	sec
	sbc scrollX_hi
	sta testX
	lda entity_xHi, x
	sec
	sbc scrollX_hi
	sta testY
	
	
	;is right side >= player left
	lda testX
	clc
	adc HitBox_Player
	sta temp
	
	lda testY
	ldy #$02
	clc
	adc (pHitBox), y
	
	cmp temp
	bcc @endSpriteCollisionCheck
	
	;is left side <= player right
	lda testX
	clc 
	adc HitBox_Player+2
	sta temp
	
	lda testY
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
	
	
	
	jmp PlayHit
	
	
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
	
	
