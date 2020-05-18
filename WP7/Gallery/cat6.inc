

[Cat6Bg]
Meter=Image
SolidColor=0,255,0,1
W=(#galleryW#-320)*#ScaleDpi#
h=(950*#ScaleDpi#)
x=(320*#ScaleDpi#)
Y=0
Group=Cat6 | Bye
DynamicVariables=1
Hidden=1
[Cat6BgBottom]
Meter=Image
SolidColor=0,255,0,50
W=(#galleryW#-320)*#ScaleDpi#
h=(700*#ScaleDpi#)
x=(320*#ScaleDpi#)
Y=R
Group=Cat6 | Bye
DynamicVariables=1
Hidden=1
[Cat6Title]
Meter=String
Text="#ColorsandInterface#"
Group=Cat6 | Bye
MeterStyle=CatHeaderTitle
Y=(-1600*#ScaleDpi#)R
[Cat6Subtitle1]
Meter=String
Text=" #DarkModeText#"
Group=Cat6 | Bye
MeterStyle=CatSubTitle
Y=R
[DarkMode1]
Meter=Image
solidcolor=#colorskin#
w=(50*#ScaleDpi#)
h=(25*#ScaleDpi#)
x=(360*#ScaleDpi#)
y=R
Group=Cat6 | Bye
[DarkMode2]
Meter=Image
ImageName=#@#\Graphics\Gallery\on#OnOff##DarkMode##ttgallerystyle#.png
Group=Cat6 | Bye
x=(360*#ScaleDpi#)
w=(85*#ScaleDpi#)
y=(-25*#ScaleDpi#)R
LeftMouseUpAction=[!WriteKeyValue Variables FontColor 0x[&Lua:ConvertToHex('30,30,30')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables FooterBG 0x[&Lua:ConvertToHex('230,230,230')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables GuiBG 0x[&Lua:ConvertToHex('255,255,255')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables DarkMode 0 "#@#Common\Variables\UserVariables.inc"][!WriteKeyValue Variables ConfigBackgroundColor 0xffffff "#@#Common\Variables\UserVariables.inc"][!WriteKeyValue Variables ConfigBackgroundColor2 0xd2d2d2 "#@#Common\Variables\UserVariables.inc"][!WriteKeyValue Variables ConfigTextColor 0x323232 "#@#Common\Variables\UserVariables.inc"][!WriteKeyValue Variables ttgallerystyle Light "#@#Common\Variables\UserVariables.inc"][!WriteKeyValue Variables LastCat "cat6" "scroll.inc"][!RefreshGroup Gallery]
[DarkMode3]
Meter=Image
ImageName=#@#\Graphics\Gallery\off#OnOff##DarkMode##ttgallerystyle#.png
Group=Cat6 | Bye
x=(360*#ScaleDpi#)
w=(85*#ScaleDpi#)
y=R
LeftMouseUpAction=[!WriteKeyValue Variables FontColor 0x[&Lua:ConvertToHex('230,230,230')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables FooterBG 0x[&Lua:ConvertToHex('30,30,30')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables GuiBG 0x[&Lua:ConvertToHex('0,0,0')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables DarkMode 1 "#@#Common\Variables\UserVariables.inc"][!WriteKeyValue Variables ConfigBackgroundColor 0x000000 "#@#Common\Variables\UserVariables.inc"][!WriteKeyValue Variables ConfigBackgroundColor2 0x323232 "#@#Common\Variables\UserVariables.inc"][!WriteKeyValue Variables ConfigTextColor 0xE6E6E6 "#@#Common\Variables\UserVariables.inc"][!WriteKeyValue Variables ttgallerystyle Dark "#@#Common\Variables\UserVariables.inc"][!WriteKeyValue Variables LastCat "cat6" "scroll.inc"][!RefreshGroup Gallery]
[Cat6Subtitle2]
Meter=String
Text=" #PanelColor#"
Group=Cat6 | Bye
MeterStyle=CatSubTitle
Y=(20*#ScaleDpi#)R
[color1]
Meter=Image
SolidColor=#color1#
MeterStyle=ColorBlock
LeftMouseUpAction=[!WriteKeyValue Variables PanelBG 0x[&Lua:ConvertToHex('#color1#')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables Color1 0x[&Lua:ConvertToHex('#color1#')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables colorskin #color1# "#@#Common\Color\color.inc"][!WriteKeyValue Variables textcolor2 "254,254,254" "#@#Common\Color\color.inc"][!WriteKeyValue Variables LastCat "cat6" "scroll.inc"][!Refresh #CURRENTCONFIG#][!RefreshGroup "Panel"]
RightMouseDownAction=[!WriteKeyValue Variables colorskin2 #color1# "#@#Common\Color\color.inc"][!RefreshGroup "Panel"]
x=(360*#ScaleDpi#)
Y=(1*#ScaleDpi#)R
[color2]
Meter=Image
SolidColor=#color2#
MeterStyle=ColorBlock
LeftMouseUpAction=[!WriteKeyValue Variables PanelBG 0x[&Lua:ConvertToHex('#color2#')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables Color1 0x[&Lua:ConvertToHex('#color2#')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables colorskin #color2# "#@#Common\Color\color.inc"][!WriteKeyValue Variables textcolor2 "254,254,254" "#@#Common\Color\color.inc"][!WriteKeyValue Variables LastCat "cat6" "scroll.inc"][!Refresh #CURRENTCONFIG#][!RefreshGroup "Panel"]
RightMouseDownAction=[!WriteKeyValue Variables colorskin2 #color2# "#@#Common\Color\color.inc"][!RefreshGroup "Panel"]
[color3]
Meter=Image
SolidColor=#color3#
MeterStyle=ColorBlock
LeftMouseUpAction=[!WriteKeyValue Variables PanelBG 0x[&Lua:ConvertToHex('#color3#')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables Color1 0x[&Lua:ConvertToHex('#color3#')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables colorskin #color3# "#@#Common\Color\color.inc"][!WriteKeyValue Variables textcolor2 "254,254,254" "#@#Common\Color\color.inc"][!WriteKeyValue Variables LastCat "cat6" "scroll.inc"][!Refresh #CURRENTCONFIG#][!RefreshGroup "Panel"]
RightMouseDownAction=[!WriteKeyValue Variables colorskin2 #color3# "#@#Common\Color\color.inc"][!RefreshGroup "Panel"]
[color4]
Meter=Image
SolidColor=#color4#
MeterStyle=ColorBlock
LeftMouseUpAction=[!WriteKeyValue Variables PanelBG 0x[&Lua:ConvertToHex('#color4#')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables Color1 0x[&Lua:ConvertToHex('#color4#')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables colorskin #color4# "#@#Common\Color\color.inc"][!WriteKeyValue Variables textcolor2 "254,254,254" "#@#Common\Color\color.inc"][!WriteKeyValue Variables LastCat "cat6" "scroll.inc"][!Refresh #CURRENTCONFIG#][!RefreshGroup "Panel"]
RightMouseDownAction=[!WriteKeyValue Variables colorskin2 #color4# "#@#Common\Color\color.inc"][!RefreshGroup "Panel"]
[color5]
Meter=Image
SolidColor=#color5#
MeterStyle=ColorBlock
LeftMouseUpAction=[!WriteKeyValue Variables PanelBG 0x[&Lua:ConvertToHex('#color5#')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables Color1 0x[&Lua:ConvertToHex('#color5#')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables colorskin #color5# "#@#Common\Color\color.inc"][!WriteKeyValue Variables textcolor2 "254,254,254" "#@#Common\Color\color.inc"][!WriteKeyValue Variables LastCat "cat6" "scroll.inc"][!Refresh #CURRENTCONFIG#][!RefreshGroup "Panel"]
RightMouseDownAction=[!WriteKeyValue Variables colorskin2 #color5# "#@#Common\Color\color.inc"][!RefreshGroup "Panel"]
[color6]
Meter=Image
SolidColor=#color6#
MeterStyle=ColorBlock
LeftMouseUpAction=[!WriteKeyValue Variables PanelBG 0x[&Lua:ConvertToHex('#color6#')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables Color1 0x[&Lua:ConvertToHex('#color6#')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables colorskin #color6# "#@#Common\Color\color.inc"][!WriteKeyValue Variables textcolor2 "254,254,254" "#@#Common\Color\color.inc"][!WriteKeyValue Variables LastCat "cat6" "scroll.inc"][!Refresh #CURRENTCONFIG#][!RefreshGroup "Panel"]
RightMouseDownAction=[!WriteKeyValue Variables colorskin2 #color6# "#@#Common\Color\color.inc"][!RefreshGroup "Panel"]
[color7]
Meter=Image
SolidColor=#color7#
MeterStyle=ColorBlock
LeftMouseUpAction=[!WriteKeyValue Variables PanelBG 0x[&Lua:ConvertToHex('#color7#')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables Color1 0x[&Lua:ConvertToHex('#color7#')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables colorskin #color7# "#@#Common\Color\color.inc"][!WriteKeyValue Variables textcolor2 "254,254,254" "#@#Common\Color\color.inc"][!WriteKeyValue Variables LastCat "cat6" "scroll.inc"][!Refresh #CURRENTCONFIG#][!RefreshGroup "Panel"]
RightMouseDownAction=[!WriteKeyValue Variables colorskin2 #color7# "#@#Common\Color\color.inc"][!RefreshGroup "Panel"]
[color8]
Meter=Image
SolidColor=#color8#
MeterStyle=ColorBlock
LeftMouseUpAction=[!WriteKeyValue Variables PanelBG 0x[&Lua:ConvertToHex('#color8#')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables Color1 0x[&Lua:ConvertToHex('#color8#')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables colorskin #color8# "#@#Common\Color\color.inc"][!WriteKeyValue Variables textcolor2 #darktextcolor# "#@#Common\Color\color.inc"][!WriteKeyValue Variables LastCat "cat6" "scroll.inc"][!Refresh #CURRENTCONFIG#][!RefreshGroup "Panel"]
RightMouseDownAction=[!WriteKeyValue Variables colorskin2 #color8# "#@#Common\Color\color.inc"][!RefreshGroup "Panel"]
[color9]
Meter=Image
SolidColor=#color9#
MeterStyle=ColorBlock
LeftMouseUpAction=[!WriteKeyValue Variables PanelBG 0x[&Lua:ConvertToHex('#color9#')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables Color1 0x[&Lua:ConvertToHex('#color9#')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables colorskin #color9# "#@#Common\Color\color.inc"][!WriteKeyValue Variables textcolor2 "254,254,254" "#@#Common\Color\color.inc"][!WriteKeyValue Variables LastCat "cat6" "scroll.inc"][!Refresh #CURRENTCONFIG#][!RefreshGroup "Panel"]
RightMouseDownAction=[!WriteKeyValue Variables colorskin2 #color9# "#@#Common\Color\color.inc"][!RefreshGroup "Panel"]
[color10]
Meter=Image
SolidColor=#color10#
MeterStyle=ColorBlock
LeftMouseUpAction=[!WriteKeyValue Variables PanelBG 0x[&Lua:ConvertToHex('#color10#')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables Color1 0x[&Lua:ConvertToHex('#color10#')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables colorskin #color10# "#@#Common\Color\color.inc"][!WriteKeyValue Variables textcolor2 "254,254,254" "#@#Common\Color\color.inc"][!WriteKeyValue Variables LastCat "cat6" "scroll.inc"][!Refresh #CURRENTCONFIG#][!RefreshGroup "Panel"]
RightMouseDownAction=[!WriteKeyValue Variables colorskin2 #color10# "#@#Common\Color\color.inc"][!RefreshGroup "Panel"]
[Cat6Subtitle3]
Meter=String
Text="  #CustomColor#..."
Group=Cat6 | Bye
MeterStyle=CatSubTitle
Y=(20*#ScaleDpi#)R

fontsize=(10*#ScaleDpi#)
MouseOverAction=[!SetOption #CURRENTSECTION# fontcolor #TTtextcolor#][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# fontcolor #TTtextcolor#,200][!Update]
LeftMouseUpAction=["#ADDONSPATH#RainRGB\RainRGB.exe" "VarName=colorskin" "FileName=#@#Common\Color\color.inc"]
RightMouseUpAction=["#ADDONSPATH#RainRGB\RainRGB.exe" "VarName=colorskin2" "FileName=#@#Common\Color\color.inc"]
MouseActionCursor=1

[mWIN8]
Measure=Plugin
Plugin=SysColor
ColorType=Win8
DisplayType=RGB




[Cat6Subtitle4]
Meter=String
Text="  #MatchWin10#"
Group=Cat6 | Bye
MeterStyle=CatSubTitle
Y=(10*#ScaleDpi#)R

fontsize=(10*#ScaleDpi#)
MouseOverAction=[!SetOption #CURRENTSECTION# fontcolor #TTtextcolor#][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# fontcolor #TTtextcolor#,200][!Update]
LeftMouseUpAction=[!WriteKeyValue Variables PanelBG 0x[&Lua:ConvertToHex('[mWIN8]')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables Color1 0x[&Lua:ConvertToHex('[mWIN8]')] "#@#Common\PanelCreator\Resources\Colors.inc"][!WriteKeyValue Variables colorskin [mWIN8] "#@#Common\Color\color.inc"][!Refresh #CURRENTCONFIG#][!RefreshGroup "Panel"]
RightMouseUpAction=[!WriteKeyValue Variables colorskin2 [mWIN8] "#@#Common\Color\color.inc"][!Refresh #CURRENTCONFIG#][!RefreshGroup "Panel"]
DynamicVariables=1
MouseActionCursor=1



[Cat6Subtitle5]
Meter=String
Text=" #PanelOpacity#"
Group=Cat6 | Bye
MeterStyle=CatSubTitle
Y=(20*#ScaleDpi#)R
[0%]
Meter=Image
MeterStyle=OpacitySlider
x=(360*#ScaleDpi#)
Y=(1*#ScaleDpi#)R
LeftMouseUpAction=[!WriteKeyValue Variables opacity 1 "#@#Common\Color\color.inc"][!RefreshGroup "Panel"]
RightMouseUpAction=[!WriteKeyValue Variables opacity2 1 "#@#Common\Color\color.inc"][!RefreshGroup "Panel"]
[25]
Meter=Image
MeterStyle=OpacitySlider
[50]
Meter=Image
MeterStyle=OpacitySlider
[75]
Meter=Image
MeterStyle=OpacitySlider
[100]
Meter=Image
MeterStyle=OpacitySlider
[125]
Meter=Image
MeterStyle=OpacitySlider
[150]
Meter=Image
MeterStyle=OpacitySlider
[175]
Meter=Image
MeterStyle=OpacitySlider
[200]
Meter=Image
MeterStyle=OpacitySlider
[225]
Meter=Image
MeterStyle=OpacitySlider
[245]
Meter=Image
MeterStyle=OpacitySlider

[255]
Meter=Image
MeterStyle=OpacitySlider
[Cat6Subtitle6]
Meter=String
Text=" #Blur#"
Group=Cat6 | Bye
MeterStyle=CatSubTitle
Y=30R
[Glass1]
Meter=Image
solidcolor=#colorskin#
w=(50*#ScaleDpi#)
h=(25*#ScaleDpi#)
x=(360*#ScaleDpi#)
y=R
Group=Cat6 | Bye
[Glass2]
Meter=Image
ImageName=#@#\Graphics\Gallery\on#OnOff##globalblurenable##ttgallerystyle#.png
Group=Cat6 | Bye
x=(360*#ScaleDpi#)
y=(-25*#ScaleDpi#)R
w=(85*#ScaleDpi#)
LeftMouseUpAction=[!WriteKeyValue Variables win10blur none "#@#Common\Color\color.inc"][!WriteKeyValue Variables globalblurenable 0 "#@#Common\Color\color.inc"][!WriteKeyValue Variables LastCat "cat6" "scroll.inc"][!RefreshGroup "Panel"][!Refresh #CURRENTCONFIG#]

[Glass3]
Meter=Image
ImageName=#@#\Graphics\Gallery\off#OnOff##globalblurenable##ttgallerystyle#.png
Group=Cat6 | Bye
x=(360*#ScaleDpi#)
y=R
w=(85*#ScaleDpi#)
LeftMouseUpAction=[!WriteKeyValue Variables win10blur Blur "#@#Common\Color\color.inc"][!WriteKeyValue Variables globalblurenable 1 "#@#Common\Color\color.inc"][!WriteKeyValue Variables LastCat "cat6" "scroll.inc"][!RefreshGroup "Panel"][!Refresh #CURRENTCONFIG#]
ToolTipText=Vista or higher
[Cat6Subtitle7]
Meter=String
Text="  #SecretStyleSettings#"
Group=Cat6 | Bye
MeterStyle=CatSubTitle
Y=(20*#ScaleDpi#)R

fontsize=(10*#ScaleDpi#)
MouseOverAction=[!SetOption #CURRENTSECTION# fontcolor #TTtextcolor#][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# fontcolor #TTtextcolor#,200][!Update]
LeftMouseUpAction=!ToggleConfig "wp7\Gallery\Color" "coloradvanced.ini"
MouseActionCursor=1
