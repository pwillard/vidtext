

' Program	ugMapAdv3.bas
' Purpose 	Mixed Screen Test
' 
' ugBasic 	Color Computer 3

DEFINE KEYBOARD RATE 1

DIM noun$(30)
noun$(0)="NORTH"
noun$(1)="SOUTH"
noun$(2)="EAST"
noun$(3)="WEST"
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
GLOBAL speed
GLOBAL movecount
GLOBAL finished
GLOBAL b

speed = 5

CONST xloc = 21 
' status screen X location
batt$ = "100%"

' COCO 3 16 color medium resolution text
BITMAP ENABLE (320,200,16)
w = SCREEN WIDTH: h = SCREEN HEIGHT: c = COLOR COUNT

mid1 = w/2
mid2 = h/2

' SET UP WELCOME Screen
CLS BLACK
mainimage = LOAD IMAGE ("main.png")
PUT IMAGE mainimage AT 0,0

LOCATE 10,8
PRINT "MALP Rescue Mission"

LOCATE 0,10
PRINT "You are a Stargate Ground Crew member."
PRINT "Your job: MALP Operator."

PRINT "[Mobile Analytic Laboratory Probe]"
PRINT ""
PRINT "Your Mission: Recover a disabled MALP"
PRINT "on a remote, inhospitable planet." 
PRINT "The video feed has been tampered with"
PRINT "so you don't know where it is visually."
PRINT "Also, recover any related dislocated"
PRINT "parts and materials."
LOCATE 0,24: PRINT "Press any key"

REPEAT
REM LOOP 
UNTIL INKEY$ <> ""

CLS BLACK

PUT IMAGE mainimage AT 0,0

LOCATE 10,8
PRINT "MALP Rescue Mission"

LOCATE 0,10
PRINT "The MALP takes simple commands in"
PRINT "'VERB NOUN' format."
PRINT ""
PRINT "Preliminary data from the disabled"
PRINT "MALP shows the atmosphere to be "
PRINT "toxic and there are unknown enemy" 
PRINT "who may have attacked or disabled"
PRINT "the MALP to be recovered."
PRINT "You won't have the team's help."
PRINT "The same fate may await your MALP,"
PRINT "so be careful."

LOCATE 0,24: PRINT "Press any key"

REPEAT
REM LOOP 
UNTIL INKEY$ <> ""

mainscreen:

WHILE NOT finished
CLS BLACK
PEN WHITE
INK WHITE
' These steps should draw a frame on the screen.
' they don't
DRAW mid1,0 TO mid1,80
DRAW 0,80 TO 320,80
DRAW 0,10 TO 10,10

LOCATE xloc,0 
PRINT "MALP STATUS";
LOCATE xloc,1
PRINT "Batt. Lvl: " + batt$
LOCATE xloc,2

INK RED
PRINT "Alert Lvl: "+ "RED" 

PEN 15
LOCATE xloc,3
PRINT "Speed :";: PRINT speed
' This should draw a square in the map display area
' it doesn't
BOX 1,1 TO 75,75

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

IF word1$ == "QUIT" THEN 
	GOTO endit
ENDIF

' debug uncomment also crashes program
'PRINT action
'PRINT subject

' on action gosub here ...

' on subject gosub here ...


WAIT 500 MS

WEND 

endit:
PRINT "END"
HALT












