; ======================================================
; @Include template file to populate all
; Hourly (12 hours) Weather information from Weather.com
;=======================================================

[@HourlyAll]
Measure=WebParser
Group=Weather | WeatherHourly
Url=#URLHourly#
RegExp=(?siU)^(.*)$
UpdateRate=#UpdateRate#
;Debug=2
;Debug2File=#@#Hourly.txt

; Parent for the Hourly Forecast

[@HourlyParent]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyAll]
StringIndex=0
RegExp=#Hourly#
LogSubstringErrors=0

; Children for the Hourly Forecast

[@Hourly1Time]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=1

[@Hourly1Icon]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=2

[@Hourly1Day]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=3

[@Hourly1Conditions]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=4

[@Hourly1Temperature]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=5

[@Hourly1TemperatureSymbol]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=6

[@Hourly1Precipitation]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=7

[@Hourly1PrecipitationSymbol]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=8

[@Hourly2Time]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=9

[@Hourly2Icon]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=10

[@Hourly2Day]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=11

[@Hourly2Conditions]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=12

[@Hourly2Temperature]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=13

[@Hourly2TemperatureSymbol]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=14

[@Hourly2Precipitation]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=15

[@Hourly2PrecipitationSymbol]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=16

[@Hourly3Time]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=17

[@Hourly3Icon]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=18

[@Hourly3Day]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=19

[@Hourly3Conditions]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=20

[@Hourly3Temperature]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=21

[@Hourly3TemperatureSymbol]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=22

[@Hourly3Precipitation]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=23

[@Hourly3PrecipitationSymbol]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=24

[@Hourly4Time]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=25

[@Hourly4Icon]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=26

[@Hourly4Day]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=27

[@Hourly4Conditions]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=28

[@Hourly4Temperature]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=29

[@Hourly4TemperatureSymbol]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=30

[@Hourly4Precipitation]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=31

[@Hourly4PrecipitationSymbol]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=32

[@Hourly5Time]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=33

[@Hourly5Icon]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=34

[@Hourly5Day]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=35

[@Hourly5Conditions]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=36

[@Hourly5Temperature]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=37

[@Hourly5TemperatureSymbol]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=38

[@Hourly5Precipitation]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=39

[@Hourly5PrecipitationSymbol]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=40

[@Hourly6Time]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=41

[@Hourly6Icon]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=42

[@Hourly6Day]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=43

[@Hourly6Conditions]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=44

[@Hourly6Temperature]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=45

[@Hourly6TemperatureSymbol]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=46

[@Hourly6Precipitation]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=47

[@Hourly6PrecipitationSymbol]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=48

[@Hourly7Time]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=49

[@Hourly7Icon]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=50

[@Hourly7Day]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=51

[@Hourly7Conditions]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=52

[@Hourly7Temperature]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=53

[@Hourly7TemperatureSymbol]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=54

[@Hourly7Precipitation]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=55

[@Hourly7PrecipitationSymbol]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=56

[@Hourly8Time]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=57

[@Hourly8Icon]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=58

[@Hourly8Day]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=59

[@Hourly8Conditions]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=60

[@Hourly8Temperature]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=61

[@Hourly8TemperatureSymbol]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=62

[@Hourly8Precipitation]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=63

[@Hourly8PrecipitationSymbol]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=64

[@Hourly9Time]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=65

[@Hourly9Icon]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=66

[@Hourly9Day]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=67

[@Hourly9Conditions]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=68

[@Hourly9Temperature]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=69

[@Hourly9TemperatureSymbol]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=70

[@Hourly9Precipitation]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=71

[@Hourly9PrecipitationSymbol]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=72

[@Hourly10Time]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=73

[@Hourly10Icon]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=74

[@Hourly10Day]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=75

[@Hourly10Conditions]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=76

[@Hourly10Temperature]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=77

[@Hourly10TemperatureSymbol]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=78

[@Hourly10Precipitation]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=79

[@Hourly10PrecipitationSymbol]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=80

[@Hourly11Time]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=81

[@Hourly11Icon]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=82

[@Hourly11Day]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=83

[@Hourly11Conditions]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=84

[@Hourly11Temperature]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=85

[@Hourly11TemperatureSymbol]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=86

[@Hourly11Precipitation]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=87

[@Hourly11PrecipitationSymbol]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=88

[@Hourly12Time]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=89

[@Hourly12Icon]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=90

[@Hourly12Day]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=91

[@Hourly12Conditions]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=92

[@Hourly12Temperature]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=93

[@Hourly12TemperatureSymbol]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=94

[@Hourly12Precipitation]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=95

[@Hourly12PrecipitationSymbol]
Measure=WebParser
Group=Weather | WeatherHourly
Url=[@HourlyParent]
StringIndex=96

