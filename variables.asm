 .enum $0000
;; DECLARE SOME VARIABLES HERE
;object slots
playerBullets:			.dsb 3

firstFreeSlot:		.dsb 1
firstActiveSlot:		.dsb 1

nextActiveSlot:		.dsb 12
nextFreeSlot:		.dsb 12

entity_sprite		.dsb 12
entity_type			.dsb 12


collided:		.dsb 1
frameCounter:	.dsb 1	;global frame counter
nametable:  		.dsb 1  	;which nametable to use, 0 or 1
roomNumber:		.dsb 1 	;current room

; [NMI exclusives]

columnLow:  		.dsb 1  ;low byte of new column address
columnHigh: 		.dsb 1  ;high byte of new column address
columnNumber: 	.dsb 1  ;which column of level data to draw
sourceLow:  		.dsb 1  ;source for column data
sourceHigh: 		.dsb 1
tempX_hi:		.dsb 1
tempX_lo:		.dsb 1
tempY_hi:		.dsb 1
tempY_lo:		.dsb 1

walkCounter:		.dsb 1

pGeneric: .dsb 2

	
; [never use these in NMI, ok thx bye]

temp:			.dsb 1	;generic temp variable. to be used anywhere outside of nmi, but never across routine calls!
counter:			.dsb 1	;generic counter, rules above apply

testX:			.dsb 1 	;generic variable
testY:			.dsb 1 	;generic variable


offsetX:			.dsb 1	;used for collision check
currentTile:		.dsb 1	;currently collided tile

gameState:		.dsb 1

;pointers
pEnemyDataPointers: 	.dsb 16 ;;enemy spawn pointer for each room



firstFreePlayerBullet:	.dsb 1
nextFreePlayerBullet:	.dsb 4



jumpCounter:			.dsb 1 

sourceLo:      .dsb 1  ; some pointers for loading text info
sourceHi:      .dsb 1
sourceBank:    .dsb 1

collisionResult: .dsb 1

pMetaBuffer_lo: .dsb 1 ;8
pMetaBuffer_hi: .dsb 1 ;9

pHitBox: .dsb 2 ;;for collision

verticalScroll: .dsb 1
gamePaused:	.dsb 1 ;10

isJumping:			.dsb 1; 13

worldX_hi:	.dsb 12	

scrollX_hi:	.dsb 1	

deltaX:	.dsb 1

storedX_lo:			.dsb 1
storedX_hi:			.dsb 1
storedY_lo: 			.dsb 1 ;0e
storedY_hi:			.dsb 1 ;0f
storedWorldX_lo:		.dsb 1
storedWorldX_hi:		.dsb 1

pColumnData_lo:		.dsb 1 ;10
pColumnData_hi:		.dsb 1 ;11

pMetaTileSet: .dsb 1
pMetaTile: .dsb 2

colCount: .dsb 1 ;0B
rowCount: .dsb 1

buttons:				.dsb	1	;player 1 button data 
cdTiles: .dsb 4

sleeping .dsb 1

 current_bank: .dsb 1
   source_lo:	.dsb 1
   source_hi: .dsb 1
   
;;ENTITIES!!!!
entity_xLo			.dsb 12	
entity_xHi			.dsb 12	
entity_yLo			.dsb 12
entity_yHi			.dsb 12
entity_vAccLo		.dsb 12
entity_vAccHi		.dsb 12
	
entity_hAccLo		.dsb 12
entity_hAccHi		.dsb 12
entity_hDir			.dsb 12



entity_counter 		.dsb 1
entity_pointer 		.dsb 12

entity_height		.dsb 12
entity_width		.dsb 12


entity_timer		.dsb 12
entity_animFrame 	.dsb 12

entity_attributes	.dsb 12
entity_airborne		.dsb 12
entity_index		.dsb 12	

entity_center		.dsb 12

waitCounter			.dsb 1
gravity				.dsb 1

OAMdirection		.dsb 1
collidedWithIndex	.dsb 1

B_down				.dsb 1
A_down				.dsb 1

;;spawn info
spawn_type			.dsb 1
spawn_room			.dsb 1
spawn_x				.dsb 1
spawn_y				.dsb 1
spawned				.dsb 1	

sprite_counter		.dsb 1



.ende






	

