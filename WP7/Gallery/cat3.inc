
[cat3Bg]
Meter=Image
SolidColor=0,0,255,1
W=((#galleryW#-320)*#ScaleDpi#)
h=(950*#ScaleDpi#)
x=(320*#ScaleDpi#)
Y=0
Group=cat3 | Bye
DynamicVariables=1
Hidden=1
[cat3BgBottom]
Meter=Image
SolidColor=0,0,255,1
W=((#galleryW#-320)*#ScaleDpi#)
h=(700*#ScaleDpi#)
x=(320*#ScaleDpi#)
Y=R
Group=cat3 | Bye
DynamicVariables=1
Hidden=1
[cat3Title]
Meter=String
Text="#TextItems#"
Group=cat3 | Bye
MeterStyle=CatHeaderTitle
Y=(-1600*#ScaleDpi#)R
[cat3Subtitle1]
Meter=String
Text=" #LargeItems#"
Group=cat3 | Bye
MeterStyle=CatSubTitle
Y=R
[worldclocktextitem]
Meter=Image
MeterStyle=LargeTextItem
X=(360*#ScaleDpi#)
y=R
solidcolor=40,40,40
MouseOverAction=[!SetOption #CURRENTSECTION# solidcolor 100,100,100][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# solidcolor "40,40,40"][!Update]
LeftMouseUpAction=!ToggleConfig "wp7\textitems\worldclock" "Item.ini"
[todolist]
Meter=Image
MeterStyle=LargeTextItem
solidcolor=40,40,40
MouseOverAction=[!SetOption #CURRENTSECTION# solidcolor 100,100,100][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# solidcolor "40,40,40"][!Update]
LeftMouseUpAction=!ToggleConfig "wp7\textitems\System" "Item.ini"
[rssreader1]
Meter=Image
MeterStyle=LargeTextItem
solidcolor=35,35,35
MouseOverAction=[!SetOption #CURRENTSECTION# solidcolor 100,100,100][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# solidcolor "35,35,35"][!Update]
LeftMouseUpAction=!ToggleConfig "wp7\textitems\Reader" "Item.ini"
[nowplaying]
Meter=Image
MeterStyle=LargeTextItem
solidcolor=70,70,70
MouseOverAction=[!SetOption #CURRENTSECTION# solidcolor 100,100,100][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# solidcolor "70,70,70"][!Update]
LeftMouseUpAction=!ToggleConfig "wp7\textitems\Weather" "Item.ini"
[doublereader]
Meter=Image
MeterStyle=LargeTextItem
Y=(1*#ScaleDpi#)R
X=(360*#ScaleDpi#)
solidcolor=55,55,55
MouseOverAction=[!SetOption #CURRENTSECTION# solidcolor 100,100,100][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# solidcolor "55,55,55"][!Update]
LeftMouseUpAction=!ToggleConfig "wp7\textitems\Calendar" "Item.ini"
[resourcemonitor]
Meter=Image
MeterStyle=LargeTextItem
solidcolor=50,50,50
MouseOverAction=[!SetOption #CURRENTSECTION# solidcolor 100,100,100][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# solidcolor "50,50,50"][!Update]
LeftMouseUpAction=!ToggleConfig "wp7\textitems\NowPlaying" "Item.ini"
[visualizertextitem]
Meter=Image
MeterStyle=LargeTextItem
solidcolor=40,40,40
MouseOverAction=[!SetOption #CURRENTSECTION# solidcolor 100,100,100][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# solidcolor "40,40,40"][!Update]
LeftMouseUpAction=!ToggleConfig "wp7\textitems\Visualizer" "Item.ini"

[notestextitem]
Meter=Image
MeterStyle=LargeTextItem
solidcolor=60,60,60
MouseOverAction=[!SetOption #CURRENTSECTION# solidcolor 100,100,100][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# solidcolor "60,60,60"][!Update]
LeftMouseUpAction=!ToggleConfig "wp7\textitems\Notes" "Item.ini"
[Cat3Subtitle2]
Meter=String
Text=" #SmallItems#"
Group=cat3 | Bye
MeterStyle=CatSubTitle
Y=(20*#ScaleDpi#)R
[daydate]
Meter=String
MeterStyle=EssentialPanelText
X=(360*#ScaleDpi#)
y=R
LeftMouseUpAction=!ToggleConfig "wp7\textitems\G'DayMate" "Day.ini"
ToolTipText=A customizable day textitem, comes with many variantsbottom
Text=Text Date / Day 
[verticalmenu]
Meter=String
MeterStyle=EssentialPanelText
LeftMouseUpAction=!ToggleConfig "wp7\textitems\Extra\Menu" "Menu.ini"
Text=Vertical Metro Menu
tooltipwidth=150
[horizontalmenu]
Meter=String
MeterStyle=EssentialPanelText
LeftMouseUpAction=!ToggleConfig "wp7\textitems\Extra\MenuHorizontal" "Menu.ini"
Text=Horizontal Metro Menu
tooltipwidth=150
[digitalclocktextitem]
Meter=String
MeterStyle=EssentialPanelText
LeftMouseUpAction=!ToggleConfig "wp7\textitems\Extra\ClockNews" "Item.ini"
Text=Clock news
ToolTipText=Omnimo 10 Clock, right click for variants
[powerbuttons]
Meter=String
MeterStyle=EssentialPanelText
LeftMouseUpAction=!ToggleConfig "wp7\textitems\Extra\PowerButtons" "Item.ini"
Text=Power Buttons
ToolTipText=With dialogue and without
[courierclock]
Meter=String
MeterStyle=EssentialPanelText
LeftMouseUpAction=[!ToggleConfig "wp7\textitems\Extra\Courier" "date2.ini"][!ActivateConfig "wp7\textitems\Extra\Courier\Clock" "analogue.ini"]
Text=Courier Clock
ToolTipText=Courier like clock and date (What's Courier???)
[searchbar]
Meter=String
MeterStyle=EssentialPanelText
LeftMouseUpAction=!ToggleConfig "wp7\textitems\Extra\SearchButton" "SearchButton.ini"
Text=Search Bar
ToolTipText=A search button that opens a field when clicked
[circularclock]
Meter=String
MeterStyle=EssentialPanelText
LeftMouseUpAction=!ToggleConfig "wp7\textitems\Extra\LargeClock" "Item.ini"
Text=Large Analogue Clock
ToolTipText=With options
[Cat3Subtitle3]
Meter=String
Text=" #BackgroundsDecorationandMisc#"
Group=cat3 | Bye
MeterStyle=CatSubTitle
Y=(20*#ScaleDpi#)R
[background]
Meter=String
MeterStyle=EssentialPanelText
X=(360*#ScaleDpi#)
y=R
LeftMouseUpAction=!ToggleConfig "wp7\background\Static" "bg.ini"
Text=BG Fullscreen
ToolTipText=Fullscreen background with several options
[customizablebackground]
Meter=String
MeterStyle=EssentialPanelText
LeftMouseUpAction=!ToggleConfig "wp7\background" "bg.ini"
Text=BG Fullscreen Custom
ToolTipText=Customizable background with many options
[daynightbackground]
Meter=String
MeterStyle=EssentialPanelText
LeftMouseUpAction=!ToggleConfig "WP7\Background\DayNight" "Item.ini"
Text=BG Day Night 
ToolTipText=A background that changes slightly during the day
[portalparts]
Meter=String
MeterStyle=EssentialPanelText
LeftMouseUpAction=[!ToggleConfig "WP7\textitems\extra\Portal" "item.ini"][!ToggleConfig "WP7\textitems\extra\Portal\RightSide" "item.ini"]
Text=Portals
ToolTipText=Portals for your desktop
[sidebar]
Meter=String
MeterStyle=EssentialPanelText
LeftMouseUpAction=!ToggleConfig "WP7\TextItems\#Win8Sidebar\Sidebar" "Sidebar.ini"
MeterStyle=styl
Text=Sidebar
ToolTipText=Opens a toggler which provides access to sidebar
[topbar]
Meter=String
MeterStyle=EssentialPanelText
LeftMouseUpAction=!ToggleConfig "wp7\textitems\#topbar" "topbaraddons.ini"
MeterStyle=styl
Text=Tiny Gallery for Tiny Addons
ToolTipText=Can be used with Top Bar or Sidebar
[trajan]
Meter=String
MeterStyle=EssentialPanelText
LeftMouseUpAction=[!ToggleConfig "WP7\TextItems\Extra\TrajanQuote" "Item.ini"][!ToggleConfig "WP7\TextItems\Extra\TrajanQuote\Owl" "Item.ini"]
Text=Fancy Trajan Quote
ToolTipText=Write your own sophisticated quotes
[ExtraBuilder]
Meter=String
MeterStyle=EssentialPanelText
LeftMouseUpAction=[!ToggleConfig "WP7\TextItems\Extra\ExtraBuilder" "ExtraBuilder.ini"]
Text=Extra Builder
ToolTipText=Add your own custom elements
solidcolor=#colorskin#
[Cat3Mask]
Meter=Image
ImageName=#@#\Graphics\Gallery\mask-textitems.png
Group=Cat3 | Bye
Hidden=1
x=(360*#ScaleDpi#)
y=(95*#ScaleDpi#)
w=(490*#ScaleDpi#)