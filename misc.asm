
;8-bit addition, A + \1
macro add x
	clc
	adc #x
	endm
	
;8-bit subtraction, A - \1
macro sub x
	sec
	sbc #x
	endm

;;16-bit addition, 1 - addLo, 2 - addHi, 3 - sourceLo, 4 - sourceHi	
macro add_16 w, x, y, z
	lda #y
	clc
	adc #w
	sta #y
	lda #z
	adc #x
	sta #z
	endm
	
;;16-bit subtraction 1 - addLo, 2 - addHi, 3 - sourceLo, 4 - sourceHi	
macro sub_16 w, x, y, z
	lda #y
	sec
	sbc #w
	sta #y
	lda #z
	sbc #x
	sta #z
	endm
	
;;division by 8
macro div8
	lsr a
	lsr a
	lsr a
	endm
	
;;negate a	
macro neg
	eor   #$FF
	inc   A
	endm
	
macro halfWidth x
	lda entity_width, #x
	lsr a
	endm