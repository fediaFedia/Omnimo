
[StylPlus]
w=(200)*#scaledpi#
h=(113)*#scaledpi#
y=(r)*#scaledpi#
x=(150R)*#scaledpi#
Antialias=1
PreserveAspectRatio=2
ImageName=#@#Graphics\TextItems\MultiManager\add.png
mouseActionCursor=1
DynamicVariables=1
SolidColor=#sidebarcolor#
fontcolor=#TTtextcolor#,0
fontsize=(16)*#scaledpi#


MouseOverAction=[!SetOption #CURRENTSECTION# solidcolor #tttextcolor#,50][!Update]
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
LeftMouseUpAction=[!WriteKeyValue Variables Item1Do Save "#@#Config\TextItems\MultiManager\UserVariables.inc"][!WriteKeyValue Variables Which 1 "TimeSettings.inc"][!WriteKeyValue Variables Extra 0 "TimeSettings.inc"][!ActivateConfig #currentconfig#]
ImageName=screenshot.png
Hidden=1
ToolTipText=#SaveLayout#



[Plus1Load]
Meter=Image
MeterStyle=StylPlus
x=(50+#moveByX#)*#scaledpi#
y=(50+#moveByY#)*#scaledpi#
LeftMouseUpAction=[!WriteKeyValue Rainmeter OnRefreshAction "!DeactivateConfig" "#skinspath#\WP7\TextItems\Extra\altgallerybuttons\help2.ini"][!WriteKeyValue Variables Padding 0 "#@#\Common\Color\color.inc"][!LoadLayout OmnimoX#scaledpi#]
ImageName=saved\1\screenshot.png
Hidden=0


[Plus1Load10]
Meter=Image
MeterStyle=StylPlus
x=(50+#moveByX#)*#scaledpi#
y=(50+#moveByY#)*#scaledpi#
LeftMouseUpAction=[!WriteKeyValue Rainmeter OnRefreshAction "!DeactivateConfig" "#skinspath#\WP7\TextItems\Extra\altgallerybuttons\help2.ini"][!WriteKeyValue Variables Padding 5 "#@#\Common\Color\color.inc"][!SnapEdges 0 *][!LoadLayout OmnimoX#scaledpi#win10]
ImageName=saved\1\screenshot.png
Hidden=1




[Plus2Funny]
Measure=Calc
Formula=-1*#Item2HideSave#+1

[Plus2Save]
Meter=Image
MeterStyle=StylPlus
LeftMouseUpAction=[!WriteKeyValue Variables Item2Do Save "#@#Config\TextItems\MultiManager\UserVariables.inc"][!WriteKeyValue Variables Which 2 "TimeSettings.inc"][!WriteKeyValue Variables Extra 0 "TimeSettings.inc"][!ActivateConfig #currentconfig#]
ImageName=screenshot.png
Hidden=#Item2HideSave#
x=((50+205+#moveByX#))*#scaledpi#
y=(50+#moveByY#)*#scaledpi#
SolidColor=#sidebarcolor#,180
[Plus2Load]
Meter=Image
MeterStyle=StylPlus

LeftMouseUpAction=["#@#Common\MultiManager\Multimanager.exe" "#SETTINGSPATH#" "#SKINSPATH#" Load0 2 [MeasureWindowsVersion]]
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
LeftMouseUpAction=[!WriteKeyValue Variables Item3Do Save "#@#Config\TextItems\MultiManager\UserVariables.inc"][!WriteKeyValue Variables Which 3 "TimeSettings.inc"][!WriteKeyValue Variables Extra 0 "TimeSettings.inc"][!ActivateConfig #currentconfig#]
ImageName=screenshot.png
Hidden=#Item3HideSave#
x=((50+205*2+#moveByX#))*#scaledpi#
y=(50+#moveByY#)*#scaledpi#


[Plus3Load]
Meter=Image
MeterStyle=StylPlus

LeftMouseUpAction=["#@#Common\MultiManager\Multimanager.exe" "#SETTINGSPATH#" "#SKINSPATH#" Load0 3 [MeasureWindowsVersion]]
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
LeftMouseUpAction=[!WriteKeyValue Variables Item4Do Save "#@#Config\TextItems\MultiManager\UserVariables.inc"][!WriteKeyValue Variables Which 4 "TimeSettings.inc"][!WriteKeyValue Variables Extra 0 "TimeSettings.inc"][!ActivateConfig #currentconfig#]
ImageName=screenshot.png
Hidden=#Item4HideSave#
x=(50+#moveByX#)*#scaledpi#
y=((50+118+#moveByY#))*#scaledpi#
SolidColor=#sidebarcolor#,200

[Plus4Load]
Meter=Image
MeterStyle=StylPlus
x=(50+#moveByX#)*#scaledpi#
y=((50+118+#moveByY#))*#scaledpi#
LeftMouseUpAction=["#@#Common\MultiManager\Multimanager.exe" "#SETTINGSPATH#" "#SKINSPATH#" Load0 4 [MeasureWindowsVersion]]
ImageName=saved\4\screenshot.png
Hidden=[Plus4Funny]



[Plus5Funny]
Measure=Calc
Formula=-1*#Item5HideSave#+1

[Plus5Save]
Meter=Image
MeterStyle=StylPlus
LeftMouseUpAction=[!WriteKeyValue Variables Item5Do Save "#@#Config\TextItems\MultiManager\UserVariables.inc"][!WriteKeyValue Variables Which 5 "TimeSettings.inc"][!WriteKeyValue Variables Extra 0 "TimeSettings.inc"][!ActivateConfig #currentconfig#]
ImageName=screenshot.png
Hidden=#Item5HideSave#
x=((50+205+#moveByX#))*#scaledpi#
y=((50+118+#moveByY#))*#scaledpi#


[Plus5Load]
Meter=Image
MeterStyle=StylPlus
x=((50+205+#moveByX#))*#scaledpi#
y=((50+118+#moveByY#))*#scaledpi#
LeftMouseUpAction=["#@#Common\MultiManager\Multimanager.exe" "#SETTINGSPATH#" "#SKINSPATH#" Load0 5 [MeasureWindowsVersion]]
ImageName=saved\5\screenshot.png
Hidden=[Plus5Funny]

[Plus6Funny]
Measure=Calc
Formula=-1*#Item6HideSave#+1

[Plus6Save]
Meter=Image
MeterStyle=StylPlus
LeftMouseUpAction=[!WriteKeyValue Variables Item6Do Save "#@#Config\TextItems\MultiManager\UserVariables.inc"][!WriteKeyValue Variables Which 6 "TimeSettings.inc"][!WriteKeyValue Variables Extra 0 "TimeSettings.inc"][!ActivateConfig #currentconfig#]
ImageName=screenshot.png
Hidden=#Item6HideSave#
x=((50+205*2+#moveByX#))*#scaledpi#
y=((50+118+#moveByY#))*#scaledpi#
SolidColor=#sidebarcolor#,220

[Plus6Load]
Meter=Image
MeterStyle=StylPlus
x=((50+205*2+#moveByX#))*#scaledpi#
y=((50+118+#moveByY#))*#scaledpi#
LeftMouseUpAction=["#@#Common\MultiManager\Multimanager.exe" "#SETTINGSPATH#" "#SKINSPATH#" Load0 6 [MeasureWindowsVersion]]
ImageName=saved\6\screenshot.png
Hidden=[Plus6Funny]

[Plus7Funny]
Measure=Calc
Formula=-1*#Item7HideSave#+1

[Plus7Save]
Meter=Image
MeterStyle=StylPlus
LeftMouseUpAction=[!WriteKeyValue Variables Item7Do Save "#@#Config\TextItems\MultiManager\UserVariables.inc"][!WriteKeyValue Variables Which 7 "TimeSettings.inc"][!WriteKeyValue Variables Extra 0 "TimeSettings.inc"][!ActivateConfig #currentconfig#]
ImageName=screenshot.png
Hidden=#Item7HideSave#
x=(50+#moveByX#)*#scaledpi#
y=((50+118*2+#moveByY#))*#scaledpi#
SolidColor=#sidebarcolor#,180

[Plus7Load]
Meter=Image
MeterStyle=StylPlus
x=(50+#moveByX#)*#scaledpi#
y=((50+118*2+#moveByY#))*#scaledpi#
LeftMouseUpAction=["#@#Common\MultiManager\Multimanager.exe" "#SETTINGSPATH#" "#SKINSPATH#" Load0 7 [MeasureWindowsVersion]]
ImageName=saved\7\screenshot.png
Hidden=[Plus7Funny]




[Plus8Funny]
Measure=Calc
Formula=-1*#Item8HideSave#+1

[Plus8Save]
Meter=Image
MeterStyle=StylPlus
LeftMouseUpAction=[!WriteKeyValue Variables Item8Do Save "#@#Config\TextItems\MultiManager\UserVariables.inc"][!WriteKeyValue Variables Which 8 "TimeSettings.inc"][!WriteKeyValue Variables Extra 0 "TimeSettings.inc"][!ActivateConfig #currentconfig#]
ImageName=screenshot.png
Hidden=#Item8HideSave#
x=((50+205*1+#moveByX#))*#scaledpi#
y=((50+118*2+#moveByY#))*#scaledpi#


[Plus8Load]
Meter=Image
MeterStyle=StylPlus
x=((50+205*1+#moveByX#))*#scaledpi#
y=((50+118*2+#moveByY#))*#scaledpi#
LeftMouseUpAction=["#@#Common\MultiManager\Multimanager.exe" "#SETTINGSPATH#" "#SKINSPATH#" Load0 8 [MeasureWindowsVersion]]
ImageName=saved\8\screenshot.png
Hidden=[Plus8Funny]


[Plus9Funny]
Measure=Calc
Formula=-1*#Item9HideSave#+1

[Plus9Save]
Meter=Image
MeterStyle=StylPlus
LeftMouseUpAction=[!WriteKeyValue Variables Item9Do Save "#@#Config\TextItems\MultiManager\UserVariables.inc"][!WriteKeyValue Variables Which 9 "TimeSettings.inc"][!WriteKeyValue Variables Extra 0 "TimeSettings.inc"][!ActivateConfig #currentconfig#]
ImageName=screenshot.png
Hidden=#Item9HideSave#
x=((50+205*2+#moveByX#))*#scaledpi#
y=((50+118*2+#moveByY#))*#scaledpi#
SolidColor=#sidebarcolor#,160

[Plus9Load]
Meter=Image
MeterStyle=StylPlus
x=((50+205*2+#moveByX#))*#scaledpi#
y=((50+118*2+#moveByY#))*#scaledpi#
LeftMouseUpAction=["#@#Common\MultiManager\Multimanager.exe" "#SETTINGSPATH#" "#SKINSPATH#" Load0 9 [MeasureWindowsVersion]]
ImageName=saved\9\screenshot.png
Hidden=[Plus9Funny]