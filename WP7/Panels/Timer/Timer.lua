function Update()

	targetString = SKIN:GetVariable('Target')

	timeTarget = TimeStamp(targetString)
	timeNow = os.time(os.date('*t'))
	
	countDown = os.difftime(timeTarget, timeNow)

	if countDown < 0 then countDown = 0 end
	weeks, days, hours, minutes, seconds = FormatSeconds(countDown)	
	
	SKIN:Bang('!SetOption', 'MeasureHours', 'Formula', hours)
	SKIN:Bang('!SetOption', 'MeasureMinutes', 'Formula', minutes)
	SKIN:Bang('!SetOption', 'MeasureSeconds', 'Formula', seconds)
	
	return(countDown)

end

function TimeStamp(targetString)
   
   -- date format: 7/26/2017 8:32:10

   month, day, year, hour, min, sec =
   string.match(targetString, "(%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+)")
	
	currentTimeTable = os.date()
	currentDST = currentTimeTable['isdst']
	
   timeStamp = os.time({year=year, month=month, day=day, hour=hour, min=min, sec=sec, isdst=currentDST})
   
   return timeStamp

end

function FormatSeconds(secondsArg)

	weeks = math.floor(secondsArg / 604800)
	remainder = secondsArg % 604800
	days = math.floor(remainder / 86400)
	remainder = remainder % 86400
	hours = math.floor(remainder / 3600)
	remainder = remainder % 3600
	minutes = math.floor(remainder / 60)
	seconds = remainder % 60
	
	return weeks, days, hours, minutes, seconds
	
end
