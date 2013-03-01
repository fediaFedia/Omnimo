[Variables]
TypeW=2
TypeH=1
PaddingW=15
PaddingH=5


[bg]
Meter=Image
ImageName=#Imagedir#\btn3.png
X=5
Y=5
W=(#Height#*2+10)
H=#Height#
ImageTint=#colorskin#,#opacity#
ScaleMargins=10,10,10,10

[btnstyle]
ImageName=#Imagedir#\btn3.png
X=5
Y=5
W=(#Height#*2+10)
H=#Height#
ImageTint=#colorskin2#,#opacity2#
ScaleMargins=10,10,10,10


[overlay]
Meter=Image
ImageName=#@#Common\OverlayBorder\#overlay#.png
W=(#Height#*2+20)
H=(#Height#+10)
x=0
y=0
ScaleMargins=10,10,10,10

[TextStyle]
X=(5+(#Height#/#xposition#))
Y=((#Height#/(#yposition#))+5)
StringAlign=#align#
FontFace=#fonttype#
FontColor=#textcolor2#,#PanelTitleOpacity#
FontSize=#defaultfontsize#
StringEffect=#Shadow#
FontEffectColor=#ItemShadowColor#
AntiAlias=1

[FullTextStyle]
X=15
StringAlign=LEFT
Y=15
W=(#Height#*2-20)
H=(#Height#/1.13-20)
ClipString=1
FontColor=#TextColor2#,255
FontSize=(#Height#/16.4)
FontFace=#fonttype#
Antialias=1
solidcolor=0,0,0,1

[IconStyle]
X=(#Height#/1.4)
Y=(#Height#/7.8+#yposition#+5)
W=(#Height#/1.5)
H=(#Height#/1.5)
AntiAlias=1

[FullStyle]
X=5
Y=5
W=(#Height#*2+10)
H=(#Height#)
AntiAlias=1

[ActStyle]
X=5
Y=5
W=(#Height#*2-5)
H=(#Height#-15)
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
Y=(#Height#-10)
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
