5 CLEAR:ON KEY GOSUB 1000:KEY (1) ON
10 '
11 ' ====== MAIN INIT (1 LINE) ======
13 SCREEN1,2,0:COLOR1,12:KEYOFF:DEFINTA-Z:N=BASE(5):DIMJ(22),D(15):DATA36,59,32,704
14 '
15 ' === DRAW PLAYFIELD (1 LINE) ====
16 FORJ=1TO4:READD:T=J>2:FORI=1TO22-10*T:VPOKEN+D,203-36*T:D=D+32+31*T:NEXTI,J
20 '
21 ' === INIT IMG & LOOP (? LINES) ===
23 DATA-8,8,-8,8,,8,8,,8,-8,8,-8,,-8,-8,1,1,1,32,-32:FORI=3TO22:READJ(I):NEXT
24 SPRITE$(0)=STRING$(16,255)
26 S=400+N:FORI=0TO15:D(I)=S:NEXT
28 Q(0)=1:Q(1)=-1
30 '
31 ' ====== GAME LOOP (? LINES) ======
32 I=I+1AND15:Q=I>7:D=D(I):VPOKED,32:D=D+J(18+RND(1)*5)*Q(-Q):VPOKED,64:D(I)=D
34 T=STICK(0)*2:X=X+J(T):Y=Y+J(T+1):PUTSPRITE0,(X,Y)
36 GOTO 32
1000 ' SAVE "CHICKENS.BAS",A
1010 '   N   = name table address
1020 ' ----------
1030 ' J(17-)= player movement (joymap)
1040 ' J(18+)= chickens movement
1050 '  var  = ...details...
1060 '
1070 SCREEN0:COLOR15,4,4:C$=CHR$(13)
1080 WIDTH40:KEYON:KEY1,"run1000"+C$:KEY2,"run2000"+C$:KEY4,"list-1001"+C$:END
2000 '
2010 ' CHARACTER SPRITE GENERATOR
2020 '
2030 RESTORE 2040:FORI=1TO8:READA,B:A$=A$+CHR$(A):B$=B$+CHR$(B):NEXT:PRINT "3000 T$="+CHR$(34)+A$+B$+CHR$(34)
2040 DATA &B10001001,&B01111100
2050 DATA &B00100100,&B01111100
2060 DATA &B10010000,&B00111000
2070 DATA &B01000101,&B11111110
2080 DATA &B00101010,&B10011101
2090 DATA &B10000100,&B00111100
2100 DATA &B00100100,&B00110110
2110 DATA &B10001001,&B01100110
