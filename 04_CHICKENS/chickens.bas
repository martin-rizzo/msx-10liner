10 CLEAR:ON KEY GOSUB 1000:KEY (1) ON
20 '
21 ' ===== GAME DATA (2 LINES) =====
22 DATA-4,4,-4,4,,4,4,,4,-4,4,-4,,-4,-4,1,1,1,32,-32,32,64,223,32,215,32,195,32
24 DATA18,32,29,512,18,32,7,32,44,2,252,1,44,1,244,12,252,8,147,2,101,1,69,1
40 '
41 ' == INIT & PLAYFIELD (2 LIENS) ==
50 SCREEN1,2,0:DEFINTA-Z:K=32:DIMJ(K),D(K),Q(K):O=1280:N=6144:D=N:FORI=3TO22
60 READJ(I):NEXT:FORJ=1TO16:D=D-O*(J=9):READT,U:FORI=1TOU:VPOKED,T:D=D+1:NEXTI,J
90 '
100 ' == SPRITES & SOUND (1 LINE) ===
126 SPRITE$(0)="p��p>}���8|fff�":FORI=1032TO1280:VPOKEI,VPEEK(I-8):NEXT:PLAY"L64"
140 '
150 ' === INIT GAME LOOP (1 LINE) ===
170 S=N+400:FORI=0TO31:D(I)=S:Q(I)=I<5ORI>26:NEXT:Q(0)=1:X=80:Y=X:L=2:Z=L*99
180 '
190 ' ====== GAME LOOP (4 LINES) ======
200 T=STICK(0)*2:X=X+J(T):Y=Y+J(T+1):I=ZAND15:D=D(I):VPOKED,29:PUTSPRITE0,(X,Y),C
210 E=N+(Y\8)*K+X\8+K:IFI<LTHEND=D+Q(IAND1)*J(18+RND(1)*5):VPOKED,128+I*4:D(I)=D
218 IFI<LANDQ(DAND31)THENSCREEN0:PRINT"PTS:"P:ENDELSET=VPEEK(E)\4-K:C=11:Z=Z+1
220 IFT<0GOTO200ELSEVPOKEE,29:D(T)=S:L=Z\99:P=P+T:PLAY"A":C=1:LOCATE,0:PRINTP:GOTO200
1000 ' SAVE "CHICKENS.BAS",A
1010 ' ----------
1020 '   N   = name table address
1030 '   T   = temporary var (1 line)
1034 '   K   =  32  (constant)
1035 '   O   = 1280 (constant)
1040 '  I,J  = loops
1050 '  D(I) = chicken cur pos/address
1060 '   S   = chicken init pos/address
1070 '   P   = player points
1075 '   L   = player level
1080 '  X,Y  = player coordinate
1085 '   Z   = player game time
1090 ' J(17-)= player movement (joymap)
1100 ' J(18+)= chickens movement
1110 '  var  = ...details...
1120 '
1130 SCREEN0:COLOR15,4,4:C$=CHR$(13)
1140 WIDTH40:KEYON:KEY1,"run1000"+C$:KEY2,"run2000"+C$:KEY4,"list-1001"+C$:END
2000 '
2010 ' CHARACTER SPRITE GENERATOR
2020 '
2030 RESTORE 2040:FORI=1TO8:READA,B:A$=A$+CHR$(A):B$=B$+CHR$(B):NEXT:PRINT "3000 T$="+CHR$(34)+A$+B$+CHR$(34)
2040 DATA &B01110000,&B10111101
2050 DATA &B10101000,&B10111001
2060 DATA &B11111000,&B00111000
2070 DATA &B01110000,&B01111100
2080 DATA &B00011000,&B01100110
2090 DATA &B00111110,&B01100110
2100 DATA &B01111101,&B01100110
2110 DATA &B10111101,&B11101110
