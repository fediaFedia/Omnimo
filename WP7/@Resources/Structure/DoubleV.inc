[Variables]
TypeW=1
TypeH=2
PaddingW=5
PaddingH=15

[bgstyle]
ImageName=#Imagedir#\btn3.png
X=5
Y=5
H=(#Height#*2+10)
W=#Height#
ImageTint=#colorskin#,#opacity#
BackgroundMargins=10,10,10,10

[ShadowStyle]
solidcolor=0,0,0,1
X=0
Y=0
H=(#Height#*2+20)
W=(#Height#+10)

[overlaystyle]
ImageName=#@#Common\Overlay\#overlay#3.png
H=(#Height#*2+10)
W=(#Height#)
x=5
y=5
BackgroundMargins=10,10,10,10

[TextStyle]
X=(5+(#Height#/#xposition#))
Y=((#Height#*1.9)+5)
StringAlign=#align#
FontFace=#fonttype#
FontColor=#textcolor2#,#PanelTitleOpacity#
FontSize=#defaultfontsize#
StringEffect=#Shadow#
FontEffectColor=#ItemShadowColor#
AntiAlias=1

[IconStyle]
X=(#Height#/5.8+5)
Y=(#Height#/1.6+5)
W=(#Height#/1.5)
H=(#Height#/1.5)
ImageTint=#TextColor2#
AntiAlias=1


[MeterCloseStyle]
ButtonImage=#@#Common\Panel\Close.png
X=(#Height#-10)
Y=5


[sizeStyle]
ButtonImage=#@#Common\Panel\size.png
X=(#Height#-10)
Y=(#Height#*2)


[MeterSettingsStyle]
ButtonImage=#@#Common\Panel\settings.png
X=(#Height#-10)
Y=20


[MeterChangeStyle]
ButtonImage=#@#Common\Panel\change.png
X=(#Height#-10)
Y=35
