[Variables]
TypeH=2
TypeW=2
PaddingW=15
PaddingH=15



[bg]
Meter=Image
ImageName=#Imagedir#\btn3.png
X=(5-#Padding#)
Y=(5-#Padding#)
W=(#Height#*2+10+(#Padding#*2))
H=(#Height#*2+10+(#Padding#*2))
ImageTint=#colorskin#,#opacity#
ScaleMargins=10,10,10,10

[btnstyle]
ImageName=#Imagedir#\btn3.png
X=(5-#Padding#)
Y=(5-#Padding#)
W=(#Height#*2+10+(#Padding#*2))
H=(#Height#*2+10+(#Padding#*2))
ImageTint=#colorskin2#,#opacity2#
ScaleMargins=10,10,10,10

[overlay]
Meter=Image
ImageName=#@#Common\OverlayBorder\#overlay##padding#.png
X=0
Y=0
W=(#Height#*2+20)
H=(#Height#*2+20)
ScaleMargins=10,10,10,10

[TextStyle]
X=(5+(#Height#/6))
Y=((#Height#/0.590)+5)
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
H=(#Height#*1.43)
ClipString=1
FontColor=#TextColor2#,255
FontSize=(#Height#/13)
FontFace=#fonttype#
Antialias=1
solidcolor=0,0,0,100

[IconStyle]
X=(#Height#/1.8)
Y=(#Height#/2)
W=#Height#
H=#Height#
AntiAlias=1

[FullStyle]
X=(5-#Padding#)
Y=(5-#Padding#)
W=(#Height#*2+10+(#Padding#*2))
H=(#Height#*2+10+(#Padding#*2))
AntiAlias=1