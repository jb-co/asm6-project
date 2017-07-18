DrawNewColumn:

	
DrawColumn:
	LDA #%00000100        ; set to increment +32 mode
	STA $2000

	LDA $2002             ; read PPU status to reset the high/low latch
	LDA columnHigh
	STA $2006             ; write the high byte of column address
	LDA columnLow
	STA $2006             ; write the low byte of column address
	LDX #$1E              ; copy 30 bytes
	LDY #$00
	
-DrawColumnLoop:
	LDA (pMetaBuffer_lo), y
	STA $2007
	INY
	DEX
	BNE -DrawColumnLoop

	RTS
	
	
NewColumnCheck:
	
	lda entity_flags
	and #%01000000
	bne skipRightReDraw
	
	LDA scrollX_hi
	STA tempX_lo
	clc			
	lda tempX_lo
	adc #$80
	sta tempX_lo			; store sum of LSBs
	lda roomNumber		; add the MSBs using carry from
	adc #$01
	sta tempX_hi			; the previous calculation
	
	;JSR DrawNewColumn         ; if lower bits = 0, time for new column

	rts
	
skipRightReDraw: ;;LEFT REDRAW
	
	LDA scrollX_hi
	STA tempX_lo
  
	sec			
	lda tempX_lo
	sbc #$78
	sta tempX_lo			
	lda roomNumber
	sbc #$00			
	sta tempX_hi			
	
	;JSR DrawNewColumn


	rts
	
	
UpdateAttributes:
	LDY #$00
	ldx #$00

	LDA $2002             ; read PPU status to reset the high/low latch
@DrawNewAttributesLoop
	LDA att_hi
	STA $2006             ; write the high byte of column address
	LDA att_lo
	STA $2006             ; write the low byte of column address
	
	LDA (pAttrBuffer_lo), y   ; THIS WILL BE GRABBED FROM THE RAM BUFFER
	STA $2007
	
	iny
	cpy #$08              ; copy 8 attribute bytes
	BEQ @DrawNewAttributesLoopDone 

	LDA att_lo         ; next attribute byte is at address + 8
	CLC
	ADC #$08
	STA att_lo
	JMP @DrawNewAttributesLoop
@DrawNewAttributesLoopDone:
	rts