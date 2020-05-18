[Variables]
TypeW=1
TypeH=0.5
PaddingW=15
PaddingH=0



[bg]
Meter=Image
ImageName=#Imagedir#\btn3.png
X=(5-#Padding#)
Y=(5-#Padding#)
W=(#Height#+(#Padding#*2))*#ScaleDpi#
H=(#Height#/2-(5-#Padding#)+(#Padding#))*#ScaleDpi#
ImageTint=#colorskin#,#opacity#
ScaleMargins=10,10,10,10

[btn]
Meter=Image
ImageName=#Imagedir#\btn3.png
X=(5-#Padding#)
Y=(5-#Padding#)
W=(#Height#+(#Padding#*2))*#ScaleDpi#
H=(#Height#/2-(5-#Padding#)+(#Padding#))*#ScaleDpi#
ImageTint=#colorskin2#,#opacity2#
ScaleMargins=10,10,10,10
Hidden=1


[overlay]
Meter=Image
ImageName=#@#Common\OverlayBorder\#overlay##padding#.png
W=(#Height#+10)*#ScaleDpi#
H=(#Height#/2+5)*#ScaleDpi#
x=0
y=0
ScaleMargins=10,10,10,10

[TextStyle]
X=(#Height#/2+5)*#ScaleDpi#
Y=(#Height#/7+5)*#ScaleDpi#
StringAlign=CENTER
FontFace=#fonttype#
FontColor=#textcolor2#,#PanelTitleOpacity#
FontSize=(#height#/10)*#ScaleDpi#
StringEffect=#Shadow#
FontEffectColor=#ItemShadowColor#,#ItemShadowOpacity#
AntiAlias=1
LeftMouseUpAction=["#PanelAction#"]
solidcolor=0,0,0,1
Text=#PanelName#
[FullTextStyle]
X=(#Height#/30+5)
StringAlign=LEFT
Y=(#Height#/30+5)
W=(#Height#)
ClipString=1
H=(#Height#/10)
MeterStyle=DriveText
FontColor=#TextColor2#,1
FontSize=(#Height#/15-#Height#/150)
FontFace=#fonttype#
Antialias=1

[IconStyle]
X=(#Height#/2-(#Height#/3/2)+5)
Y=(#Height#/12+5)
W=(#Height#/3)
ImageTint=#TextColor2#,1
AntiAlias=1
LeftMouseUpAction=["#PanelAction#"]
ImageName=#IconLocation#

[IconStyle2]
ImageTint=#textcolor2#,50

[FullStyle]
X=(5-#Padding#)
Y=(5-#Padding#)
W=(#Height#+(#Padding#*2))
H=(#Height#/2-(5-#Padding#)+(#Padding#))
AntiAlias=1