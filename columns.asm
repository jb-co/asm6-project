DrawNewColumn:

	;scroll is pixels, we need to divide by 8 to get tile number!

	LDA tempX_lo       ; calculate new column address using scroll register
	
	LSR A
	LSR A
	LSR A            ; shift right 3 times = divide by 8

	STA columnLow    ; $00 to $1F, screen is 32 tiles wide
	
	LDA tempX_hi ;current nametable
	AND #$01
	ASL A             ; shift up, A = $00 or $02
	ASL A             ; $00 or $04
	CLC
	ADC #$20          ; add high byte of nametable base address ($2000)
	STA columnHigh    ; now address = $20 or $24 for nametable 0 or 1
	
  
  ;;calculate tile pos
  
  ;each scrollX_hi means 32 tiles
	lda tempX_hi
	asl A
	asl A 
	asl A
	asl A
	asl A
	sta columnNumber
  
	lda tempX_lo
	lsr A
	lsr A
	lsr A

	clc
	adc columnNumber
	sta columnNumber
  
	LDA columnNumber  ; column number * 32 = column data offset
	ASL A
	ASL A
	ASL A
	ASL A
	ASL A             
	STA sourceLow
	LDA columnNumber
	LSR A
	LSR A
	LSR A
	STA sourceHigh

	LDA sourceLow       ; column data start + offset = address to load column data from
	CLC 
	ADC #<(METABUFFER_RAM)
	STA sourceLow
	LDA sourceHigh
	ADC #>(METABUFFER_RAM)
	STA sourceHigh

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
	LDA (sourceLow), y
	STA $2007
	INY
	DEX
	BNE -DrawColumnLoop

	RTS
	
	
NewColumnCheck:
	
	LDA scrollX_hi
	AND #%0000110           ; throw away higher bits to check for multiple of 8 (and lowest bit you stupid idiot)
	BNE NewColumnCheckDone    ; done if lower bits != 0
	
	ldx entity_hAccHi
	CPX #$01
	bmi skipRightReDraw
	
	LDA scrollX_hi
	STA tempX_lo
	clc			
	lda tempX_lo
	adc #$80
	sta tempX_lo			; store sum of LSBs
	lda roomNumber		; add the MSBs using carry from
	adc #$01
	sta tempX_hi			; the previous calculation
	
	JSR DrawNewColumn         ; if lower bits = 0, time for new column

	JMP doneDraw
	
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
	
	JSR DrawNewColumn
	
doneDraw:
	
NewColumnCheckDone:

	rts