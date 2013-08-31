
[ActStyle]
X=5
Y=5
W=(#Height#*2-5)
H=(#Height#/2-20)
solidcolor=0,0,0,1


[CLS]
Meter=Button
ButtonImage=#@#Common\Panel\#PanelIcons#\Close.png
X=(#Height#*2)
Y=5
ButtonCommand=!DeactivateConfig
Hidden=1

[SZ]
Meter=Button
ButtonImage=#@#Common\Panel\#PanelIcons#\size.png
X=(#Height#*2)
Y=(#Height#/2-15)
ButtonCommand=["#@#Common\Size\size.exe" single "#CURRENTCONFIG#" "#CURRENTFILE#" "#SETTINGSPATH#"]


[SET]
Meter=Button
ButtonImage=#@#Common\Panel\#PanelIcons#\settings.png
X=(#Height#*2) 
Y=20
ButtonCommand=["#@#Common\Config\config.exe" double "#CURRENTCONFIG#" "#CURRENTFILE#" "#SETTINGSPATH#" "#SKINSPATH#"]
Hidden=1


[NXT]
Meter=Button
ButtonImage=#@#Common\Panel\#PanelIcons#\change.png
X=(#Height#*2)
Y=35
ButtonCommand=!ActivateConfig "#CURRENTCONFIG#"
Hidden=1
