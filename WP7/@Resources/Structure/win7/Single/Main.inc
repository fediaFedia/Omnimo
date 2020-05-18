[Variables]
TypeW=1
TypeH=1
PaddingW=5
PaddingH=5


[bg]
Meter=Image
ImageName=#Imagedir#\btn3.png
X=(5-#Padding#)
Y=(5-#Padding#)
W=(#Height#+(#Padding#*2))*#ScaleDpi#
H=(#Height#+(#Padding#*2))*#ScaleDpi#
ImageTint=#colorskin#,#opacity#
ScaleMargins=10,10,10,10
MouseOverAction=[!SetOption #CURRENTSECTION# ImageTint #colorskin2#,#opacity#][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# ImageTint #colorskin#,#opacity#][!Update]




[btnstyle]
ImageTint=#colorskin2#,#opacity2#


[overlay]
Meter=Image
ImageName=#@#Common\OverlayBorder\#overlay##padding#.png
X=0
Y=0
W=(#Height#+10)*#ScaleDpi#
H=(#Height#+10)*#ScaleDpi#
ScaleMargins=10,10,10,10

[TextStyle]
X=(5+(#Height#/#xposition#))*#ScaleDpi#
Y=((#Height#/(#yposition#))+5)*#ScaleDpi#
StringAlign=#align#
FontFace=#fonttype#
FontColor=#textcolor2#,#PanelTitleOpacity#
FontSize=#defaultfontsize#*#ScaleDpi#
StringEffect=#Shadow#
FontEffectColor=#ItemShadowColor#,#ItemShadowOpacity#
AntiAlias=1
Text=#PanelName#


[FullTextStyle]
X=15
StringAlign=LEFT
Y=15
W=(#Height#-20)
H=(#Height#/1.13-20)
ClipString=1
FontColor=#TextColor2#,255
FontSize=(#Height#/16.4)
FontFace=#fonttype#
Antialias=1
solidcolor=0,0,0,1

[IconStyle]
X=(#Height#/5.8+5)*#ScaleDpi#
Y=(#Height#/7.8+#yposition#+5)*#ScaleDpi#
W=(#Height#/1.5)*#ScaleDpi#
H=(#Height#/1.5)*#ScaleDpi#
AntiAlias=1
LeftMouseUpAction=["#PanelAction#"]
ImageName=#IconLocation#

[IconStyle2]
ImageTint=#textcolor2#

[FullStyle]
X=(5-#Padding#)
Y=(5-#Padding#)
W=(#Height#+(#Padding#*2))*#ScaleDpi#
H=(#Height#+(#Padding#*2))*#ScaleDpi#
AntiAlias=1