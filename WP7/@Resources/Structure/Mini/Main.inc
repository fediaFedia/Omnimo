[Variables]
TypeW=1
TypeH=1
PaddingW=5
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
W=((#Height#/15*7)+(#Padding#*2))*#ScaleDpi#
H=((#Height#/15*7)+(#Padding#*2))*#ScaleDpi#
ImageTint=#colorskin#,#opacity#
ScaleMargins=10,10,10,10
MouseOverAction=[!SetOption #CURRENTSECTION# ImageTint #colorskin2#,#opacity#][!UpdateMeter bg][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# ImageTint #colorskin#,#opacity#][!UpdateMeter bg][!Redraw]


[overlay]
Meter=Image
ImageName=#@#Common\OverlayBorder\#overlay##padding#.png
X=0
Y=0
W=((#Height#/15*7)+10)*#ScaleDpi#
H=((#Height#/15*7)+10)*#ScaleDpi#
ScaleMargins=10,10,10,10

[TextStyle]
X=(5+((#Height#/15*7)/#xposition#))
Y=(((#Height#/15*7)/(#yposition#))+5)
StringAlign=#align#
FontFace=#fonttype#
FontColor=#textcolor2#,1
FontSize=#defaultfontsize#
FontEffectColor=#ItemShadowColor#,#ItemShadowOpacity#
AntiAlias=1

[FullTextStyle]
X=((#Height#/15*7)/2+10)
StringAlign=centercenter
Y=((#Height#/15*7)/2+10)
W=((#Height#/15*7))
H=((#Height#/15*7))
ClipString=1
FontColor=#TextColor2#,255
FontSize=((#Height#/15*7)/4)
FontFace=#fonttype#
Antialias=1
solidcolor=0,255,0,1

[IconStyle]
X=((#Height#/15*7)/5.8)*#ScaleDpi#+5
Y=((#Height#/15*7)/5.8)*#ScaleDpi#+5
W=((#Height#/15*7)/1.5)*#ScaleDpi#
H=((#Height#/15*7)/1.5)*#ScaleDpi#
AntiAlias=1
LeftMouseUpAction=["#PanelAction#"]
ImageName=#IconLocation#
MouseActionCursor=1

[IconStyle2]
ImageTint=#textcolor2#

[FullStyle]
X=(5-#Padding#)
Y=(5-#Padding#)
W=((#Height#/15*7)+(#Padding#*2))*#ScaleDpi#
H=((#Height#/15*7)+(#Padding#*2))*#ScaleDpi#
AntiAlias=1
ImageName=#IconLocation#
LeftMouseUpAction=["#PanelAction#"]
MouseActionCursor=1
