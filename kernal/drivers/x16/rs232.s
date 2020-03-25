;----------------------------------------------------------------------
; VERA RS232 Driver
;----------------------------------------------------------------------
; (C)2019 Michael Steil, License: 2-clause BSD

.include "io.inc"

.segment "RS232"

.import dfltn, dflto
.import t1, status

.export opn232
.export cls232
.export cko232
.export cki232
.export bso232
.export bsi232

;OPEN
;
opn232:
	clc
	rts
	
;CLOSE
;
cls232:
	clc
	rts
	
;CKOUT
;
cko232:
	sta dflto
	clc
	rts

;CHKIN
;
cki232:
	sta dfltn
	clc
	rts

;BSOUT
;
bso232:
 	lda #2
 :	bit $9fc1
 	bne :-
 	lda t1
 	sta $9fc1
	rts

;BASIN
;
bsi232:
 	lda #1
 	bit $9fc0
 	bne :+
 	lda #8 ; EMPTY
 	sta status
 	lda #0
 	rts

 :	lda #0 ; OK
 	sta status
 	lda $9fc0
	rts
