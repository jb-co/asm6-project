

Player_Normal:

	LDA entity_xLo
	STA storedX_lo
	LDA entity_xHi
	STA storedX_hi
	LDA worldX_hi
	STA storedWorldX_hi
	
	
	;On platform check 
	lda platformIndex
	bne +
	jsr applyGravity
	jmp +endPlatform
+	
	tax
	
	lda #$00
	sta entity_airborne
	sta entity_vAccHi
	sta entity_vAccLo
	
	lda entity_yHi, x
	sec
	sbc #$10
	sta entity_yHi
	
	lda entity_timer, x
	beq +endPlatform
	
	sta entity_hAccHi 
	lda #$00
	sta entity_hAccLo 

	lda entity_flags, x 
	and #%01000000
	bne +left

	
	jsr PlayerMoveRight
	jmp +endPlatform
+left
	jsr PlayerMoveLeft

+endPlatform

	;Object collision check 
	lda collided
	beq +hitDone
	inc collided
	
	cmp #$01
	bne +notFirstFrame

	;;ADD DAMAGE HERE later
	dec entity_hp
	dec entity_hp
	
	lda #$05
	jsr PRGBankWrite
	jsr updateHP
	;;
	
+notFirstFrame:
	lda collided
	cmp #$60	;iframes done
	bne +stillStunned 
	lda #$00
	sta collided
	jmp +hitDone
	
+stillStunned:
	lda collided
	cmp #STUN_TIME
	bcs +hitDone
	
	lda #$40
	sta entity_hAccLo
	lda #$00
	sta entity_hAccHi
	
	;knockback direction
	lda entity_flags
	and #%01000000
	bne + 
	jsr PlayerMoveLeft 
	jmp +skipInputs
+
	jsr PlayerMoveRight
	jmp +skipInputs

+hitDone

	;; [USER INPUT]
	JSR ReadController
	JSR CheckInputs
	
+skipInputs:	
	ldy entity_counter
	
	jsr BgrCollisionHorizontal

	;;calculate total x-movement
	lda entity_xHi
	sec 
	sbc storedX_hi
	sta deltaX
	
	jsr verticalMovement
	jsr BgrCollisionVertical
	
	lda #$00
	sta platformIndex

	lda #$06
	jsr PRGBankWrite
	jmp Animation_Player

;death animation followed by transition to new try screen and despawn
Player_Dead:

    lda #PLAYER_HIT_SPRITE
    sta entity_sprite 

    jsr applyGravity
    jsr verticalMovement

    lda entity_yHi
    cmp #$e0
    bcc +

    lda #$00
    sta playerState 
    sta scrollX_hi 
    
    jsr InitSlots

    lda #$01
	jsr PRGBankWrite
	jsr DrawStartScreen

    lda #$02
    sta gameState
+
    rts 
;player routines
PlayerJump:
	
	LDA jumpCounter
	CMP #$10
	BCS +
	
	inc jumpCounter
	LDA #$04
	STA entity_vAccHi
	LDA #$40
	STA entity_vAccLo
	
+	
	inc isJumping
	
	rts
	
PlayerMoveLeft:
	
	lda entity_xLo 
	sec 
	sbc entity_hAccLo
	sta entity_xLo
	lda entity_xHi
	sbc entity_hAccHi
	sta entity_xHi
	lda worldX_hi
	sbc #$00
	sta worldX_hi
	
	rts 
	
PlayerMoveRight:

	lda entity_xLo 
	clc 
	adc entity_hAccLo
	sta entity_xLo
	lda entity_xHi
	adc entity_hAccHi
	sta entity_xHi
	lda worldX_hi
	adc #$00
	sta worldX_hi

	rts 