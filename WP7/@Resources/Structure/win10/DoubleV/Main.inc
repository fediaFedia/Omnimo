[Variables]
TypeH=2
TypeW=1
PaddingH=15
PaddingW=5


[bg]
Meter=Image
ImageName=#Imagedir#\btn3.png
X=(5-#Padding#)
Y=(5-#Padding#)
H=(#Height#*2+10+(#Padding#*2))*#ScaleDpi#
W=(#Height#+(#Padding#*2))*#ScaleDpi#
ImageTint=#colorskin#,#opacity#
ScaleMargins=10,10,10,10

[btn]
Meter=Image
ImageName=#Imagedir#\btn3.png
X=(5-#Padding#)
Y=(5-#Padding#)
H=(#Height#*2+10+(#Padding#*2))*#ScaleDpi#
W=(#Height#+(#Padding#*2))*#ScaleDpi#
ImageTint=#colorskin2#,#opacity2#
ScaleMargins=10,10,10,10
Hidden=1


[overlay]
Meter=Image
ImageName=#@#Common\OverlayBorder\#overlay##padding#.png
H=(#Height#*2+20)*#ScaleDpi#
W=(#Height#+10)*#ScaleDpi#
x=0
y=0
ScaleMargins=10,10,10,10

[TextStyle]
X=(5+(#Height#/#xposition#))*#ScaleDpi#
Y=((#Height#*1.9)+5)*#ScaleDpi#
StringAlign=#align#
FontFace=#fonttype#
FontColor=#textcolor2#,#PanelTitleOpacity#
FontSize=#defaultfontsize#*#ScaleDpi#
StringEffect=#Shadow#
FontEffectColor=#ItemShadowColor#,#ItemShadowOpacity#
AntiAlias=1

[FullTextStyle]
X=15
StringAlign=LEFT
Y=15
W=(#Height#-20)*#ScaleDpi#
H=(#Height#*1.85-20)*#ScaleDpi#
ClipString=1
FontColor=#TextColor2#,255
FontSize=(#Height#/16.4)*#ScaleDpi#
FontFace=#fonttype#
Antialias=1
solidcolor=0,0,0,1

[IconStyle]
X=(#Height#/5.8+5)*#ScaleDpi#
Y=(#Height#/1.6+5)*#ScaleDpi#
W=(#Height#/1.5)*#ScaleDpi#
H=(#Height#/1.5)*#ScaleDpi#
AntiAlias=1

[IconStyle2]
ImageTint=#textcolor2#

[FullStyle]
X=(5-#Padding#)
Y=(5-#Padding#)
H=(#Height#*2+10+(#Padding#*2))*#ScaleDpi#
W=(#Height#+(#Padding#*2))*#ScaleDpi#
AntiAlias=1


