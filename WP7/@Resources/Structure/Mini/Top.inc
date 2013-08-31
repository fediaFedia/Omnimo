[ActStyle]
X=(#Height#/5.8+5)
Y=(#Height#/5.8+5)
W=(#Height#/1.5)
H=(#Height#/1.5)
solidcolor=0,0,0,1


[CLS]
Meter=Button
ButtonImage=#@#Common\Panel\#PanelIcons#\Close.png
X=(#Height#-10)
Y=5
ButtonCommand=!DeactivateConfig
Hidden=1

[SZ]
Meter=Button
ButtonImage=#@#Common\Panel\#PanelIcons#\size.png
X=(#Height#-10) 
Y=(#Height#-10)
ButtonCommand=["#@#Common\Size\size.exe" single "#CURRENTCONFIG#" "#CURRENTFILE#" "#SETTINGSPATH#"]
Hidden=1


[SET]
Meter=Button
ButtonImage=#@#Common\Panel\#PanelIcons#\settings.png
X=(#Height#-10) 
Y=20
ButtonCommand=["#@#Common\Config\config.exe" single "#CURRENTCONFIG#" "#CURRENTFILE#" "#SETTINGSPATH#" "#SKINSPATH#"]
Hidden=1


[NXT]
Meter=Button
ButtonImage=#@#Common\Panel\#PanelIcons#\change.png
X=(#Height#-10)
Y=35
ButtonCommand=!ActivateConfig "#CURRENTCONFIG#"
Hidden=1
