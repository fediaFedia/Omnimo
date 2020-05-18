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
W=(400)*#scaledpi#
H=(200)*#scaledpi#
X=(#WorkAreaWidth#/2-(200*#scaledpi#))
Y=(#WorkAreaHeight#/2-(100*#scaledpi#))


[OverlayM]
Meter=Image
MeterStyle=OverlayStyle
w=(400)*#scaledpi#
h=(200)*#scaledpi#
X=(#WorkAreaWidth#/2-(200*#scaledpi#))
Y=(#WorkAreaHeight#/2-(100*#scaledpi#))

[2]
Meter=Image
SolidColor=#ttbg2color#
W=(398)*#scaledpi#
H=(1)*#scaledpi#
Y=(130*#scaledpi#)r
X=(1*#scaledpi#)r

[3i]
Meter=Image
SolidColor=#ttbg2color#
W=(1)*#scaledpi#
H=(69)*#scaledpi#
Y=r
X=(-200*#scaledpi#)R

[icon]
Meter=Image
ImageName=#@#\Graphics\TextItems\Extra\PowerButtons\#icon#Big.png
W=(90)*#scaledpi#
H=(90)*#scaledpi#
X=(#WorkAreaWidth#/2-(45*#scaledpi#))
Y=(#WorkAreaHeight#/2-(85*#scaledpi#))
ImageTint=#tttextcolor#,20
hidden=1


[Text]
Meter=String
Text=#action#
StringAlign=CENTER
X=(#WorkAreaWidth#/2)
Y=(#WorkAreaHeight#/2-(75*#scaledpi#))
FontColor=#tttextcolor#
FontSize=(28*#scaledpi#)
FontFace=#FontFaceLight#
AntiAlias=1
Hidden=0
DynamicVariables=1

[Text2style]
X=(#WorkAreaWidth#/2)
StringAlign=center
Y=(#WorkAreaHeight#/2-(15*#scaledpi#))
W=(350*#scaledpi#)
H=(50*#scaledpi#)
ClipString=1
MeterStyle=DriveText
FontColor=#tttextcolor#,150
FontFace=#FontTypeWP#
FontSize=(9*#scaledpi#)
AntiAlias=1
Hidden=0
DynamicVariables=1


[action]
Meter=Image
SolidColor=255,255,255,1
W=(200)*#scaledpi#
H=(70)*#scaledpi#
X=(#WorkAreaWidth#/2)
Y=(#WorkAreaHeight#/2-((30)*#scaledpi#))



[cancel]
Meter=Image
SolidColor=255,255,255,1
W=(200)*#scaledpi#
H=(70)*#scaledpi#
X=(#WorkAreaWidth#/2-(200*#scaledpi#))
Y=(#WorkAreaHeight#/2+((30)*#scaledpi#))


[CancelText]
Meter=String
StringAlign=CENTER
X=(#WorkAreaWidth#/2-(100*#scaledpi#))
Y=(#WorkAreaHeight#/2+((45)*#scaledpi#))
MeterStyle=DriveText
FontColor=#tttextcolor#,150
FontSize=(18)*#scaledpi#
FontFace=#FontFaceLight#
Text=#Cancel#
AntiAlias=1
Hidden=0
DynamicVariables=1
MouseActionCursor=1
LeftMouseUpAction=["wscript" "#CURRENTPATH#killtask.js"][!DeactivateConfig]

[ActionText]
Meter=String
StringAlign=CENTER
X=(#WorkAreaWidth#/2+(100*#scaledpi#))
Y=(#WorkAreaHeight#/2+((45)*#scaledpi#))
MeterStyle=DriveText
FontColor=229,20,0
FontSize=(18)*#scaledpi#
FontFace=#FontTypeWP#
Text=#action#
AntiAlias=1
Hidden=0
DynamicVariables=1
LeftMouseUpAction=[!DeactivateConfig]["#@#Common\OmnimoApp.exe" Power #Icon# #Delay# "#PROGRAMPATH#"]
MouseActionCursor=1

