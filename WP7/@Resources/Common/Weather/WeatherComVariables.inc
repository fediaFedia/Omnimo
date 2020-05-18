[Variables]

; Getting and setting your LocationCode can be done one of several ways.
; 
; Go to https://weather.com/
; Search for your city by name.
; Use the long number at the end of the resulting URL, for example:
; https://weather.com/weather/today/l/1665d9e3052c3448be48dafc1587318a27ee85516e97e0b5376043cd41a4f0e8
; The LocationCode would be 1665d9e3052c3448be48dafc1587318a27ee85516e97e0b5376043cd41a4f0e8
; Copy and enter that as the value for LocationCode below.
; LocationCode=1665d9e3052c3448be48dafc1587318a27ee85516e97e0b5376043cd41a4f0e8
;
; You can also use the location code used in earlier skins using wxdata as the source.
; LocationCode=USVA0944
;
; Alternatively, in the USA, you can simply use your ZipCode as the LocationCode.
; LocationCode=22308

LocationCode=GMXX0040

; If another language or unit(s) of measures are desired, simply go to https://weather.com/
; Using the controls at the top of the page, set your country and units of measure as desired.
; Copy and enter the Language from the resulting URL.

; For example, French would be Language=fr-FR
; The unit(s) of measure are automatic, based on the language.
; For instance, you cannot have the language be French, but the units be F imperial.

; Note however, that simply changing from imperial F to metric C units of measure while keeping the 
; langage as English can be done by using en-GB as the Language.
 
Language=en-GB

; How often to update the weather information. Default is 600 or 10 minutes.

UpdateRate=1200

; Don't change these.

LanguagePath=/#Language#
URLcurrent=https://weather.com/#Language#/weather/today/l/#LocationCode#
URLforecast=https://weather.com/#Language#/weather/tenday/l/#LocationCode#
URLhourly=https://weather.com/#Language#/weather/hourbyhour/l/#LocationCode#
