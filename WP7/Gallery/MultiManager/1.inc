


[StylPlus]
w=(200)*#scaledpi#
h=(113)*#scaledpi#
y=r
x=(150R)*#scaledpi#
Antialias=1
PreserveAspectRatio=2
ImageName=#@#Graphics\TextItems\MultiManager\add.png
mouseActionCursor=1
DynamicVariables=1
SolidColor=#colorskin#,150
fontcolor=#TTtextcolor#,0
fontsize=(16)*#scaledpi#
Text=#SaveLayout#

MouseOverAction=[!SetOption #CURRENTSECTION# solidcolor #colorskin#,250][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# solidcolor ""][!Update]






[MeasureVersion]
Measure=Registry
RegHKey=HKEY_LOCAL_MACHINE
RegKey=SOFTWARE\Microsoft\Windows NT\CurrentVersion
RegValue=CurrentBuild
UpdateDivider=-1
DynamicVariables=1
IfCondition=[MeasureVersion:]>10239
IfTrueAction=[!HideMeter Plus1Load][!ShowMeter Plus1Load10][!Update]


[Plus1Save]
Meter=Image
MeterStyle=StylPlus
x=(50+#moveByX#)*#scaledpi#
y=(50+#moveByY#)*#scaledpi#
LeftMouseUpAction=[!WriteKeyValue Variables Item1Do Save "#@#Config\TextItems\MultiManager\UserVariables.inc"][!WriteKeyValue Variables Which 1 "TimeSettings.inc"][!WriteKeyValue Variables Extra 1 "TimeSettings.inc"][!ActivateConfig #currentconfig#]
ImageName=screenshot2.png
Hidden=1
SolidColor=#colorskin#,140
ToolTipText=#SaveLayout#

[Plus1Load]
Meter=Image
MeterStyle=StylPlus
x=(50+#moveByX#)*#scaledpi#
y=(50+#moveByY#)*#scaledpi#
LeftMouseUpAction=[!WriteKeyValue Rainmeter OnRefreshAction "!DeactivateConfig" "#skinspath#\WP7\TextItems\Extra\altgallerybuttons\help2.ini"][!WriteKeyValue Variables Padding 0 "#@#\Common\Color\color.inc"][!SetWallpaper "#skinspath#\WP7\Gallery\Intro\wall.jpg" Stretch][!LoadLayout OmnimoX#scaledpi#]
ImageName=saved\1\screenshot.png
Hidden=0

[Plus1Load10]
Meter=Image
MeterStyle=StylPlus
x=(50+#moveByX#)*#scaledpi#
y=(50+#moveByY#)*#scaledpi#
LeftMouseUpAction=[!WriteKeyValue Rainmeter OnRefreshAction "!DeactivateConfig" "#skinspath#\WP7\TextItems\Extra\altgallerybuttons\help2.ini"][!WriteKeyValue Variables Padding 5 "#@#\Common\Color\color.inc"][!SnapEdges 0 *][!SetWallpaper "#skinspath#\WP7\Gallery\Intro\wall.jpg" Stretch][!LoadLayout OmnimoX#scaledpi#win10]
ImageName=saved\1\screenshot.png
Hidden=1

[Plus2Funny]
Measure=Calc
Formula=-1*#Item2HideSave#+1

[Plus2Save]
Meter=Image
MeterStyle=StylPlus
LeftMouseUpAction=[!WriteKeyValue Variables Item2Do Save "#@#Config\TextItems\MultiManager\UserVariables.inc"][!WriteKeyValue Variables Which 2 "TimeSettings.inc"][!WriteKeyValue Variables Extra 1 "TimeSettings.inc"][!ActivateConfig #currentconfig#]
ImageName=screenshot2.png
Hidden=#Item2HideSave#
x=((50+205+#moveByX#))*#scaledpi#
y=(50+#moveByY#)*#scaledpi#
SolidColor=#colorskin#,160

[Plus2Load]
Meter=Image
MeterStyle=StylPlus

LeftMouseUpAction=[!SetWallpaper "#currentpath#Saved\2\Wallpaper.bmp" Stretch]["#@#Common\MultiManager\Multimanager.exe" "#SETTINGSPATH#" "#SKINSPATH#" Load1 2 [MeasureWindowsVersion]]
ImageName=saved\2\screenshot.png
Hidden=[Plus2Funny]
x=((50+205+#moveByX#))*#scaledpi#
y=(50+#moveByY#)*#scaledpi#

[Plus3Funny]
Measure=Calc
Formula=-1*#Item3HideSave#+1

[Plus3Save]
Meter=Image
MeterStyle=StylPlus
LeftMouseUpAction=[!WriteKeyValue Variables Item3Do Save "#@#Config\TextItems\MultiManager\UserVariables.inc"][!WriteKeyValue Variables Which 3 "TimeSettings.inc"][!WriteKeyValue Variables Extra 1 "TimeSettings.inc"][!ActivateConfig #currentconfig#]
ImageName=screenshot2.png
Hidden=#Item3HideSave#
x=((50+205*2+#moveByX#))*#scaledpi#
y=(50+#moveByY#)*#scaledpi#
SolidColor=#colorskin#,150

[Plus3Load]
Meter=Image
MeterStyle=StylPlus

LeftMouseUpAction=[!SetWallpaper "#currentpath#Saved\3\Wallpaper.bmp" Stretch]["#@#Common\MultiManager\Multimanager.exe" "#SETTINGSPATH#" "#SKINSPATH#" Load1 3 [MeasureWindowsVersion]]
ImageName=saved\3\screenshot.png
Hidden=[Plus3Funny]
x=((50+205*2+#moveByX#))*#scaledpi#
y=(50+#moveByY#)*#scaledpi#


[Plus4Funny]
Measure=Calc
Formula=-1*#Item4HideSave#+1

[Plus4Save]
Meter=Image
MeterStyle=StylPlus
LeftMouseUpAction=[!WriteKeyValue Variables Item4Do Save "#@#Config\TextItems\MultiManager\UserVariables.inc"][!WriteKeyValue Variables Which 4 "TimeSettings.inc"][!WriteKeyValue Variables Extra 1 "TimeSettings.inc"][!ActivateConfig #currentconfig#]
ImageName=screenshot2.png
Hidden=#Item4HideSave#
x=(50+#moveByX#)*#scaledpi#
y=((50+118+#moveByY#))*#scaledpi#

SolidColor=#colorskin#,180
[Plus4Load]
Meter=Image
MeterStyle=StylPlus
x=(50+#moveByX#)*#scaledpi#
y=((50+118+#moveByY#))*#scaledpi#
LeftMouseUpAction=[!SetWallpaper "#currentpath#Saved\4\Wallpaper.bmp" Stretch]["#@#Common\MultiManager\Multimanager.exe" "#SETTINGSPATH#" "#SKINSPATH#" Load1 4 [MeasureWindowsVersion]]
ImageName=saved\4\screenshot.png
Hidden=[Plus4Funny]



[Plus5Funny]
Measure=Calc
Formula=-1*#Item5HideSave#+1

[Plus5Save]
Meter=Image
MeterStyle=StylPlus
LeftMouseUpAction=[!WriteKeyValue Variables Item5Do Save "#@#Config\TextItems\MultiManager\UserVariables.inc"][!WriteKeyValue Variables Which 5 "TimeSettings.inc"][!WriteKeyValue Variables Extra 1 "TimeSettings.inc"][!ActivateConfig #currentconfig#]
ImageName=screenshot2.png
Hidden=#Item5HideSave#
x=((50+205+#moveByX#))*#scaledpi#
y=((50+118+#moveByY#))*#scaledpi#


[Plus5Load]
Meter=Image
MeterStyle=StylPlus
x=((50+205+#moveByX#))*#scaledpi#
y=((50+118+#moveByY#))*#scaledpi#
LeftMouseUpAction=[!SetWallpaper "#currentpath#Saved\5\Wallpaper.bmp" Stretch]["#@#Common\MultiManager\Multimanager.exe" "#SETTINGSPATH#" "#SKINSPATH#" Load1 5 [MeasureWindowsVersion]]
ImageName=saved\5\screenshot.png
Hidden=[Plus5Funny]

[Plus6Funny]
Measure=Calc
Formula=-1*#Item6HideSave#+1

[Plus6Save]
Meter=Image
MeterStyle=StylPlus
LeftMouseUpAction=[!WriteKeyValue Variables Item6Do Save "#@#Config\TextItems\MultiManager\UserVariables.inc"][!WriteKeyValue Variables Which 6 "TimeSettings.inc"][!WriteKeyValue Variables Extra 1 "TimeSettings.inc"][!ActivateConfig #currentconfig#]
ImageName=screenshot2.png
Hidden=#Item6HideSave#
x=((50+205*2+#moveByX#))*#scaledpi#
y=((50+118+#moveByY#))*#scaledpi#

SolidColor=#colorskin#,170

[Plus6Load]
Meter=Image
MeterStyle=StylPlus
x=((50+205*2+#moveByX#))*#scaledpi#
y=((50+118+#moveByY#))*#scaledpi#
LeftMouseUpAction=[!SetWallpaper "#currentpath#Saved\6\Wallpaper.bmp" Stretch]["#@#Common\MultiManager\Multimanager.exe" "#SETTINGSPATH#" "#SKINSPATH#" Load1 6 [MeasureWindowsVersion]]
ImageName=saved\6\screenshot.png
Hidden=[Plus6Funny]

[Plus7Funny]
Measure=Calc
Formula=-1*#Item7HideSave#+1

[Plus7Save]
Meter=Image
MeterStyle=StylPlus
LeftMouseUpAction=[!WriteKeyValue Variables Item7Do Save "#@#Config\TextItems\MultiManager\UserVariables.inc"][!WriteKeyValue Variables Which 7 "TimeSettings.inc"][!WriteKeyValue Variables Extra 1 "TimeSettings.inc"][!ActivateConfig #currentconfig#]
ImageName=screenshot2.png
Hidden=#Item7HideSave#
x=(50+#moveByX#)*#scaledpi#
y=((50+118*2+#moveByY#))*#scaledpi#


[Plus7Load]
Meter=Image
MeterStyle=StylPlus
x=(50+#moveByX#)*#scaledpi#
y=((50+118*2+#moveByY#))*#scaledpi#
LeftMouseUpAction=[!SetWallpaper "#currentpath#Saved\7\Wallpaper.bmp" Stretch]["#@#Common\MultiManager\Multimanager.exe" "#SETTINGSPATH#" "#SKINSPATH#" Load1 7 [MeasureWindowsVersion]]
ImageName=saved\7\screenshot.png
Hidden=[Plus7Funny]




[Plus8Funny]
Measure=Calc
Formula=-1*#Item8HideSave#+1

[Plus8Save]
Meter=Image
MeterStyle=StylPlus
LeftMouseUpAction=[!WriteKeyValue Variables Item8Do Save "#@#Config\TextItems\MultiManager\UserVariables.inc"][!WriteKeyValue Variables Which 8 "TimeSettings.inc"][!WriteKeyValue Variables Extra 1 "TimeSettings.inc"][!ActivateConfig #currentconfig#]
ImageName=screenshot2.png
Hidden=#Item8HideSave#
x=((50+205*1+#moveByX#))*#scaledpi#
y=((50+118*2+#moveByY#))*#scaledpi#
SolidColor=#colorskin#,130

[Plus8Load]
Meter=Image
MeterStyle=StylPlus
x=((50+205*1))*#scaledpi#
y=((50+118*2+#moveByY#))*#scaledpi#
LeftMouseUpAction=[!SetWallpaper "#currentpath#Saved\8\Wallpaper.bmp" Stretch]["#@#Common\MultiManager\Multimanager.exe" "#SETTINGSPATH#" "#SKINSPATH#" Load1 8 [MeasureWindowsVersion]]
ImageName=saved\8\screenshot.png
Hidden=[Plus8Funny]


[Plus9Funny]
Measure=Calc
Formula=-1*#Item9HideSave#+1

[Plus9Save]
Meter=Image
MeterStyle=StylPlus
LeftMouseUpAction=[!WriteKeyValue Variables Item9Do Save "#@#Config\TextItems\MultiManager\UserVariables.inc"][!WriteKeyValue Variables Which 9 "TimeSettings.inc"][!WriteKeyValue Variables Extra 1 "TimeSettings.inc"][!ActivateConfig #currentconfig#]
ImageName=screenshot2.png
Hidden=#Item9HideSave#
x=((50+205*2+#moveByX#))*#scaledpi#
y=((50+118*2+#moveByY#))*#scaledpi#
SolidColor=#colorskin#,190

[Plus9Load]
Meter=Image
MeterStyle=StylPlus
x=((50+205*2+#moveByX#))*#scaledpi#
y=((50+118*2+#moveByY#))*#scaledpi#
LeftMouseUpAction=[!SetWallpaper "#currentpath#Saved\9\Wallpaper.bmp" Stretch]["#@#Common\MultiManager\Multimanager.exe" "#SETTINGSPATH#" "#SKINSPATH#" Load1 9 [MeasureWindowsVersion]]
ImageName=saved\9\screenshot.png
Hidden=[Plus9Funny]