[Rainmeter]
Author=Xyrfo and fediaFedia
MouseOverAction=[!ShowMeter BTN][!ShowMeter SZ][!ShowMeter SET][!ShowMeter CLS][!ShowMeter NXT][!Redraw]
MouseLeaveAction=[!HideMeter BTN][!HideMeter SZ][!HideMeter SET][!HideMeter CLS][!HideMeter NXT][!Redraw]
MouseActionCursor=0
MiddleMouseUpAction=!DeactivateConfig
Update=8640000
Blur=#globalblurenable#
BlurRegion=#blurtype#,(5-#Padding#),(5-#Padding#),(#Height#*#TypeW#+#PaddingW#+(#Padding#)),(#Height#*#TypeH#+#PaddingH#+(#Padding#)),#blurcornerradius#

[Variables]
Height=150
PanelType=single

@include=#@#Common\Variables\UserVariables.inc
@include1=#@#Common\Variables\Languages\lang.inc
@include2=#@#Common\color\color.inc
@include3=#@#Structure\#PanelType#\Main.inc

[act]
SolidColor=0,0,0,1
X=5
Y=5
Meter=Image
W=(#Height#-15)
H=(#Height#-20)
LeftMouseUpAction=["#PanelAction#"]

[Text]
Meter=String
MeterStyle=TextStyle
Text=#PanelName#

@include4=#@#Structure\#PanelType#\Top.inc