[Variables]

[sold]
meter=image
solidcolor=0,255,0
w=100
h=100

[Hours]
Meter=ROTATOR
ImageName=#@#\Graphics\Panels\Clock\#HourType#.png
ValueRemainder=43200
MeterStyle=Seconds
DynamicVariables=1
OffsetX=75
OffsetY=75
X=5
Y=5

[Minutes]
Meter=ROTATOR
ImageName=#@#\Graphics\Panels\Clock\#MinutesType#.png
MeterStyle=Seconds
LineWidtH=2
LineLengtH=20
LineLengtH=#height1#
LineColor=0,0,0
ValueRemainder=3600
DynamicVariables=1
OffsetX=75
OffsetY=75
X=5
Y=5



[Seconds]
Meter=ROTATOR
MeasureName=MeasureTime
ImageName=#@#\Graphics\Panels\Clock\#SecondsType#.png
X=5
Y=5
W=#Height#
LineLengtH=25
H=#Height#
LineWidtH=1
LineLengtH=21
LineStart=0
AntiAlias=1
LineColor=255,0,0,100
Solid=0
ValueRemainder=60
OffsetX=75
OffsetY=75