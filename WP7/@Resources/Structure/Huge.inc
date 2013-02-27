[Variables]
TypeW=2
TypeH=3
PaddingW=15
PaddingH=25

[bgstyle]
ImageName=#Imagedir#\btn3.png
X=5
Y=5
W=(#Height#*2+10)
H=(#Height#*3+20)
ImageTint=#colorskin#,#opacity#
BackgroundMargins=10,10,10,10

[btnstyle]
ImageName=#Imagedir#\btn3.png
X=5
Y=5
W=(#Height#*2+10)
H=(#Height#*3+20)
ImageTint=#colorskin2#,#opacity2#
BackgroundMargins=10,10,10,10

[ShadowStyle]
solidcolor=0,0,0,1
X=0
Y=0
W=(#Height#*2+20)
H=(#Height#*3+30)

[overlaystyle]
ImageName=#@#Common\Overlay\#overlay#3.png
W=(#Height#*2+10)
H=(#Height#*3+20)
x=5
y=5
BackgroundMargins=10,10,10,10

[TextStyle]
X=(5+(#Height#/6))
Y=((#Height#/0.365)+5)
StringAlign=#align#
FontFace=#fonttype#
FontColor=#textcolor2#,#PanelTitleOpacity#
FontSize=(#height#/7)
StringEffect=#Shadow#
FontEffectColor=#ItemShadowColor#
AntiAlias=1

[IconStyle]
X=(#Height#/1.8)
Y=(#Height#/1.2+#yposition#+5)
W=#Height#
H=#Height#
ImageTint=#TextColor2#
AntiAlias=1


[MeterCloseStyle]
ButtonImage=#@#Common\Panel\Close.png
X=(#Height#*2)
Y=5


[sizeStyle]
ButtonImage=#@#Common\Panel\size.png
X=(#Height#*2)
Y=(#Height#*3+10)


[MeterSettingsStyle]
ButtonImage=#@#Common\Panel\settings.png
X=(#Height#*2)
Y=20


[MeterChangeStyle]
ButtonImage=#@#Common\Panel\change.png
X=(#Height#*2)
Y=35
