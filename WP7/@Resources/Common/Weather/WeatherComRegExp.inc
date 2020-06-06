; Do NOT change this file unless you are sure you know what you are doing !!!
; ========================================================================

; © 2020 by xxenium

[Variables]

Location=(?siU)(?(?=.*"location":).*{.*"countryName":"(.*)","displayName":"(.*)","latitude":.*,"longitude":.*,"offsetSecs":.*})
CurrentWeather=(?siU)(?(?=.*"observation").*:{"barometricPressure":(.*),"conditionCode":(.*),"conditionDescription":"(.*)").*(?(?=.*"temperature":).*{"now":(.*),"high":(.*),"low":(.*),"feelsLike":(.*)}),(?(?=.*"observationTime").*:{.*},"humidity":(.*),"precipitationProbability":(.*),"uvDescription":"(.*)","uvIndex":(.*),"visibility":(.*),"windDirection":.*,"windDirectionCode":"(.*)","windSpeed":(.*),.*)
CurrentCondition=(?siU)(?(?=.*<span data-code=".*").* class=".*" data-reactid=".*"><img alt=".*" height=".*" title="(.*)" width=".*" class=" " src="https://s.yimg.com/os/weather/1.0.1/shadow_icon/.*/(.*)" data-reactid=".*"/></span><span class="description .*" data-reactid=".*">.*</span>)
Forecast=(?siU)"daily":.*(?(?=.*{"conditionCode").*:(.*),"conditionDescription":"(.*)",.*"temperature":{"high":(.*),"low":(.*)},"observationTime":{.*"timestamp":"(.*)"},"humidity":(.*),"precipitationProbability":(.*),.*}),(?(?=.*{"conditionCode").*:(.*),"conditionDescription":"(.*)",.*"temperature":{"high":(.*),"low":(.*)},"observationTime":{.*"timestamp":"(.*)"},"humidity":(.*),"precipitationProbability":(.*),.*}),(?(?=.*{"conditionCode").*:(.*),"conditionDescription":"(.*)",.*"temperature":{"high":(.*),"low":(.*)},"observationTime":{.*"timestamp":"(.*)"},"humidity":(.*),"precipitationProbability":(.*),.*}),(?(?=.*{"conditionCode").*:(.*),"conditionDescription":"(.*)",.*"temperature":{"high":(.*),"low":(.*)},"observationTime":{.*"timestamp":"(.*)"},"humidity":(.*),"precipitationProbability":(.*),.*})
ForecastConditions=(?siU)</div><div class="accordion.*daily" data-reactid=".*">(?(?=.*<div class=".*forecast-item).*".*>.*<span data-reactid=".*">.*</span>.*<img alt=".*" height=".*" title="(.*)" width=".*" class=" " src="https://s.yimg.com/os/weather/1.0.1/shadow_icon/.*/(.*)" data-reactid=".*"/>).*(?(?=.*<div class=".*forecast-item).*".*>.*<span data-reactid=".*">.*</span>.*<img alt=".*" height=".*" title="(.*)" width=".*" class=" " src="https://s.yimg.com/os/weather/1.0.1/shadow_icon/.*/(.*)" data-reactid=".*"/>).*(?(?=.*<div class=".*forecast-item).*".*>.*<span data-reactid=".*">.*</span>.*<img alt=".*" height=".*" title="(.*)" width=".*" class=" " src="https://s.yimg.com/os/weather/1.0.1/shadow_icon/.*/(.*)" data-reactid=".*"/>).*(?(?=.*<div class=".*forecast-item).*".*>.*<span data-reactid=".*">.*</span>.*<img alt=".*" height=".*" title="(.*)" width=".*" class=" " src="https://s.yimg.com/os/weather/1.0.1/shadow_icon/.*/(.*)" data-reactid=".*"/>).*
SUN=(?siU)(?(?=.*"sunAndMoon").*:{"sunrise":(.*),"sunset":(.*),"moonPhase":.*})




; © 2020 by xxenium









