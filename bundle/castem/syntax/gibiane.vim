" Vim syntax file
" Language:	gibiane
" Maintainer:	Laurent CHAMPANEY <laurent.champaney@meca.uvsq.fr>
" ---- Date de Modification: 03 mai2003 07:33:14  ----
"
" Remove any old syntax stuff hanging around
set tabstop=2
set shiftwidth=2
set expandtab
syn clear

syn case ignore

syn keyword gibianeStatement		return continue
syn keyword gibianeLabel		go to goto
syn keyword gibianeConditional		si sinon sino finsi fins
syn keyword gibianeRepeat		repe repeter fin
"syn keyword gibianeRepeat		debp debproc finp finproc

syn keyword gibianeTodo 		contained TODO

syn region gibianeString		start=+"+ end=+"+	oneline
syn region gibianeString		start=+'+ end=+'+	oneline

" Format strings are used with READ, WRITE and PRINT
" READ and PRINT can be used without paretheses (and '(...)' is caught as '...' )
" FMTs can span several lines. This is not supoorted here for simple READ and PRINT
syn match  gibianeReadWrite		"\<\(read\|print\)\>"
"syn region gibianeFormatString		contained start=+'(+ end=+)'+ contains=gibianeContinueLine
syn region gibianeReadWriteFunc		matchgroup=gibianeReadWrite start="\(read\|write\)\s*("rs=e-1,he=e-1 skip=")'" matchgroup=NONE end=")" contains=gibianeFormatString

" If you don't like initial tabs in gibiane (or at all)
"syn match gibianeIniTab		"^\t.*$"
"syn match gibianeTab			"\t"

" This is valid with Gnu gibiane
"syn match  gibianeSpecial contained "\\\d\{3}\|\\."
"syn region gibianeString	start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=gibianeSpecial
"syn region gibianeString	start=+'+ skip=+\\\\\|\\"+ end=+'+ contains=gibianeSpecial

" Any integer
syn match gibianeNumber		"-\=\<\d\+\>"
" floating point number, with dot, optional exponent
syn match gibianeFloat		"\<\d\+\.\d*\([edED][-+]\=\d\+\)\=\>"
" floating point number, ending with dot, no exponent
syn match gibianeFloat		"\<\d\+\.\>"
" floating point number, starting with a dot, optional exponent
syn match gibianeFloat		"\.\d\+\([edED][-+]\=\d\+\)\=\>"
" floating point number, without dot, with exponent
syn match gibianeFloat		"\<\d\+[edED][-+]\=\d\+\>"

syn keyword gibianeOperator		> < >EGA ega <EGA
"syn match gibianeOperator		"\.\(eq\|ne\|eqv\|neqv\)\."
"syn match gibianeOperator		"\.\(and\|or\|not\)\."

syn match gibianeLogicalConstant	"\.\(vrai\|faux\)\."

"syn match gibianeIdentifier		"\<[a-zA-Z_][a-zA-Z0-9_]*\>"

"syn match gibianeDelimiter		"[()]"

" any character other than a 'c' or '!' in the first column is an error
" (labelnumbers iare handled below, though)
"syn match gibianeCommentError		"^\ \{,4}[^\ \t0-9].*$"
syn match gibianeComment	"^[*].*$"
"syn match gibianeComment	"^[*].*$"	contains=gibianeTodo,gibianeTab
"syn match gibianeComment	"!.*$"		contains=gibianeTodo,gibianeTab
"syn match gibianeContinueLine		"^\ \{5}\S"ms=e

"syn match gibianeNoLabelNumber		"^\d\{5}\S.*$"
"syn match gibianeNoLabelNumber		"^\ \d\{4}\S.*$"
"syn match gibianeNoLabelNumber		"^\ \{2}\d\{3}\S.*$"
"syn match gibianeNoLabelNumber		"^\ \{3}\d\{2}\S.*$"
"syn match gibianeNoLabelNumber		"^\ \{4}\d\S.*$"

"syn match gibianeLabelNumber		"^\d\{1,5}\>"
"syn match gibianeLabelNumber		"^\ \d\{1,4}\>"
"syn match gibianeLabelNumber		"^\ \{2}\d\{1,3}\>"
"syn match gibianeLabelNumber		"^\ \{3}\d\{1,2}\>"
"syn match gibianeLabelNumber		"^\ \{4}\d\>"

"syn match gibianePreCondit		"^#define\>"
"syn match gibianePreCondit		"^#include\>"

" Treat all past 72nd column as a comment. Do not work with tabs!
" Breaks down when 72-73rd column is in another match (eg number or keyword)
syn match  gibianeComment		"^.\{-72}.*$"lc=72

 syn match  gibianeType "\'\(MOT\| ENTIER\| FLOTTANT\| LOGIQUE\)\'"
 syn match gibianeType  "\'\(MAILLAGE\| LISTENTI\| POINT\| LISTREEL\)\'"
 syn match  gibianeType "\'\(CHPOINT\| RIGIDITE\| TEXTE\| STRUCTUR\)\'"
 syn match  gibianeType "\'\(ATTACHE\| SOLUTION\| BASEMODA\| CHAMELEM\)\'"
 syn match  gibianeType "\'\(AFFECTE\| VECTDOUB\| LISTMOTS\| DEFORME\)\'"
 syn match  gibianeType "\'\(LISTCHPO\| CHARGEME\| EVOLUTIO\| MODELE\)\'"
 syn match  gibianeType "\'\(VECTEUR\| TABLE\| PROCEDUR\| ELEMSTRU\)\'"
 syn match  gibianeType "\'\(BLOQSTRU\| MCHAML\| MMODEL\| ANNULE\)\'"
 syn match  gibianeType "\'\(NUAGE\| MATRIK OBJET\)\'"


syn keyword gibianeStructure	common dimension equivalence external
syn keyword gibianeStructure	intrinsic parameter save

syn keyword gibianeUnitHeader	debp debproc finp finproc

" READ, WRITE and PRINT are handled above (as they take FMT arguments)
syn keyword gibianeReadWrite	backspace close inquire open rewind

syn keyword gibianeFormat	access blank err file fmt form format
syn keyword gibianeFormat	iostat rec recl status unit

syn keyword gibianeStopPause	stop pause

syn keyword gibianeImplicit	abs acos aint atan asin cos cosh aimag
syn keyword gibianeImplicit	anint atan2 char cmplx conjg dble dim
syn keyword gibianeImplicit	dprod exp ichar index int len lge lgt
syn keyword gibianeImplicit	lle llt log log10 max min mod nint sin
syn keyword gibianeImplicit	sinh sign sqrt tan tanh

syn keyword gibianeOperateur OPTI[ON]  DUMP DENS[ITE] D[ROITE] LAPL CERC MOTA
syn keyword gibianeOperateur QUEL INTE PARA ELLI ET POIN PLUS MOIN TRAN
syn keyword gibianeOperateur ROTA TRAC INVE COTE ELEM CONT DIFF CHAN LIST
syn keyword gibianeOperateur SURF CONF INFO TOUR HOMO AFFI SYME INCL ELIM
syn keyword gibianeOperateur TITR RACC TASS SORT LIRE BARY DALL ORIE MANU
syn keyword gibianeOperateur OUBL COMP COUT PAVE COMM NOEU MOT NBEL NBNO
syn keyword gibianeOperateur NOTI FACE COOR NORM TEMP VOLU LECT SAUF PROG
syn keyword gibianeOperateur FLOT ENTI LOG EXP  C
syn keyword gibianeOperateur DEPL PSCA PVEC PMIX LIAI REGL HOOK SOLS RESO
syn keyword gibianeOperateur AFFE RIGI BLOQ DEPI HOTA STRU TEXT PROJ GLIS
syn keyword gibianeOperateur ELST JONC RECO MASS CLST SIGM RELA FORC MOME
syn keyword gibianeOperateur PRCH BASE DIME EXTR VERS VIBR MAXI XTMX YTMX
syn keyword gibianeOperateur > < >EG <EG OU NON NEG MULT
syn keyword gibianeOperateur PJBA CRIT DIAG XTX CHOC BSIG PRHC MAX1 MOTS
syn keyword gibianeOperateur QUIT[TER] IPOL ABS SIN COS
syn keyword gibianeOperateur ATG ENVE INSS DETR ENLE REMP INSE COLI TRIA
syn keyword gibianeOperateur TABL REDU SYMT ANTI RESU PRES EXCO NOMC SAUT
syn keyword gibianeOperateur DEFO APPU INVA PRIN VMIS KSIG SIGN SUIT CARB
syn keyword gibianeOperateur VALP ORDO TIRE REGE DESS AMOR CHAR COUL CHPO
syn keyword gibianeOperateur AFCO EVOL ORTH THET COMB DEVE VECT PICA CAPI
syn keyword gibianeOperateur COPI DIMN SAUV REST CARA MATE GENE
syn keyword gibianeOperateur CAPA ELFE JACO PLAS GREE MODE PROC XTY
syn keyword gibianeOperateur KTAN FORM MESS NNOR CUBP CUBT CER3 FDT
syn keyword gibianeOperateur SEIS ENER EPSI INTG COUR REAC SUPE ZERO DEPB
syn keyword gibianeOperateur EXCI KP ACTI ELAS SUBS ERRE CONG LUMP OBTE
syn keyword gibianeOperateur VARI MODI MASQ EXIS MINI GRAD ENSE IFRE DFOU
syn keyword gibianeOperateur SIGS MAPP SOMM BRUI RTEN DSPR TFR PLEX TOTE
syn keyword gibianeOperateur GRAF TRES TYPE OSCI SPO INDE COMA COMI CHSP
syn keyword gibianeOperateur TAGR PERM CABL FOFI WORK QULX DEBI ARTI FENE
syn keyword gibianeOperateur CMOY COMT COND FLUX MODL MATR RIMP FILT TFRI
syn keyword gibianeOperateur CONC ITER ACQU SOUR CONV CHAM PSMO MOTE ECOU
syn keyword gibianeOperateur MENA SYNT ARGU GLIN DYNE CRES FONC RESP PLAC
syn keyword gibianeOperateur NOMS VALE PROI EXCE ARET CALP INDI ACT3 BIOT
syn keyword gibianeOperateur DEDU CONN NLOC CHAI COSI CVOL DIAD HANN INSI
syn keyword gibianeOperateur LSQF LTL PERT PRNS PSRS SIAR SPON VISA CNEQ
syn keyword gibianeOperateur CCON MESU PILE SIMP UTIL MENU COSH SINH TANH
syn keyword gibianeOperateur DEG3 AIDE RACP REFE KMAC KSOF TVAP NSKE KMAB
syn keyword gibianeOperateur NOEL DOMA FPU NST GMV EQPR EQEX VIBC AVCT
syn keyword gibianeOperateur KDIA KMTP KMF MDIA DFDT TCRR TCNM SQTP SOMT
syn keyword gibianeOperateur KDTB CMCT KCHT LAPN RAFT KLOP KRES CSON FIMP
syn keyword gibianeOperateur NUAG WEIP KHIS KOPS FSUR FLAM ELNO
syn keyword gibianeOperateur DBIT NS TOIM FIMP KMBT KBBT DUDW FROT TSCA
syn keyword gibianeOperateur KONV KCHA MHYB MATP HDEB HVIT HYBP SMTP DIVU
syn keyword gibianeOperateur MOCU CHAU TAIL ERF SENS IMPO DANS IMPF NTAB
syn keyword gibianeOperateur FRON FUIT EPTH FPT KFPT FPA KFPA ECHI QOND 
syn keyword gibianeOperateur KPRO FFOR RAYE RAYN VSUR TRAJ AJU1 AJU2 FRIG
syn keyword gibianeOperateur EXCF KABL PREC EQUI ONDE CFL DEDO DCOV PARC
syn keyword gibianeOperateur POLA CHI1 CHI2 PENT PRET METH XXT CBLO GENJ
syn keyword gibianeOperateur ZLEG MESM FION NEUT LOGK COAC RESI MUTU SORE
syn keyword gibianeOperateur DIRI LIGN OBJE DEBM FINM HERI DECO EXTE DMMU
syn keyword gibianeOperateur DMTD BMTD SSCH MREM ASSI FISS PRIM ANNU PROB
syn keyword gibianeOperateur LATI TABLE

if !exists("did_gibiane_syntax_inits")
  let did_gibiane_syntax_inits = 1
  " The default methods for highlighting.  Can be overridden later
  hi link gibianeStatement		Statement
  hi link gibianeLabel			Special
  hi link gibianeConditional		Conditional
  hi link gibianeRepeat			Repeat
  hi link gibianeTodo			Todo
  hi link gibianeFormatString		gibianeString
  hi link gibianeNumber			Number
  hi link gibianeFloat			Float
  hi link gibianeOperator		Conditional
  hi link gibianeLogicalConstant	Constant
"  hi link gibianeCommentError		Error
  hi link gibianeComment		Comment
"  hi link gibianeContinueLine		Todo
"  hi link gibianeLabelNumber		Special
"  hi link gibianeNoLabelNumber		Error
  hi link gibianeType			Type
  hi link gibianeStructure		gibianeType
  hi link gibianeUnitHeader		PreCondit
  hi link gibianeReadWrite		gibianeImplicit
  hi link gibianeFormat			gibianeImplicit
  hi link gibianeStopPause		gibianeImplicit
  hi link gibianeImplicit		Special
"  hi link gibianeSpecific		gibianeImplicit
  hi link gibianeOperateur		Operator

  " optional highlighting
  "hi link gibianeIdentifier		Identifier
  "hi link gibianeDelimiter		Identifier
  hi link gibianePreCondit		PreCondit
  "hi link gibianeIniTab		Error
  "hi link gibianeTab			Error
  "hi link gibianeExtended		gibianeImplicit
  "hi link gibianeSpecial		Special
  hi link gibianeString			String
endif



	vn _co :call MakeList("","", "\* ") <CR> 	" rajoute des % devant chaque ligne	
	vn _uc :call RemoveGibiComments() <CR> 		" enlève des % devant chaque ligne



let b:current_syntax = "gibiane"

"EOF	vim: ts=8 noet tw=120 sw=8 sts=0
