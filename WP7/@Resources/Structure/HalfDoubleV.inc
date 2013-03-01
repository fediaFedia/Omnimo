[Variables]
TypeH=2
TypeW=0.5
PaddingH=15
PaddingW=0


[bg]
Meter=Image
ImageName=#Imagedir#\btn3.png
X=5
Y=5
H=(#Height#*2+10)
W=(#Height#/2-5)
ImageTint=#colorskin#,#opacity#
ScaleMargins=10,10,10,10

[btnstyle]
ImageName=#Imagedir#\btn3.png
X=5
Y=5
H=(#Height#*2+10)
W=(#Height#/2-5)
ImageTint=#colorskin2#,#opacity2#
ScaleMargins=10,10,10,10


[overlay]
Meter=Image
ImageName=#@#Common\OverlayBorder\#overlay#.png
H=(#Height#*2+20)
W=(#Height#/2+5)
x=0
y=0
ScaleMargins=10,10,10,10

[CLS]
Meter=Button
ButtonImage=#@#Common\Panel\Close.png
X=(#Height#/2-15)
Y=5
ButtonCommand=!DeactivateConfig
Hidden=1

[SZ]
Meter=Button
ButtonImage=#@#Common\Panel\size.png
X=(#Height#/2-15)
Y=(#Height#*2)

ButtonCommand=!Execute ["#@#Common\Size\size.exe" #PanelType# "#CURRENTCONFIG#" "#SETTINGSPATH#"]
Hidden=1


[SET]
Meter=Button
ButtonImage=#@#Common\Panel\settings.png
X=(#Height#/2-15)
Y=20
ButtonCommand=!Execute ["#@#Common\Config\config.exe" #PanelType# "#CURRENTCONFIG#" "#SETTINGSPATH#"]
Hidden=1


[NXT]
Meter=Button
ButtonImage=#@#Common\Panel\change.png
X=(#Height#/2-15)
Y=35
ButtonCommand=!ActivateConfig "#CURRENTCONFIG#"
Hidden=1


[TextStyle]
X=(#Height#/2.6+5)
Y=(#Height#/2+5)
W=(#Height#/10-5)
H=(#Height#*1-15)
StringAlign=LEFT
FontFace=#fonttype#
FontColor=#textcolor2#,#PanelTitleOpacity#
FontSize=(#height#/7)
StringEffect=#Shadow#
FontEffectColor=#ItemShadowColor#
AntiAlias=1
Angle=1.57079633


[FullTextStyle]
StringAlign=LEFT
X=(#Height#/2.6+5)
Y=(#Height#/2+5)
W=(#Height#*2)
H=(#Height#*0.8-15)
ClipString=1
MeterStyle=DriveText
FontColor=#TextColor2#,255
FontSize=(#Height#/15-#Height#/150)
FontFace=#fonttype#
Antialias=1
Angle=1.57079633


[IconStyle]
X=(#Height#/12+5)
Y=(#Height#/12+5)
W=(#Height#/3)
ImageTint=#TextColor2#
AntiAlias=1

[FullStyle]
X=5
Y=5
H=(#Height#*2+10)
W=(#Height#/2-5)
AntiAlias=1

[ActStyle]
X=(#Height#/12+5)
Y=(#Height#/12+5)
W=(#Height#/3-5)
H=(#Height#*2-15)
solidcolor=0,0,0,1


