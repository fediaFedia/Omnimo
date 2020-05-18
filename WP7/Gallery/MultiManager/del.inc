[StylDel]
SolidColor=0,022,255,1

y=r
x=(82)*#scaledpi#R
Antialias=1
MouseActionCursor=1
ToolTipText=#deletetheme# #currentsection#
Group=Del |  Bye
Hidden=1
w=(30)*#scaledpi#
LeftMouseUpAction=["#@#Common\MultiManager\Multimanager.exe" "#SETTINGSPATH#" "#SKINSPATH#" Delete #currentsection# 0][!WriteKeyValue Variables Item#currentsection#Do Save "#@#Config\TextItems\MultiManager\UserVariables.inc"][!WriteKeyValue Variables Item#currentsection#HideSave 0 "#@#Config\TextItems\MultiManager\UserVariables.inc"][!Refresh #CURRENTCONFIG#]





[1]
Meter=Image
MeterStyle=StylDel
x=(50+200-30+#moveByX#)*#scaledpi#
y=(50+#moveByY#)*#scaledpi#
solidcolor=0,0,0,1
LeftMouseUpAction=


[2]
Meter=Image
MeterStyle=StylDel
x=(50+200*2-30+5+#moveByX#)*#scaledpi#
y=(50+#moveByY#)*#scaledpi#
ImageName=#@#Graphics\TextItems\MultiManager\delete#Item2HideSave#.png

[3]
Meter=Image
MeterStyle=StylDel
x=(50+200*3-30+10+#moveByX#)*#scaledpi#
y=(50+#moveByY#)*#scaledpi#
ImageName=#@#Graphics\TextItems\MultiManager\delete#Item3HideSave#.png
[4]
Meter=Image
MeterStyle=StylDel
x=(50+200-30+#moveByX#)*#scaledpi#
y=(50+118+#moveByY#)*#scaledpi#
ImageName=#@#Graphics\TextItems\MultiManager\delete#Item4HideSave#.png

[5]
Meter=Image
MeterStyle=StylDel
x=(50+200*2-30+5+#moveByX#)*#scaledpi#
y=(50+118+#moveByY#)*#scaledpi#
ImageName=#@#Graphics\TextItems\MultiManager\delete#Item5HideSave#.png

[6]
Meter=Image
MeterStyle=StylDel
x=(50+200*3-30+10+#moveByX#)*#scaledpi#
y=(50+118+#moveByY#)*#scaledpi#
ImageName=#@#Graphics\TextItems\MultiManager\delete#Item6HideSave#.png

[7]
Meter=Image
MeterStyle=StylDel
x=(50+200-30+#moveByX#)*#scaledpi#
y=(50+118*2+#moveByY#)*#scaledpi#
ImageName=#@#Graphics\TextItems\MultiManager\delete#Item7HideSave#.png


[8]
Meter=Image
MeterStyle=StylDel
y=(50+118*2+#moveByY#)*#scaledpi#
x=(50+200*2-30+5+#moveByX#)*#scaledpi#
ImageName=#@#Graphics\TextItems\MultiManager\delete#Item8HideSave#.png

[9]
Meter=Image
MeterStyle=StylDel
y=(50+118*2+#moveByY#)*#scaledpi#
x=(50+200*3-30+10+#moveByX#)*#scaledpi#
ImageName=#@#Graphics\TextItems\MultiManager\delete#Item9HideSave#.png
