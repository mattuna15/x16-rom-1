.feature labels_without_colons

.include "../../io.inc"

.import acptr
.import bsi232
.import bso232
.import bsout
.import ciout
.import cki232
.import cko232
.import close
.import clrch
.import cls232
.import crsw
.import iload
.import indx
.import isave
.import kbd_clear
.import kbd_get
.import kbd_get_stop
.import listn
.import lnmx
.import loop5
.import lstp
.import lsxp
.import opn232
.import pntr
.import prt
.import scatn
.import secnd
.import stop
.import talk
.import tblx
.import tkatn
.import tksa
.import unlsn
.import untlk

.export savesp
.export loadsp
.export setnam
.export setlfs
.export readst
.export settmo
.export setmsg
.export lkupsa
.export lkupla
.export close_all
.export nsave
.export nload
.export nclall
.export ngetin
.export nstop
.export nbsout
.export nbasin
.export nclrch
.export nckout
.export nchkin
.export nclose
.export nopen
.export udst

; XXX exports that shouldn't be
.export dfltn
.export dflto
.export la, sa, fa, fnlen
.export status
.export sal, sah

; for monitor
.export xmon2, fnadr

.segment "ZPKERNAL" : zeropage
;                      C64 location
;                         VVV
sal	.res 1           ;$AC
sah	.res 1           ;$AD
eal	.res 1           ;$AE
eah	.res 1           ;$AF
fnadr	.res 2           ;$BB addr current file name str
memuss	.res 2           ;$C3 load temps

.segment "KVAR"

; Channel I/O
;
lat	.res 10          ;    logical file numbers
fat	.res 10          ;    primary device numbers
sat	.res 10          ;    secondary addresses
status	.res 1           ;$90 i/o operation status byte
verck	.res 1           ;$93 load or verify flag
xsav	.res 1           ;$97 temp for basin
ldtnd	.res 1           ;$98 index to logical file
dfltn	.res 1           ;$99 default input device #
dflto	.res 1           ;$9A default output device #
msgflg	.res 1           ;$9D os message flag
t1	.res 1           ;$9E temporary 1
fnlen	.res 1           ;$B7 length current file n str
la	.res 1           ;$B8 current file logical addr
sa	.res 1           ;$B9 current file 2nd addr
fa	.res 1           ;$BA current file primary addr
stal	.res 1           ;$C1
stah	.res 1           ;$C2

.include "messages.s"
.include "channelio.s"
.include "openchannel.s"
.include "close.s"
.include "clall.s"
.include "open.s"
.include "load.s"
.include "save.s"
.include "errorhandler.s"

