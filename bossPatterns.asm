Boss1_Pattern1:

	lda entity_vAccHi, y
	clc
	adc #$04
	sta entity_vAccHi, y
	rts
	
Boss1_Pattern2:

	rts 
Boss1_Patterns:
	dw Boss1_Pattern1-1, Boss1_Pattern2-1
	
BossPattern:
	tax
	lda Boss1_Patterns+1,x
	pha
	lda Boss1_Patterns,x
	pha
	rts