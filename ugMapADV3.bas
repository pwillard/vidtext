

' Program	ugMapAdv3.bas
' Purpose 	Mixed Screen Test
' 
' ugBasic 	Color Computer 3
' 
' NOTE This program is somehow doing 
' a lot of things wrong as it fails
' regularly when new things are added
'
'                    
'  ,-. ,-. ,-. ,-.  ,-. 
'  |   | | |   | |   -< 
'  `-' `-' `-' `-'  `-' 
'                                              
'--------------------------------------

DEFINE KEYBOARD RATE 1
DEFINE STRING SPACE 2048
DEFINE STRING COUNT 256


nouns = 9
DIM noun$(30)
noun$(0)="NORTH"
noun$(1)="SOUTH"
noun$(2)="EAST"
noun$(3)="WEST"
noun$(4)="UP"
noun$(5)="DOWN"
noun$(6)="STATUS"
noun$(7)="RIGHT"
noun$(8)="LEFT"
noun$(9)="xxx"

' Careful... we only check the first 2 letters.
verbs=6
DIM verb$(30)
verb$(0)= "GO"
verb$(1)= "GET"
verb$(2)="LOOK"
verb$(3)="CARRY"
verb$(4)="STORE"
verb$(5)="TURN"
verb$(6)="xxx"

GLOBAL "*"

CONST xloc = 22 
' status screen X location

speed = 5
battery = 100
hull = 100




' COCO 3 16 color medium resolution text
BITMAP ENABLE (320,200,16)
w = SCREEN WIDTH: h = SCREEN HEIGHT: c = COLOR COUNT

mid1 = w/2
mid2 = h/2

' SET UP WELCOME Screen
CLS BLACK
mainimage = LOAD IMAGE ("main.png")
PUT IMAGE mainimage AT 0,0

center$ = "SG-16 MALP Rescue Mission"
x = (40 - LEN(center$))/2
LOCATE x,8 :INK CYAN: PRINT center$

INK WHITE
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
GOSUB pausekey:

CLS BLACK

PUT IMAGE mainimage AT 0,0
INK CYAN
LOCATE x,8 : PRINT center$
INK WHITE
LOCATE 0,10
PRINT "The MALP takes simple commands in"
PRINT "'VERB NOUN' format."
PRINT ""
PRINT "Preliminary data from the disabled"
PRINT "MALP shows the atmosphere to be "
PRINT "toxic and there are unknown enemy" 
PRINT "who may have attacked or disabled"
PRINT "the MALP you need to recover."
PRINT ""
PRINT "You won't have the SG-16's help."
PRINT "The same fate may await your MALP,"
PRINT "so be careful."

GOSUB pausekey:

mainscreen:

WHILE NOT finished
' infinie game loop
CLS BLACK
PEN WHITE
INK WHITE

DRAW mid1,0 TO mid1,80
DRAW 0,80 TO 320,80

' update MALP status
 INK CYAN
 LOCATE xloc,0 
 PRINT "MALP STATUS";
 INK WHITE
 LOCATE xloc,1
 PRINT "Batt. %: ";battery
 LOCATE xloc,2
 PRINT "Hull  %: ";hull
 LOCATE xloc,3
 INK RED
 PRINT "Alert Lvl: "+ "RED" 
 INK WHITE
 LOCATE xloc,4
 PRINT "Speed :";speed

INK GREEN  
LOCATE 0,12
PRINT "Location: "                            
LOCATE 0,13
PRINT "Command Entry: "; 
INPUT sentence$
sentence$ = UPPER(sentence$) 
PRINT "You Entered: " +  sentence$

REM Evaluate true if there is a space in the sentence
IF INSTR(sentence$," ") THEN 
	word1$ = LEFT$(sentence$,INSTR(sentence$," ")-1)
	word2$ = RIGHT$(sentence$,LEN(sentence$)-INSTR(sentence$," "))
ELSE
	REM JUST ONE WORD
    word1$ = sentence$
    word2$ = ""
ENDIF

PRINT "Verb " + word1$
PRINT "Noun " + word2$



PRINT "COMMAND: ";myverb$
'PRINT "SUBJECT: ";mynouns$



WAIT 3000 MS

WEND 

endit:
CLS
PRINT "END"

HALT


pausekey:
' Wait for a keypress
LOCATE 0,24: PRINT "Press any key"
 REPEAT
  REM LOOP 
 UNTIL INKEY$ <> ""
RETURN














