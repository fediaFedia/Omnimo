[Variables]
TypeW=2
TypeH=1
PaddingW=15
PaddingH=5

[bgstyle]
ImageName=#Imagedir#\btn3.png
X=5
Y=5
W=(#Height#*2+10)
H=#Height#
ImageTint=#colorskin#,#opacity#
BackgroundMargins=10,10,10,10

[ShadowStyle]
solidcolor=0,0,0,1
X=0
Y=0
W=(#Height#*2+20)
H=(#Height#+10)

[overlaystyle]
ImageName=#@#Common\Overlay\#overlay#2.png
W=(#Height#*2+10)
H=(#Height#)
x=5
y=5
BackgroundMargins=10,10,10,10

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

[IconStyle]
X=(#Height#/1.4)
Y=(#Height#/7.8+#yposition#+5)
W=(#Height#/1.5)
H=(#Height#/1.5)
ImageTint=#TextColor2#
AntiAlias=1


[MeterCloseStyle]
ButtonImage=#@#Common\Panel\Close.png
X=(#Height#*2)
Y=5


[sizeStyle]
ButtonImage=#@#Common\Panel\size.png
X=(#Height#*2)
Y=(#Height#-10)


[MeterSettingsStyle]
ButtonImage=#@#Common\Panel\settings.png
X=(#Height#*2)
Y=20


[MeterChangeStyle]
ButtonImage=#@#Common\Panel\change.png
X=(#Height#*2)
Y=35
