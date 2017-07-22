;; [ OBJECTS ]		;;sprite_height, sprite_width, tile_number, attributebits (7-gravity, 6-bgrcollision, 5-...)


level1_Objects:	;roomNumber, x, y, type, enemyIndex, spawnInRoom
	.db $00, $20, $90, PLATFORM, $04, $01
	.db $00, $40, $a0, PLATFORM, $05, $01
	.db $00, $20, $b0, PLATFORM, $06, $02
	.db $00, $40, $c0, PLATFORM, $07, $02
	
	.db $ef
	
	;.db $01, $50, $90, STOMPER, $05
	;.db $01, $60, $80, PLATFORM, $07
	.db $ef
	;.db $02, $e0, $bf, STOMPER, $08
	.db $ef
	;.db $03, $20, $50, STOMPER, $0b
	;.db $03, $C0, $50, BLOB, $0c
	;.db $03, $60, $B7, CANNON, $0d
	.db $ef
	;.db $04, $A0, $37, CANNON, $0e
	;.db $04, $60, $77, CANNON, $0f
	;.db $04, $D0, $d0, CANNON, $10
	.db $ff
	
;so i will move these to the actual map file at some point
;$01 - right lock, $02 - left lock, $03 - both 
Level1_ScrollLocks:
	.db $02, $00, $00, $01, $03

columnData:
	db $00, $00, $00, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
	db $00, $00, $00, $10, $00, $00, $16, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $14, $00, $00, $00, $00, $00, $00, $00, $14, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $14, $00, $06, $04, $04
	db $00, $00, $00, $14, $00, $00, $00, $12, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $12, $00, $00, $00, $00, $00, $00, $00, $00, $16, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $14, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $14, $00, $16, $00, $00, $00, $16, $00, $00, $00, $00, $00, $06, $04, $04
	db $18, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $16, $00, $00, $00, $00, $00, $00, $12, $00, $00, $06, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $14, $00, $16, $00, $18, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $16, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $14, $00, $00, $00, $00, $00, $00, $14, $00, $06, $04, $04
	db $00, $16, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $16, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04 ;;16
	
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $16, $00, $00, $06, $04, $04
	db $00, $00, $00, $10, $00, $00, $16, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $14, $00, $00, $00, $00, $00, $00, $00, $14, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $14, $00, $06, $04, $04
	db $00, $00, $00, $14, $00, $00, $00, $12, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $12, $00, $00, $00, $00, $00, $00, $00, $00, $16, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $14, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $14, $00, $16, $00, $00, $00, $16, $00, $00, $00, $00, $00, $06, $04, $04
	db $18, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $04, $04
	db $00, $00, $16, $00, $00, $00, $00, $00, $00, $12, $00, $00, $06, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $14, $00, $16, $00, $18, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $16, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $14, $00, $00, $00, $00, $00, $00, $14, $00, $06, $04, $04
	db $00, $16, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $16, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04 ;;16
	
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $10, $00, $00, $16, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $14, $00, $00, $00, $00, $00, $00, $00, $14, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $14, $00, $06, $04, $04
	db $00, $00, $00, $14, $00, $00, $00, $12, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $12, $00, $00, $00, $00, $00, $00, $00, $00, $16, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $14, $00, $00, $00, $00, $00, $00, $06, $06, $04, $04
	db $00, $14, $00, $16, $00, $00, $00, $16, $00, $00, $00, $00, $00, $06, $04, $04
	db $18, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $04, $04
	db $00, $00, $16, $00, $00, $00, $00, $00, $00, $12, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $14, $00, $16, $00, $18, $00, $00, $00, $00, $00, $06, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $16, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $14, $00, $00, $00, $00, $00, $00, $14, $00, $06, $04, $04
	db $00, $16, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $16, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04 ;;16
	
	db $00, $04, $04, $04, $04, $04, $04, $04, $04, $00, $00, $00, $00, $00, $00, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $06, $04, $04
	db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $06, $04, $04 ;;16
	
	db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $02, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $04 ;;16
	db $FF
	
thisWouldBeTheSecondStage:
	db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02 ;;16
	
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $04 ;;16
	
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $00, $00, $00, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $00, $00, $00, $00, $08
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $00, $00, $00, $08
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $00, $00, $02, $02, $02 ;;16
	
	db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $08
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $08
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $02, $02, $02
	db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02 ;;16
	
	db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $02, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $04 ;;16
	db $FF ;; 32
	
	thisWouldBeTheThirdStage:
	db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02 ;;16
	
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $04 ;;16
	
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $00, $00, $00, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $00, $00, $00, $00, $08
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $00, $00, $00, $08
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $00, $00, $02, $02, $02 ;;16
	
	db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $08
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $08
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $02, $02, $02
	db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02 ;;16
	
	db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $02, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $04 ;;16
	db $FF ;; 32
	
		thisWouldBeTheFourthStage:
	db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02 ;;16
	
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $04 ;;16
	
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $00, $00, $00, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $00, $00, $00, $00, $08
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $00, $00, $00, $08
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $00, $00, $02, $02, $02 ;;16
	
	db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $08
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $08
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $02, $02, $02
	db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02 ;;16
	
	db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $02, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $02, $02, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02
	db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $04 ;;16
	db $FF ;; 32