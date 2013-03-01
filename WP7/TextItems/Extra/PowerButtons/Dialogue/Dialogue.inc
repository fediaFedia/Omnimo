[MeterBackground0]
Meter=Image
SolidColor=#tttextcolor#,100
W=#WorkAreaWidth#
H=#WorkAreaHeight#
X=0
Y=0

[1]
Meter=Image
SolidColor=#ttbgcolor#
W=400
H=150
X=(#WorkAreaWidth#/2-200)
Y=(#WorkAreaHeight#/2-75)

[2]
Meter=Image
SolidColor=#ttbg2color#
W=400
H=50
Y=100r
X=r

[icon]
Meter=Image
ImageName=#@#\Graphics\TextItems\Extra\PowerButtons\#icon#Big.png
W=90
H=90
X=(#WorkAreaWidth#/2-200+10)
Y=(#WorkAreaHeight#/2-75+10)
ImageTint=#tttextcolor#,150

[action]
Meter=Image
SolidColor=229,20,0
W=120
H=30
X=(#WorkAreaWidth#/2-200+270)
Y=(#WorkAreaHeight#/2-75+110)
LeftMouseUpAction=!Execute [!DeactivateConfig]["#@#Common\OmnimoApp.exe" Power #Icon# #Delay# "#PROGRAMPATH#"]


[Text]
Meter=String
Text=#action#?
StringAlign=LEFT
X=(#WorkAreaWidth#/2-200+100)
Y=(#WorkAreaHeight#/2-75+10)
FontColor=#tttextcolor#
FontSize=24
FontFace=Segoe UI Light
AntiAlias=1
Hidden=0
DynamicVariables=1

[Text2]
Meter=String
X=5r
StringAlign=LEFT
Y=45r
W=280
H=50
ClipString=1
MeterStyle=DriveText
FontColor=#tttextcolor#,150
FontSize=9
FontFace=Segoe UI
Text=#donothing#
AntiAlias=1
Hidden=0
DynamicVariables=1


[action]
Meter=Image
SolidColor=229,20,0
W=120
H=30
X=(#WorkAreaWidth#/2-200+270)
Y=(#WorkAreaHeight#/2-75+110)
LeftMouseUpAction=!Execute [!DeactivateConfig]["#@#Common\OmnimoApp.exe" Power #Icon# #Delay# "#PROGRAMPATH#"]


[cancel]
Meter=Image
SolidColor=34,160,195
W=120
H=30
X=(#WorkAreaWidth#/2-200+149)
Y=(#WorkAreaHeight#/2-75+110)
LeftMouseUpAction=!Execute ["wscript" "#CURRENTPATH#killtask.js"][!DeactivateConfig]

[CancelText]
Meter=String
StringAlign=CENTER
X=(#WorkAreaWidth#/2-200+209)
Y=(#WorkAreaHeight#/2-75+113)
MeterStyle=DriveText
FontColor=255,255,255
FontSize=12
FontFace=Segoe UI
Text=#Cancel#
AntiAlias=1
Hidden=0
DynamicVariables=1

[ActionText]
Meter=String
StringAlign=CENTER
X=(#WorkAreaWidth#/2-200+332)
Y=(#WorkAreaHeight#/2-75+113)
MeterStyle=DriveText
FontColor=255,255,255
FontSize=12
FontFace=Segoe UI
Text=#action#
AntiAlias=1
Hidden=0
DynamicVariables=1


