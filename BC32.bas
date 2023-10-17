' Program	ugMapAdv.bas
' Purpose 	Mixed Screen Test
' 
' ugBasic 	Color Computer 3

DEFINE KEYBOARD RATE 1

DIM noun$(30)
noun$(0)="NORTH"
noun$(1)="SOUTH"
noun$(2)="EAST"
noun$(3)= "WEST"
noun$(4)="UP"
noun$(5)="DOWN"
noun$(6)="STATUS"

DIM verb$(30)
verb$(0)= "GO"
verb$(1)= "GET"
verb$(2)="LOOK"
verb$(3)="CARRY"
verb$(4)="STORE"

GLOBAL action
GLOBAL subject

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

'PRINT "Word 1 " + word1$
'PRINT "Word 2 " + word2$

action = 255
subject = 255

FOR x = 0 TO 4
 IF	(LEFT$(word1$,3) = LEFT$(verb$(x),3)) THEN 
 	action = x: myverb$ = verb$(x)
 ELSE
 	REM nothing
 ENDIF
NEXT
 
' uncommenting this block crashes program
'FOR y = 0 TO 6
'	IF (LEFT$(word2$,3) = LEFT$(noun$(y),3)) THEN
'	    subject = y: mynoun$ = noun$(y)
'	ELSE
'		REM nothing
'	ENDIF
'NEXT
	 
 
 IF action <> 255 THEN
 	PRINT myverb$
 ENDIF
 
 IF subject <> 255 THEN
 	PRINT mynoun$
 ENDIF


' debug uncomment also crashes program
'PRINT action
'PRINT subject

' on action gosub here ...

' on subject gosub here ...


WAIT 1000 MS

WEND 








