 .enum $0000
;; DECLARE SOME VARIABLES HERE
firstFreeBullet:	.dsb 1
nextFreeBullet:		.dsb 2

bleh	.dsb 1
bleh2	.dsb 1
collisionMask		.dsb 1

actives .dsb 4
;object slots
bulletCount	.dsb 1

firstFreeSlot:		.dsb 1
firstActiveSlot:		.dsb 1


platformIndex	.dsb 1


prevSlot	.dsb 1

currentBossPattern .dsb 1

att_hi:	.dsb 1
att_lo: .dsb 1

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

nmiTemp			.dsb 1

attributesReady:	.dsb 1
columnReady:		.dsb 1


attMask			.dsb 1
tempMask		.dsb 1

nmiCounter		.dsb 1

walkCounter:		.dsb 1

pGeneric: .dsb 2

	
; [never use these in NMI, ok thx bye]

temp:			.dsb 1	;generic temp variable. to be used anywhere outside of nmi, but never across routine calls!
counter:			.dsb 1	;generic counter, rules above apply

testX:			.dsb 1 	;generic variable
testY:			.dsb 1 	;generic variable

tempPos			.dsb 1


offsetX:			.dsb 1	;used for collision check
currentTile:		.dsb 1	;currently collided tile

gameState:		.dsb 1

pHealth:		.dsb 2

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

pAttrBuffer_lo: .dsb 1
pAttrBuffer_hi: .dsb 1

pHitBox: .dsb 2 ;;for collision

verticalScroll: .dsb 1
gamePaused:	.dsb 1 ;10

isJumping:			.dsb 1; 13



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

iframes .dsb 1

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
spawn_vAccHi		.dsb 1
spawn_hAccHi		.dsb 1
spawn_dir			.dsb 1
spawn_sprite		.dsb 1
spawned				.dsb 1	


sprite_counter		.dsb 1

;just for keeping track of memory pos
lastOne	.dsb 1

.enum $300    

nextActiveSlot:		.dsb 30
nextFreeSlot:		.dsb 30



endOfSlots	.dsb 1

;;ENTITIES!!!!
worldX_hi:			.dsb 30
entity_xLo			.dsb 30	
entity_xHi			.dsb 30	
entity_yLo			.dsb 30
entity_yHi			.dsb 30
entity_vAccLo		.dsb 30
entity_vAccHi		.dsb 30
	
entity_hAccLo		.dsb 30
entity_hAccHi		.dsb 30

entity_sprite		.dsb 30
entity_type			.dsb 30

entity_counter 		.dsb 1

entity_height		.dsb 30
entity_width		.dsb 30

entity_airborne		.dsb 30


entity_timer		.dsb 30
entity_animFrame 	.dsb 30

entity_flags		.dsb 30
entity_index		.dsb 30	

entity_hp			.dsb 1






.ende






	

