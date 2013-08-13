[MeterBackground0]
Meter=Image
SolidColor=#ttbgcolor#,150
W=#WorkAreaWidth#
H=#WorkAreaHeight#
X=0
Y=0


[1]
Meter=Image
SolidColor=#ttbgcolor#
W=400
H=200
X=(#WorkAreaWidth#/2-200)
Y=(#WorkAreaHeight#/2-100)


[OverlayM]
Meter=Image
MeterStyle=OverlayStyle
w=400
h=200
X=(#WorkAreaWidth#/2-200)
Y=(#WorkAreaHeight#/2-100)

[2]
Meter=Image
SolidColor=#ttbg2color#
W=398
H=1
Y=130r
X=1r

[3i]
Meter=Image
SolidColor=#ttbg2color#
W=1
H=69
Y=r
X=-200R

[icon]
Meter=Image
ImageName=#@#\Graphics\TextItems\Extra\PowerButtons\#icon#Big.png
W=90
H=90
X=(#WorkAreaWidth#/2-45)
Y=(#WorkAreaHeight#/2-75-10)
ImageTint=#tttextcolor#,20
hidden=1


[Text]
Meter=String
Text=#action#
StringAlign=CENTER
X=(#WorkAreaWidth#/2)
Y=(#WorkAreaHeight#/2-75)
FontColor=#tttextcolor#
FontSize=28
FontFace=Segoe UI Light
AntiAlias=1
Hidden=0
DynamicVariables=1

[Text2style]
X=(#WorkAreaWidth#/2)
StringAlign=center
Y=(#WorkAreaHeight#/2-75+60)
W=350
H=50
ClipString=1
MeterStyle=DriveText
FontColor=#tttextcolor#,150
FontFace=Segoe UI
FontSize=9
AntiAlias=1
Hidden=0
DynamicVariables=1


[action]
Meter=Image
SolidColor=255,255,255,1
W=200
H=70
X=(#WorkAreaWidth#/2)
Y=(#WorkAreaHeight#/2-75+105)
LeftMouseUpAction=[!DeactivateConfig]["#@#Common\OmnimoApp.exe" Power #Icon# #Delay# "#PROGRAMPATH#"]


[cancel]
Meter=Image
SolidColor=255,255,255,1
W=200
H=70
X=(#WorkAreaWidth#/2-200)
Y=(#WorkAreaHeight#/2-75+105)
LeftMouseUpAction=["wscript" "#CURRENTPATH#killtask.js"][!DeactivateConfig]

[CancelText]
Meter=String
StringAlign=CENTER
X=(#WorkAreaWidth#/2-200+100)
Y=(#WorkAreaHeight#/2-75+120)
MeterStyle=DriveText
FontColor=#tttextcolor#,150
FontSize=18
FontFace=Segoe UI Light
Text=#Cancel#
AntiAlias=1
Hidden=0
DynamicVariables=1

[ActionText]
Meter=String
StringAlign=CENTER
X=(#WorkAreaWidth#/2-200+300)
Y=(#WorkAreaHeight#/2-75+120)
MeterStyle=DriveText
FontColor=229,20,0
FontSize=18
FontFace=Segoe UI
Text=#action#
AntiAlias=1
Hidden=0
DynamicVariables=1


