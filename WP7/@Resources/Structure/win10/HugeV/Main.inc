[Variables]
TypeH=3
TypeW=2
PaddingW=15
PaddingH=25



[bg]
Meter=Image
ImageName=#Imagedir#\btn3.png
X=(5-#Padding#)
Y=(5-#Padding#)
W=(#Height#*2+10+(#Padding#*2))*#ScaleDpi#
H=(#Height#*3+20+(#Padding#*2))*#ScaleDpi#
ImageTint=#colorskin#,#opacity#
ScaleMargins=10,10,10,10

[btn]
ImageName=#Imagedir#\btn3.png
X=(5-#Padding#)
Y=(5-#Padding#)
W=(#Height#*2+10+(#Padding#*2))*#ScaleDpi#
H=(#Height#*3+20+(#Padding#*2))*#ScaleDpi#
ImageTint=#colorskin2#,#opacity2#
ScaleMargins=10,10,10,10
Hidden=1

[overlay]
Meter=Image
ImageName=#@#Common\OverlayBorder\#overlay##padding#.png
X=0
Y=0
W=(#Height#*2+20)*#ScaleDpi#
H=(#Height#*3+30)*#ScaleDpi#
ScaleMargins=10,10,10,10

[TextStyle]
X=(5+(#Height#/6))*#ScaleDpi#
Y=((#Height#/0.365)+5)*#ScaleDpi#
StringAlign=#align#
FontFace=#fonttype#
FontColor=#textcolor2#,#PanelTitleOpacity#
FontSize=(#height#/7)*#ScaleDpi#
StringEffect=#Shadow#
FontEffectColor=#ItemShadowColor#,#ItemShadowOpacity#
AntiAlias=1

[FullTextStyle]
X=(5+(#Height#/6))*#ScaleDpi#
StringAlign=LEFT
Y=(5+(#Height#/6))*#ScaleDpi#
W=(#Height#*2-(10+(#Height#/6)))*#ScaleDpi#
H=(#Height#*2.5)*#ScaleDpi#
ClipString=1
FontColor=#TextColor2#,255
FontSize=(#Height#/13)*#ScaleDpi#
FontFace=#fonttype#
Antialias=1
solidcolor=0,0,0,100

[IconStyle]
X=(#Height#/1.8)*#ScaleDpi#
Y=(#Height#/1.2+#yposition#+5)*#ScaleDpi#
W=(#Height#)*#ScaleDpi#
H=(#Height#)*#ScaleDpi#
AntiAlias=1

[IconStyle2]
ImageTint=#textcolor2#

[FullStyle]
X=(5-#Padding#)
Y=(5-#Padding#)
W=(#Height#*2+10+(#Padding#*2))*#ScaleDpi#
H=(#Height#*3+20+(#Padding#*2))*#ScaleDpi#
AntiAlias=1