[Variables]
TypeW=2
TypeH=1
PaddingW=15
PaddingH=5

[FrostedGlass]
Measure=Plugin
Plugin=FrostedGlass
Type=#Win10Blur#
Border=All

[bg]
Meter=Image
ImageName=#Imagedir#\btn3.png
X=(5-#Padding#)
Y=(5-#Padding#)
W=(#Height#*2+10+(#Padding#*2))*#ScaleDpi#
H=(#Height#+(#Padding#*2))*#ScaleDpi#
ImageTint=#colorskin#,#opacity#
ScaleMargins=10,10,10,10
MouseOverAction=[!SetOption #CURRENTSECTION# ImageTint #colorskin2#,#opacity#][!UpdateMeter bg][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# ImageTint #colorskin#,#opacity#][!UpdateMeter bg][!Redraw]


[overlay]
Meter=Image
ImageName=#@#Common\OverlayBorder\#overlay##padding#.png
W=(#Height#*2+20)*#ScaleDpi#
H=(#Height#+10)*#ScaleDpi#
x=0
y=0
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

[FullTextStyle]
X=15
StringAlign=LEFT
Y=15
W=(#Height#*2-20)*#ScaleDpi#
H=(#Height#/1.13-20)*#ScaleDpi#
ClipString=1
FontColor=#TextColor2#,255
FontSize=(#Height#/16.4)*#ScaleDpi#
FontFace=#fonttype#
Antialias=1
solidcolor=0,0,0,1

[IconStyle]
X=(#Height#/1.4)*#ScaleDpi#
Y=(#Height#/7.8+#yposition#+5)*#ScaleDpi#
W=(#Height#/1.5)*#ScaleDpi#
H=(#Height#/1.5)*#ScaleDpi#
AntiAlias=1

[IconStyle2]
ImageTint=#textcolor2#

[FullStyle]
X=(5-#Padding#)
Y=(5-#Padding#)
W=(#Height#*2+10+(#Padding#*2))*#ScaleDpi#
H=(#Height#+(#Padding#*2))*#ScaleDpi#
AntiAlias=1