[Variables]
TypeW=2
TypeH=3
PaddingW=15
PaddingH=25


[bg]
Meter=Image
ImageName=#Imagedir#\btn3.png
X=5
Y=5
W=(#Height#*2+10)
H=(#Height#*3+20)
ImageTint=#colorskin#,#opacity#
ScaleMargins=10,10,10,10

[btnstyle]
ImageName=#Imagedir#\btn3.png
X=5
Y=5
W=(#Height#*2+10)
H=(#Height#*3+20)
ImageTint=#colorskin2#,#opacity2#
ScaleMargins=10,10,10,10


[overlay]
Meter=Image
ImageName=#@#Common\OverlayBorder\#overlay#.png
X=0
Y=0
W=(#Height#*2+20)
H=(#Height#*3+30)
ScaleMargins=10,10,10,10

[TextStyle]
X=(5+(#Height#/6))
Y=((#Height#/0.365)+5)
StringAlign=#align#
FontFace=#fonttype#
FontColor=#textcolor2#,#PanelTitleOpacity#
FontSize=(#height#/7)
StringEffect=#Shadow#
FontEffectColor=#ItemShadowColor#
AntiAlias=1

[FullTextStyle]
X=(5+(#Height#/6))
StringAlign=LEFT
Y=(5+(#Height#/6))
W=(#Height#*2-(10+(#Height#/6)))
H=(#Height#*2.5)
ClipString=1
FontColor=#TextColor2#,255
FontSize=(#Height#/13)
FontFace=#fonttype#
Antialias=1
solidcolor=0,0,0,100

[IconStyle]
X=(#Height#/1.8)
Y=(#Height#/1.2+#yposition#+5)
W=#Height#
H=#Height#
AntiAlias=1

[FullStyle]
X=5
Y=5
W=(#Height#*2+10)
H=(#Height#*3+20)
AntiAlias=1


[ActStyle]
X=5
Y=5
W=(#Height#*2-10)
H=(#Height#*3)
solidcolor=0,0,0,1


[CLS]
Meter=Button
ButtonImage=#@#Common\Panel\Close.png
X=(#Height#*2)
Y=5
ButtonCommand=!DeactivateConfig
Hidden=1

[SZ]
Meter=Button
ButtonImage=#@#Common\Panel\size.png
X=(#Height#*2)
Y=(#Height#*3+10)
ButtonCommand=!Execute ["#@#Common\Size\size.exe" #PanelType# "#CURRENTCONFIG#" "#SETTINGSPATH#"]
Hidden=1


[SET]
Meter=Button
ButtonImage=#@#Common\Panel\settings.png
X=(#Height#*2)
Y=20
ButtonCommand=!Execute ["#@#Common\Config\config.exe" #PanelType# "#CURRENTCONFIG#" "#SETTINGSPATH#"]
Hidden=1


[NXT]
Meter=Button
ButtonImage=#@#Common\Panel\change.png
X=(#Height#*2)
Y=35
ButtonCommand=!ActivateConfig "#CURRENTCONFIG#"
Hidden=1
