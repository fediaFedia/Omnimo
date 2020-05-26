# Switches between Dark and Light mode

param (
    [Parameter(Mandatory=$true)][int]$daySegment2,  # 0 = Day, 1 = Night
    [Parameter(Mandatory=$true)][int]$daySegment4,  # 0 = Sunrise, 1 = Day, 2 = Sunset, 3 = Night
    [Parameter(Mandatory=$true)][string]$imagePath  # Path to current wallpaper image
)




# Edit these values, possible variants: light, dark, lightwithpanels, darkwithpanels (the with variant also makes the panels dark or light)
# Make sure to specify your Rainmeter path and Rainmeter Program Path



$rainmeterPath = "C:\Users\User\Documents\Rainmeter\Skins\"
$rainmeterProgramPath = "C:\Program Files\Rainmeter\"
$daymode = "lightwithpanels"
$nightmode = "darkwithpanels"

$omnimoMode = switch ( $daySegment2 )
{
    0 { $daymode }
    1 { $nightmode }

}



$apppath = "WP7\@Resources\Common\OmnimoApp.exe"
$both = join-path -path $rainmeterPath -childpath $apppath



Start-Process -NoNewWindow -FilePath $both -ArgumentList $omnimoMode, $rainmeterPath, $rainmeterProgramPath