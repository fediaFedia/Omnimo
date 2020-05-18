
[cat4Bg]
Meter=Image
SolidColor=0,0,0,1
W=((#galleryW#-320)*#ScaleDpi#)
h=(950*#ScaleDpi#)
x=(320*#ScaleDpi#)
Y=0
Group=cat4 | Bye
DynamicVariables=1
Hidden=1
[cat4BgBottom]
Meter=Image
SolidColor=0,0,0,1
W=((#galleryW#-320)*#ScaleDpi#)
h=(700*#ScaleDpi#)
x=(320*#ScaleDpi#)
Y=R
Group=cat4 | Bye
DynamicVariables=1
Hidden=1
[cat4Title]
Meter=String
Text="#CustomPanels#"
Group=cat4 | Bye
MeterStyle=CatHeaderTitle
Y=(-1600*#ScaleDpi#)R
[cat4Subtitle1]
Meter=String
Text=" #BuildingTools#"
Group=cat4 | Bye
MeterStyle=CatSubTitle
Y=R
[Create]
Meter=Image
MeterStyle=EssentialPanel
Group=cat4 | Bye
X=(360*#ScaleDpi#)
ImageName=#@#\Graphics\Gallery\icons\panelcreator.png
y=R
ImageTint=#textcolor2#
LeftMouseUpAction=["#@#Common\PanelCreator\PanelCreator.exe" "#SKINSPATH#"]
ToolTipText=Panel Creator
[Create2]
Meter=Image
MeterStyle=EssentialPanel
Group=cat4 | Bye
ImageTint=#textcolor2#
ImageName=#@#\Graphics\Gallery\icons\panelcreator2.png
LeftMouseUpAction=!ToggleConfig "WP7\TextItems\Extra\ExtraBuilder" "ExtraBuilder.ini"
ToolTipText=Extras Creator
[cat4Subtitle2]
Meter=String
Text=" #ItemscreatedwithPanelCreator#"
Group=cat4 | Bye
MeterStyle=CatSubTitle
Y=(20*#ScaleDpi#)R
[c1]
Meter=Image
MeterStyle=EssentialPanelBlank
X=(360*#ScaleDpi#)
y=R
ImageName="#ROOTCONFIGPATH#Panels\#Path1#\#Icon1#"
LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path1#" "Item.ini"
[c2]
Meter=Image
MeterStyle=EssentialPanelBlank
ImageName="#ROOTCONFIGPATH#Panels\#Path2#\#Icon2#"
LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path2#" "Item.ini"
[c3]
Meter=Image
MeterStyle=EssentialPanelBlank
ImageName="#ROOTCONFIGPATH#Panels\#Path3#\#Icon3#"
LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path3#" "Item.ini"

[c4]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path4#\#Icon4#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path4#" "Item.ini"
[c5]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path5#\#Icon5#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path5#" "Item.ini"
[c6]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path6#\#Icon6#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path6#" "Item.ini"
[c7]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path7#\#Icon7#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path7#" "Item.ini"
[c8]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path8#\#Icon8#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path8#" "Item.ini"
[c9]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path9#\#Icon9#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path9#" "Item.ini"
Y=(1*#ScaleDpi#)R
X=(360*#ScaleDpi#)
[c10]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path10#\#Icon10#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path10#" "Item.ini"
[c11]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path11#\#Icon11#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path11#" "Item.ini"
[c12]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path12#\#Icon12#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path12#" "Item.ini"
[c13]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path13#\#Icon13#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path13#" "Item.ini"
[c14]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path14#\#Icon14#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path14#" "Item.ini"
[c15]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path15#\#Icon15#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path15#" "Item.ini"
[c16]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path16#\#Icon16#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path16#" "Item.ini"
[c17]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path17#\#Icon17#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path17#" "Item.ini"
Y=(1*#ScaleDpi#)R
X=(360*#ScaleDpi#)
[c18]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path18#\#Icon18#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path18#" "Item.ini"
[c19]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path19#\#Icon19#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path19#" "Item.ini"
[c20]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path20#\#Icon20#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path20#" "Item.ini"
[c21]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path21#\#Icon21#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path21#" "Item.ini"
[c22]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path22#\#Icon22#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path22#" "Item.ini"
[c23]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path23#\#Icon23#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path23#" "Item.ini"
[c24]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path24#\#Icon24#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path24#" "Item.ini"
[c25]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path25#\#Icon25#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path25#" "Item.ini"
Y=(1*#ScaleDpi#)R
x=(360*#ScaleDpi#)
[c26]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path26#\#Icon26#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path26#" "Item.ini"
[c27]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path27#\#Icon27#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path27#" "Item.ini"
[c28]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path28#\#Icon28#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path28#" "Item.ini"
[c29]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path29#\#Icon29#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path29#" "Item.ini"
[c30]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path30#\#Icon30#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path30#" "Item.ini"
[c31]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path31#\#Icon31#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path31#" "Item.ini"
[c32]
Meter=Image
MeterStyle=EssentialPanelBlank
 ImageName="#ROOTCONFIGPATH#Panels\#Path32#\#Icon32#" 
 LeftMouseUpAction=!ToggleConfig "WP7\Panels\#Path32#" "Item.ini"
 




[edit]

Meter=Image

LeftMouseUpAction=[!ToggleMeterGroup Del][!Update]
ImageName=#@#\Graphics\Gallery\edit.png
x=(820)*#scaledpi#
y=(470)*#scaledpi#
w=(25*#scaledpi#)
ToolTipText=#Edit#
imagetint=#tttextcolor#
MouseActionCursor=1






[StylDel]
Hidden=1
Y=r
X=(61*#ScaleDpi#)r
w=(60*#ScaleDpi#)
h=(60*#ScaleDpi#)
AntiAlias=1
MouseActionCursor=1
Group=Del |  Bye
LeftMouseUpAction=["#@#Common\PanelCreator\PanelCreator.exe" "#SKINSPATH#" Delete #CURRENTSECTION#]

imagealpha=100

[1]
Meter=Image
MeterStyle=StylDel
X=(360*#ScaleDpi#)
y=(210*#ScaleDpi#)
ImageName=#SKINSPATH#\WP7\Panels\#Path1#\delete1.png

[2]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path2#\delete1.png

[3]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path3#\delete1.png

[4]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path4#\delete1.png

[5]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path5#\delete1.png

[6]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path6#\delete1.png

[7]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path7#\delete1.png

[8]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path8#\delete1.png

[9]
Meter=Image
MeterStyle=StylDel
Y=(1*#ScaleDpi#)R
X=(360*#ScaleDpi#)
ImageName=#SKINSPATH#\WP7\Panels\#Path9#\delete1.png

[10]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path10#\delete1.png

[11]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path11#\delete1.png

[12]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path12#\delete1.png

[13]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path13#\delete1.png

[14]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path14#\delete1.png

[15]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path15#\delete1.png

[16]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path16#\delete1.png


[17]
Meter=Image
MeterStyle=StylDel
Y=(1*#ScaleDpi#)R
X=(360*#ScaleDpi#)
ImageName=#SKINSPATH#\WP7\Panels\#Path17#\delete1.png

[18]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path18#\delete1.png

[19]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path19#\delete1.png

[20]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path20#\delete1.png

[21]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path21#\delete1.png

[22]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path22#\delete1.png

[23]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path23#\delete1.png

[24]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path24#\delete1.png


[25]
Meter=Image
MeterStyle=StylDel
Y=(1*#ScaleDpi#)R
X=(360*#ScaleDpi#)
ImageName=#SKINSPATH#\WP7\Panels\#Path25#\delete1.png

[26]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path26#\delete1.png

[27]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path27#\delete1.png

[28]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path28#\delete1.png

[29]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path29#\delete1.png

[30]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path30#\delete1.png

[31]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path31#\delete1.png

[32]
Meter=Image
MeterStyle=StylDel
ImageName=#SKINSPATH#\WP7\Panels\#Path32#\delete1.png
