' Program	ugMapAdv.bas  
' Purpose 	Mixed Screen Test
' 
' ugBasic 	Color Computer 3

DEFINE KEYBOARD RATE 1

xloc = 21
batt$ = "100%"

BITMAP ENABLE (320,200,16)
w = SCREEN WIDTH: h = SCREEN HEIGHT: c = COLOR COUNT

mid1 = w/2
mid2 = h/2
 
keyimage = LOAD IMAGE ("key.png")


WHILE NOT finished
CLS 0
PEN 15
PUT IMAGE keyimage AT 80,16
PUT IMAGE keyimage AT 20,16

DRAW mid1,0 TO mid1,96
DRAW 0,96 TO 320,96

LOCATE xloc,0 
PRINT "STATUS";
LOCATE xloc,1
PRINT "Batt. Lvl: " + batt$
LOCATE xloc,2

INK RED

PRINT "Alert Lvl: "+ "RED" 
PEN 16                               
LOCATE 0,13
PRINT "Command Entry: "; 
INPUT sentence$
'PRINT "You Entered: " +  sentence$

REM Evaluate true if there is a space in the sentence
IF INSTR(sentence$," ") THEN 
	word1$ = LEFT$(sentence$,INSTR(sentence$," ")-1):word2$ = RIGHT$(sentence$,LEN(sentence$)-INSTR(sentence$," "))
ELSE
	REM JUST ONE WORD
	word1$ = sentence$: word2$ = ""
ENDIF

PRINT "Word 1 " + word1$
PRINT "Word 2 " + word2$

WAIT 1000 MS

WEND 








