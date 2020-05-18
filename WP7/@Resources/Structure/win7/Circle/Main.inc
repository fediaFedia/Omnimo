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
W=(#Height#+(#Padding#*2))
H=(#Height#+(#Padding#*2))
ImageTint=#colorskin#,#opacity#


[btn]
Meter=Image
ImageName=#Imagedir#\btn3.png
X=(5-#Padding#)
Y=(5-#Padding#)
W=(#Height#+(#Padding#*2))
H=(#Height#+(#Padding#*2))
ImageTint=#colorskin2#,#opacity2#
Hidden=1


[btnstyle]
ImageTint=#colorskin2#,#opacity2#


[overlay]
Meter=Image
ImageName=#@#Common\OverlayBorder\#overlay##padding#.png
X=0
Y=0
W=(#Height#+10)
H=(#Height#+10)





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
X=(#Height#/5.8+5)
Y=(#Height#/5.8+5-#enablelabels#)
W=(#Height#/1.5)
H=(#Height#/1.5)
AntiAlias=1


[TextStyle]
X=(5+(#Height#/2))
Y=((#Height#/1.25)+5)
StringAlign=center
FontFace=#fonttype#
FontColor=#textcolor2#,#PanelTitleOpacity#
FontSize=#defaultfontsize#
StringEffect=#Shadow#
FontEffectColor=#ItemShadowColor#,#ItemShadowOpacity#
AntiAlias=1

[IconStyle2]
ImageTint=#textcolor2#

[FullStyle]
X=(#Height#/5.8+5)
Y=(#Height#/5.8+5-#enablelabels#)
W=(#Height#/1.5)
H=(#Height#/1.5)
AntiAlias=1