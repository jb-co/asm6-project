;; [ OBJECTS ]		;;sprite_height, sprite_width, tile_number, attributebits (7-gravity, 6-bgrcollision, 5-...)


level1_Objects:	;roomNumber, x, y, type, enemyIndex
	;.db $00, $E0, $A7, CANNON, $03
	;.db $ef
	;.db $01, $40, $40, PICKLE, $04
	;.db $01, $A0, $50, STOMPER, $06
	;.db $01, $D0, $C7, CANNON, $07
	;.db $ef
	.db $00, $d0, $bf, BOSS_1, $08

	.db $ef
	.db $03, $20, $50, STOMPER, $0b
	.db $03, $C0, $50, BLOB, $0c
	.db $03, $60, $B7, CANNON, $0d
	.db $ef
	.db $04, $A0, $37, CANNON, $0e
	.db $04, $60, $77, CANNON, $0f
	.db $04, $D0, $d0, CANNON, $10
	.db $ff
	
;so i will move these to the actual map file at some point
;$01 - right lock, $02 - left lock, $03 - both 
Level1_ScrollLocks:
	.db $02, $01, $03, $03, $03

columnData:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $10, $00, $00, $16, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $14, $00, $00, $00, $00, $00, $00, $00, $14, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $14, $00, $06, $04, $04
	db $00, $00, $00, $14, $00, $00, $00, $12, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $12, $00, $00, $00, $00, $00, $00, $00, $00, $16, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $14, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $14, $00, $16, $00, $00, $00, $16, $00, $00, $00, $00, $00, $06, $04, $04
	db $18, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $16, $00, $00, $00, $00, $00, $00, $12, $00, $00, $00, $06, $04, $04
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
	db $18, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $16, $00, $00, $00, $00, $00, $00, $12, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $14, $00, $16, $00, $18, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $16, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $14, $00, $00, $00, $00, $00, $00, $14, $00, $06, $04, $04
	db $00, $16, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $16, $00, $00, $00, $00, $0c, $0c, $0c, $06, $04, $04 ;;16
	
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $10, $00, $00, $16, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $14, $00, $00, $00, $00, $00, $00, $00, $14, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $14, $00, $06, $04, $04
	db $00, $00, $00, $14, $00, $00, $00, $12, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $12, $00, $00, $00, $00, $00, $00, $00, $00, $16, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $14, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $14, $00, $16, $00, $00, $00, $16, $00, $00, $00, $00, $00, $06, $04, $04
	db $18, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $16, $00, $00, $00, $00, $00, $00, $12, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $14, $00, $16, $00, $18, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $16, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $14, $00, $00, $00, $00, $00, $00, $14, $00, $06, $04, $04
	db $00, $16, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04
	db $00, $00, $00, $00, $00, $16, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04 ;;16
	
	db $00, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $08
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $08
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $02, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $02, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $02, $04, $04
	db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $04, $04 ;;16
	
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