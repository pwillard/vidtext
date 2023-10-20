' COCO 3 16 color medium resolution text
BITMAP ENABLE (319,200,16)
w = SCREEN WIDTH: h = SCREEN HEIGHT: c = COLOR COUNT

mid1 = w/2
mid2 = h/2

CLS BLACK
PEN WHITE
PAPER BLACK
INK WHITE

LOCATE 0,9
PRINT "TESTING..."

' These steps should draw a frame on the screen.
' they don't
DRAW mid1,0 TO mid1,80
DRAW 0,80 TO 320,80
DRAW 0,10 TO 10,10

' This should draw a square...
' it doesn't
BOX 1,1 TO 75,75

HALT



