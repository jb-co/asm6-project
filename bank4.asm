;; [ OBJECTS ]		;;sprite_height, sprite_width, tile_number, attributebits (7-gravity, 6-bgrcollision, 5-...)



	

Objects:
	.word Def_Player, Def_Blob, Def_Stomper, Def_Pickle, Def_Bullet, Def_Cannon, Def_GenericArcBullet

level1_Objects:	;roomNumber, x, y, type, enemyIndex
	.db $00, $E0, $A7, CANNON, $03
	.db $ef
	.db $01, $40, $40, PICKLE, $04
	.db $01, $A0, $10, STOMPER, $06
	.db $01, $F0, $B7, CANNON, $07
	.db $01, $20, $20, BLOB, $02
	.db $ef
	.db $02, $40, $10, STOMPER, $08
	.db $02, $60, $40, PICKLE, $09
	.db $02, $20, $60, PICKLE, $0a
	.db $ef
	.db $03, $20, $10, STOMPER, $0b
	.db $03, $C0, $50, BLOB, $0c
	.db $03, $60, $B7, CANNON, $0d
	.db $ef
	.db $04, $A0, $37, CANNON, $0e
	.db $04, $60, $77, CANNON, $0f
	.db $04, $B0, $c7, CANNON, $10
	.db $ff
	
;so i will move these to the actual map file at some point
;$01 - right lock, $02 - left lock, $03 - both 
Level1_ScrollLocks:
	.db $02, $00, $01, $03, $03

columnData:
	db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $04, $04, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $04, $04, $04, $04, $04, $04, $04, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $04, $04, $04, $04, $04, $04, $04, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $04, $04, $04, $04, $04, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $04, $04, $04, $04, $04, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $04, $04, $04, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $04, $04, $04, $04, $04, $04, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $04, $04, $04, $04, $04, $04, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $04, $04, $04, $04, $04, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $04, $04, $04, $04, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $04, $04, $04, $04, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $04, $04, $04, $04, $06, $06, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $04, $04, $04, $04, $06, $06, $02, $02, $02 ;;16
	
	db $00, $00, $00, $00, $00, $00, $00, $04, $04, $04, $04, $06, $06, $02, $02, $02
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
	db $02, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $02, $02, $02
	db $02, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $02, $02, $02
	db $04, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $02, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $02, $02, $02
	db $04, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02, $02, $02
	db $02, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02, $02, $02
	db $02, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $00, $00, $00, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $00, $00, $00, $00, $08
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $00, $00, $00, $08
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $00, $02, $02, $02
	db $02, $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $00, $00, $02, $02, $02 ;;16
	
	db $00, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
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