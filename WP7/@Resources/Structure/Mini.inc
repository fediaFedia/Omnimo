[Variables]
TypeW=1
TypeH=1
PaddingW=5
PaddingH=5
Height=70


[bgstyle]
ImageName=#Imagedir#\btn3.png
X=5
Y=5
W=#Height#
H=#Height#
ImageTint=#colorskin#,#opacity#
ScaleMargins=10,10,10,10

[btnstyle]
ImageName=#Imagedir#\btn3.png
X=5
Y=5
W=#Height#
H=#Height#
ImageTint=#colorskin2#,#opacity2#
ScaleMargins=10,10,10,10


[overlaystyle]
ImageName=#@#Common\OverlayBorder\#overlay#.png
W=(#Height#+10)
H=(#Height#+10)
x=0
y=0
ScaleMargins=10,10,10,10

[TextStyle]
X=(5+(#Height#/#xposition#))
Y=((#Height#/(#yposition#))+5)
StringAlign=#align#
FontFace=#fonttype#
FontColor=#textcolor2#,1
FontSize=#defaultfontsize#
AntiAlias=1

[IconStyle]
X=(#Height#/5.8+5)
Y=(#Height#/6.3+#yposition#+5)
W=(#Height#/1.5)
H=(#Height#/1.5)
AntiAlias=1



[MeterCloseStyle]
ButtonImage=#@#Common\Panel\Close.png
X=(#Height#-10)
Y=5


[sizeStyle]
ButtonImage=#@#Common\Panel\size.png
X=(#Height#-10) 
Y=(#Height#-10)


[MeterSettingsStyle]
ButtonImage=#@#Common\Panel\settings.png
X=(#Height#-10) 
Y=20


[MeterChangeStyle]
ButtonImage=#@#Common\Panel\change.png
X=(#Height#-10)
Y=35
