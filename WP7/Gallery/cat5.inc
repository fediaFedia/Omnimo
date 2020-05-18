
[cat5Bg]
Meter=Image
SolidColor=0,0,0,1
W=((#galleryW#-320)*#ScaleDpi#)
h=(950*#ScaleDpi#)
x=(320*#ScaleDpi#)
Y=0
Group=cat5 | Bye
DynamicVariables=1
Hidden=1
[cat5BgBottom]
Meter=Image
SolidColor=0,0,0,1
W=((#galleryW#-320)*#ScaleDpi#)
h=(700*#ScaleDpi#)
x=(320*#ScaleDpi#)
Y=R
Group=cat5 | Bye
DynamicVariables=1
Hidden=1
[cat5Title]
Meter=String
Text="#ContributorPack#"
Group=cat5 | Bye
MeterStyle=CatHeaderTitle
Y=(-1600*#ScaleDpi#)R


[cat5Subtitle1]
Meter=String
Text=#Donation2#
Group=cat5 | Bye
MeterStyle=CatSubTitle
W=(470*#ScaleDpi#)
H=(90*#ScaleDpi#)
ClipString=1
Y=(25*#ScaleDpi#)R


[Clipboard]
Meter=String
MeterStyle=EssentialPanel | P
Group=cat5 | Bye
x=(360*#ScaleDpi#)
y=(175*#ScaleDpi#)
solidcolor=#colorskin# ,200
[Dice]
Meter=String
MeterStyle=EssentialPanel | P
Group=cat5 | Bye
solidcolor=#colorskin# ,230
[DisplaySwitch]
Meter=String
MeterStyle=EssentialPanel | P
Group=cat5 | Bye
solidcolor=#colorskin# ,240
[DownForEveryoneOrJustMe]
Meter=String
MeterStyle=EssentialPanel | P
Group=cat5 | Bye
solidcolor=#colorskin# ,220
[GoldPrice]
Meter=String
MeterStyle=EssentialPanel | P
Group=cat5 | Bye
solidcolor=#colorskin# ,250
Text=
[HTCSenseWeather]
Meter=String
MeterStyle=EssentialPanel | P
Group=cat5 | Bye
solidcolor=#colorskin# ,210
w=(120*#ScaleDpi#+(1*#ScaleDpi#))
Text=
[Lists]
Meter=String
MeterStyle=EssentialPanel | P
Group=cat5 | Bye
solidcolor=#colorskin# ,220
X=(1*#ScaleDpi#)R
[MultiMeterE]
Meter=String
MeterStyle=EssentialPanel | P
Group=cat5 | Bye
Y=(1*#ScaleDpi#)R
x=(360*#ScaleDpi#)
solidcolor=#colorskin# ,200
[Notes++]
Meter=String
MeterStyle=EssentialPanel | P
Group=cat5 | Bye
Text=
solidcolor=#colorskin# ,240
[OpenGift]
Meter=String
MeterStyle=EssentialPanel | P
Group=cat5 | Bye
solidcolor=#colorskin# ,250
[SportScores]
Meter=String
MeterStyle=EssentialPanel | P
Group=cat5 | Bye
solidcolor=#colorskin# ,200
Text=
[SteamNew]
Meter=String
MeterStyle=EssentialPanel | P
Group=cat5 | Bye
solidcolor=#colorskin# ,240
Text=
[PremiumInternetShortcuts]
Meter=String
MeterStyle=EssentialPanel | P
Group=cat5 | Bye
solidcolor=#colorskin# ,240
Text=
[GamesCollection]
Meter=String
MeterStyle=EssentialPanel | P
Group=cat5 | Bye
solidcolor=#colorskin# ,240
w=(120*#ScaleDpi#+(1*#ScaleDpi#))
Text=


[HomeTheaterShortcuts]
Meter=String
MeterStyle=EssentialPanel | P
Group=cat5 | Bye
solidcolor=#colorskin# ,240
Y=(1*#ScaleDpi#)R
x=(360*#ScaleDpi#)
w=(((60*#ScaleDpi#)*4)+(1*#ScaleDpi#)*3)
h=(60*#ScaleDpi#)*2
LeftMouseUpAction=!ToggleConfig "WP7\Gallery\#CURRENTSECTION#" "Item.ini"
Text=
[GamesShortcuts]
Meter=String
MeterStyle=EssentialPanel | P
Group=cat5 | Bye
solidcolor=#colorskin# ,240
w=(((60*#ScaleDpi#)*4)+(1*#ScaleDpi#)*3)
h=(60*#ScaleDpi#)*2
X=1R
LeftMouseUpAction=!ToggleConfig "WP7\Gallery\#CURRENTSECTION#" "Item.ini"
Text=


[DonateE]
Meter=Image
ImageName=#@#\Graphics\Gallery\Donate.png
Group=cat5 | Bye
X=(360*#ScaleDpi#)
y=(15*#ScaleDpi#)R
w=(120*#ScaleDpi#)
LeftMouseUpAction=["https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=fedia1%40gmail%2ecom&lc=US&item_name=Donate%20to%20Omnimo%20UI&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donateCC_LG%2egif%3aNonHosted"]

ToolTipText=#Donateifyoulike#

[DonateP]
Meter=Image
ImageName=#@#\Graphics\Gallery\patron.png
Group=cat5 | Bye
X=(#GalleryW#-(150)-38)*#ScaleDpi#
y=r
w=(150*#ScaleDpi#)
LeftMouseUpAction=["https://www.patreon.com/bePatron?u=34630675"]

ToolTipText=#Donateifyoulike#



[ContribPack]
Meter=Image
ImageName=#@#Graphics\Gallery\mask-contrib.png
Group=cat5 | Bye
X=(360*#ScaleDpi#)
y=(-290*#ScaleDpi#)R
w=(487*#ScaleDpi#)
ImageAlpha=125