[Variables]
TypeW=2
TypeH=0.5
PaddingW=15
PaddingH=5

[bgstyle]
ImageName=#Imagedir#\btn3.png
X=5
Y=5
W=(#Height#*2+10)
H=(#Height#/2-5)
ImageTint=#colorskin#,#opacity#
BackgroundMargins=10,10,10,10

[ShadowStyle]
solidcolor=0,0,0,100
X=0
Y=0
W=(#Height#*2+20)
H=(#Height#/2+5)

[overlaystyle]
ImageName=#@#Common\Overlay\#overlay#2.png
W=(#Height#*2+10)
H=(#Height#/2-5)
x=5
y=5
BackgroundMargins=10,10,10,10

[TextStyle]
X=(#Height#/10+5+(#Height#/3))
Y=(#Height#/10+5)
StringAlign=#align#
FontFace=#fonttype#
FontColor=#textcolor2#,#PanelTitleOpacity#
FontSize=(#height#/7)
StringEffect=#Shadow#
FontEffectColor=#ItemShadowColor#
AntiAlias=1

[TextBigStyle]
X=(#Height#/30+5)
StringAlign=LEFT
Y=(#Height#/30+5)
W=(#Height#*2)
ClipString=1
H=(#Height#/3)
MeterStyle=DriveText
FontColor=#TextColor2#,255
FontSize=(#Height#/15-#Height#/150)
FontFace=#fonttype#
Antialias=1

[IconStyle]
X=(#Height#/12+5)
Y=(#Height#/12+5)
W=(#Height#/3)
ImageTint=#TextColor2#
AntiAlias=1


[MeterCloseStyle]
ButtonImage=#@#Common\Panel\Close.png
X=(#Height#*2)
Y=5


[sizeStyle]
ButtonImage=#@#Common\Panel\size.png
X=(#Height#*2)
Y=(#Height#/2-15)


[MeterSettingsStyle]
ButtonImage=#@#Common\Panel\settings.png
X=(#Height#*2)
Y=20


[MeterChangeStyle]
ButtonImage=#@#Common\Panel\change.png
X=(#Height#*2)
Y=35
