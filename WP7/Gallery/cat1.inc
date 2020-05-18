[ScrollLevel]
Measure=Calc
Formula=#ScrollStart#
IfBelowValue=-400
IfBelowAction=[!SetVariable BlankText "E"][!SetVariable BlankTextUp ""][!Update]
DynamicVariables=1
IfAboveValue=1
IfAboveAction=[!SetVariable BlankTextUp "E"][!Update]
IfEqualValue=0
IfEqualAction=[!SetVariable BlankText ""][!SetVariable BlankTextUp ""][!Update]



[Cat1Bg]
Meter=Image
SolidColor=255,0,0,1
W=((#galleryW#-320)*#ScaleDpi#)
h=(950*#ScaleDpi#)
x=(320*#ScaleDpi#)
Y=0
Group=Cat1 | Bye
DynamicVariables=1
MouseScrollUpAction=#BlankTextUp#[!SetVariable ScrollStart ([ScrollLevel])+#scrollamount#][!SetOption #CURRENTSECTION# Y ([ScrollLevel])+#scrollamount#][!Update]
MouseScrollDownAction=#BlankText#[!SetVariable ScrollStart (([ScrollLevel])-#scrollamount#)*#stopscrollingDown#][!SetOption #CURRENTSECTION# Y (([ScrollLevel])-#scrollamount#)*#stopscrollingDown#][!Update]
[Cat1BgBottom]
Meter=Image
SolidColor=255,0,0,1
W=((#galleryW#-320)*#ScaleDpi#)
h=(700*#ScaleDpi#)
x=(320*#ScaleDpi#)
Y=R
Group=Cat1 | Bye
DynamicVariables=1
MouseScrollUpAction=[!SetVariable ScrollStart ([ScrollLevel])+#scrollamount#][!SetOption Cat1Bg Y ([ScrollLevel])+#scrollamount#][!Update]
[Cat1Title]
Meter=String
Text="#EssentialPanels#"
Group=Cat1 | Bye
MeterStyle=CatHeaderTitle
Y=(-1600*#ScaleDpi#)R
[Cat1Subtitle1]
Meter=String
Text=" #SystemMonitoring#"
Group=Cat1 | Bye
MeterStyle=CatSubTitle
Y=R
[RAM]
Meter=String
MeterStyle=EssentialPanel
Group=Cat1 | Bye
x=(360*#ScaleDpi#)
y=R
solidcolor=#colorskin# ,200
[CPU]
Meter=String
MeterStyle=EssentialPanel
Group=Cat1 | Bye
solidcolor=#colorskin# ,230
[MultiMeter]
Meter=String
MeterStyle=EssentialPanel
Group=Cat1 | Bye
solidcolor=#colorskin# ,240
[HDD]
Meter=String
MeterStyle=EssentialPanel
Group=Cat1 | Bye
solidcolor=#colorskin# ,220
[Network]
Meter=String
MeterStyle=EssentialPanel
Group=Cat1 | Bye
solidcolor=#colorskin# ,250
[Volume]
Meter=String
MeterStyle=EssentialPanel
Group=Cat1 | Bye
solidcolor=#colorskin# ,210
[Wifi]
Meter=String
MeterStyle=EssentialPanel
Group=Cat1 | Bye
solidcolor=#colorskin# ,220
[Uptime]
Meter=String
MeterStyle=EssentialPanel
Group=Cat1 | Bye
solidcolor=#colorskin# ,200
[Battery]
Meter=String
MeterStyle=EssentialPanel
Group=Cat1 | Bye
Y=(1*#ScaleDpi#)R
x=(360*#ScaleDpi#)
solidcolor=#colorskin# ,240
[Power]
Meter=String
MeterStyle=EssentialPanel
Group=Cat1 | Bye
solidcolor=#colorskin# ,250
[SpeedFan]
Meter=String
MeterStyle=EssentialPanel
Group=Cat1 | Bye
solidcolor=#colorskin# ,200
[CoreTemp]
Meter=String
MeterStyle=EssentialPanel
Group=Cat1 | Bye
solidcolor=#colorskin# ,200
[RecycleBin]
Meter=String
MeterStyle=EssentialPanel
Group=Cat1 | Bye
solidcolor=#colorskin# ,240
[Ping]
Meter=String
MeterStyle=EssentialPanel
Group=Cat1 | Bye
solidcolor=#colorskin# ,235
[Brightness]
Meter=String
MeterStyle=EssentialPanel
Group=Cat1 | Bye
solidcolor=#colorskin# ,230
[TaskManager]
Meter=String
MeterStyle=EssentialPanel
Group=Cat1 | Bye
solidcolor=#colorskin# ,255
[cat1Subtitle2]
Meter=String
Text=" #TimeandDate#"
Group=cat1 | Bye
MeterStyle=CatSubTitle
Y=(20*#ScaleDpi#)R
[Alarm]
Meter=String
MeterStyle=EssentialPanel
x=(360*#ScaleDpi#)
Y=(1*#ScaleDpi#)R
solidcolor=#colorskin# ,240
[Clock]
Meter=String
MeterStyle=EssentialPanel
solidcolor=#colorskin# ,250
[Date]
Meter=String
MeterStyle=EssentialPanel
solidcolor=#colorskin# ,240
[Flipclock]
Meter=String
MeterStyle=EssentialPanel
solidcolor=#colorskin# ,200
[BinaryClock]
Meter=String
MeterStyle=EssentialPanel
solidcolor=#colorskin# ,230
[Timer]
Meter=String
MeterStyle=EssentialPanel
solidcolor=#colorskin# ,220
[DigitalClock]
Meter=String
MeterStyle=EssentialPanel
solidcolor=#colorskin# ,250
[WorldClock]
Meter=String
MeterStyle=EssentialPanel
solidcolor=#colorskin# ,240
[FruitClock]
Meter=String
MeterStyle=EssentialPanel
Y=(1*#ScaleDpi#)R
x=(360*#ScaleDpi#)
[Stopwatch]
Meter=String
MeterStyle=EssentialPanel
[cat1Subtitle3]
Meter=String
Text=" #Information#"
Group=cat1 | Bye
MeterStyle=CatSubTitle
Y=(20*#ScaleDpi#)R
[Notes]
Meter=String
MeterStyle=EssentialPanel
x=(360*#ScaleDpi#)
Y=(1*#ScaleDpi#)R
solidcolor=#colorskin# ,220
[Weather]
Meter=String
MeterStyle=EssentialPanel
solidcolor=#colorskin# ,210
[WeatherWeek]
Meter=String
MeterStyle=EssentialPanel
solidcolor=#colorskin# ,240
[AstroPicture]
Meter=String
MeterStyle=EssentialPanel
solidcolor=#colorskin# ,200
[CalculatorPanel]
Meter=String
MeterStyle=EssentialPanel
solidcolor=#colorskin# ,230
[RSSreader]
Meter=String
MeterStyle=EssentialPanel
solidcolor=#colorskin# ,240
[Corona]
Meter=String
MeterStyle=EssentialPanel
solidcolor=#colorskin# ,200
[QuoteDay]
Meter=String
MeterStyle=EssentialPanel
solidcolor=#colorskin# ,220
[MoonPhase]
Meter=String
MeterStyle=EssentialPanel
Y=(1*#ScaleDpi#)R
x=(360*#ScaleDpi#)
solidcolor=#colorskin# ,240
[OmnimoTips]
Meter=String
MeterStyle=EssentialPanel
solidcolor=#colorskin# ,240
[uTorrent]
Meter=String
MeterStyle=EssentialPanel
solidcolor=#colorskin# ,250
[cat1Subtitle4]
Meter=String
Text=" #Media#"
Group=cat1 | Bye
MeterStyle=CatSubTitle
Y=(20*#ScaleDpi#)R
[MediaKey]
Meter=String
MeterStyle=EssentialPanel
x=(360*#ScaleDpi#)
Y=(1*#ScaleDpi#)R
[MediaPlayer]
Meter=String
MeterStyle=EssentialPanel
solidcolor=#colorskin# ,250
[Netflix]
Meter=String
MeterStyle=EssentialPanel
[Visualizer]
Meter=String
MeterStyle=EssentialPanel
solidcolor=#colorskin# ,210
[Mediacenter]
Meter=String
MeterStyle=EssentialPanel
[Slideshow]
Meter=String
MeterStyle=EssentialPanel
solidcolor=#colorskin# ,230
[cat1Subtitle5]
Meter=String
Text=" #Misc#"
Group=cat1 | Bye
MeterStyle=CatSubTitle
Y=(20*#ScaleDpi#)R
[Adobe]
Meter=String
MeterStyle=EssentialPanel
x=(360*#ScaleDpi#)
Y=(1*#ScaleDpi#)R
solidcolor=#colorskin# ,225
[Office]
Meter=String
MeterStyle=EssentialPanel
[ControlPanel]
Meter=String
MeterStyle=EssentialPanel
solidcolor=#colorskin# ,210
[Folders]
Meter=String
MeterStyle=EssentialPanel
[Launcher]
Meter=String
MeterStyle=EssentialPanel
solidcolor=#colorskin# ,210
[Computer]
Meter=String
MeterStyle=EssentialPanel
[Pong]
Meter=String
MeterStyle=EssentialPanel
[Greeter]
Meter=String
MeterStyle=EssentialPanel
solidcolor=#colorskin# ,240
[OpenOffice]
Meter=String
MeterStyle=EssentialPanel
Y=(1*#ScaleDpi#)R
x=(360*#ScaleDpi#)
[ShowDesktop]
Meter=String
MeterStyle=EssentialPanel
[Windows]
Meter=String
MeterStyle=EssentialPanel

[AdminTools]
Meter=String
MeterStyle=EssentialPanel
solidcolor=#colorskin# ,230
[Screenshot]
Meter=String
MeterStyle=EssentialPanel
solidcolor=#colorskin# ,240

[Search]
Meter=String
MeterStyle=EssentialPanel
solidcolor=#colorskin# ,220

[User]
Meter=String
MeterStyle=EssentialPanel


[Anniversary]
Meter=String
MeterStyle=EssentialPanel

[Cat1Mask]
Meter=Image
ImageName=#@#\Graphics\Gallery\mask-essential.png
Group=Cat1 | Bye
Hidden=1
x=(360*#ScaleDpi#)
y=(-715*#ScaleDpi#)R
w=(489*#ScaleDpi#)
imagetint=#textcolor2#


[CheckUpdate]
Measure=WebParser
URL=http://fediafedia.com/omnimo/up.dt
RegExp="<update>(.*)</update>.*<link>(.*)</link>"
FinishAction=[!Update]
UpdateDivider=1000

[UpdateAvailable]
Measure=WebParser
URL=[CheckUpdate]
StringIndex=1
IfMatch=1
IfMatchAction=[!ShowMeter Update][!Update]
DynamicVariables=1

[UpdateLink]
Measure=WebParser
URL=[CheckUpdate]
StringIndex=2


[Update]
Meter=String
w=(#GalleryW#-320)*#scaledpi#
h=(50)*#scaledpi#
x=(320+((#GalleryW#-320)/2))*#scaledpi#
y=(#GalleryH#-50/2)*#scaledpi#
solidcolor=0,120,0
Text=#UpdateAvailable#
stringalign=centercenter
fontsize=(10)*#scaledpi#
fontcolor=255,255,255
MouseActionCursor=1
Antialias=1
LeftMouseUpAction=!execute [[UpdateLink]?lang=#langcode#]
Hidden=1
DynamicVariables=1
