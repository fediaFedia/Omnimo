function Initialize()

	msWebParser = SKIN:GetMeasure(SKIN:GetVariable('WebParserMeasure'))
	itemsToShow = tonumber(SKIN:GetVariable('ItemsToShow'))
	newColor = SKIN:GetVariable('NewColor')
	newMinutes = tonumber(SKIN:GetVariable('NewMinutes'))
	keywordColor = SKIN:GetVariable('KeywordColor')
	keywords = SKIN:GetVariable('Keywords')
	tKeywords = {}
	for keywords in string.gmatch(keywords, '[^ ]+') do	table.insert(tKeywords, keywords) end
	
	currentItem = 1
	
end -->Initialize

function Update()

	local rawFeed = msWebParser:GetStringValue()
	
	CheckFeed(rawFeed, errorConfig)
	ReadFeed(rawFeed, itemsToShow)
	if errorCondition then return "Error in Feed" end

	if currentItem >= itemsToShow then currentItem = 1 end
	
	for i = 1, 4 do
		
		SKIN:Bang('!SetOption MeterPageCount Text \"['..math.floor(currentItem / 4)..'-2]\"')
		SKIN:Bang('!SetOption MeterTitle'..i..' Text \"'..tTitles[currentItem]..'\"')
		SKIN:Bang('!SetOption MeterTitle'..i..' LeftMouseUpAction """!Execute [\"'..tLinks[currentItem]..'\"]"""')
		SKIN:Bang('!SetOption MeterTitle'..i..' ToolTipText \"'..tTitles[currentItem]..'\"')
		SKIN:Bang('!SetOption MeterTitle'..i..' FontColor \"\"')

		local foundKeyword = 0
		if #tKeywords > 0 then
			for j = 1, #tKeywords do
				if string.find(string.upper(tTitles[currentItem]), string.upper(tKeywords[j])) then foundKeyword = 1 end
			end
			if foundKeyword > 0 then
				SKIN:Bang('!SetOption MeterTitle'..i..' FontColor '..keywordColor)
			end
		end
		
		if tDates[currentItem] ~= '' then
			local timeNow = os.time(os.date('!*t'))
			local timeItem = TimeStamp(tDates[currentItem])
			timeDiff = os.difftime(timeNow, timeItem) / 60
			if timeDiff < newMinutes then
				SKIN:Bang('!SetOption MeterTitle'..i..' FontColor '..newColor)
			end
			SKIN:Bang('!SetOption MeterTitle'..i..' ToolTipText \"'..tTitles[currentItem]..' - '..Round(timeDiff)..' minutes ago.\"')
		end
		
		currentItem = currentItem + 1
		
	end

	return "Breaking News"

end -->Update

function CheckFeed(rawFeed, errorConfig)

	errorCondition = false
	
	patternFeedTitle = '.-<title.->(.-)</title>'
	patternItemTitle = '.-<title.->(.-)</title>'
	if string.match(rawFeed, '<item[^s].-</item[^s]') then
		feedType = 'RSS'
		rawFeedCounted, numberOfItems = string.gsub(rawFeed, '<item[^s]', "")
		patternFeedLink = '.-<link.->(.-)</link>'
		patternItem = '<item[^s].-</item>'
		patternItemAuthor = '.-<author>(.-)</author>'
		patternItemLink = '.-<link.->(.-)</link>'
		patternItemDesc = '.-<description.->(.-)</description>'
		patternItemDate = '.-<pubDate.->(.-)</pubDate>'
	elseif string.match(rawFeed, '<entry.-</entry') then
		feedType = 'ATOM'
		rawFeedCounted, numberOfItems = string.gsub(rawFeed, '<entry', "")
		patternFeedLink = '.-<link.-href="(.-)"'
		patternItem = '<entry.-</entry>'
		patternItemAuthor = '.-<author.-<name>(.-)</name>'				
		patternItemLink = '.-<link.-href="(.-)"'
		patternItemDesc = '.-<summary.->(.-)</summary>'
		patternItemDate = '.-<updated.->(.-)</updated>'
	else
		errorCondition = true
	end
	
	return errorCondition
	
end -->CheckFeed

function ReadFeed(rawFeed, items)

	tAuthors = {}
	tLinks = {}
	tTitles = {}
	tDates = {}
	tDesc = {}
	
	feedTitle = Substitute(string.match(rawFeed, patternFeedTitle))
	feedLink = Substitute(string.match(rawFeed, patternFeedLink))
	
	init = 0
	if items then
		for i = 1, items do
			itemStart, itemEnd = string.find(rawFeed, patternItem, init)
			item = string.sub(rawFeed, itemStart, itemEnd)
			if string.match(item, patternItemDesc) then
				tDesc[i] = Substitute(string.match(item, patternItemDesc))
			else
				tDesc[i] = ''
			end			
			if string.match(item, patternItemAuthor) then
				tAuthors[i] = Substitute(string.match(item, patternItemAuthor))
			else
				tAuthors[i] = ''
			end	
			tTitles[i] = Substitute(string.match(item, patternItemTitle))
			if tTitles[i] == '' then tTitles[i] = '(No Title)' end
			tLinks[i] = Substitute(string.match(item, patternItemLink))
			if string.match(item, patternItemDate) then	
				tDates[i] = Substitute(string.match(item, patternItemDate))
			else
				tDates[i] = ''
			end
			init = itemEnd + 1
		end
	end	

end -->ReadFeed
	
function Substitute(tableItem)

	if tableItem then
		tableItem = string.gsub(tableItem, "\"", "'")
		tableItem = string.gsub(tableItem, "<!%[CDATA%[", "")
		tableItem = string.gsub(tableItem, "%]%]>", "")
		tableItem = string.gsub(tableItem, "/PRE&gt;", "")
		tableItem = string.gsub(tableItem, "PRE&gt;", "")
		tableItem = string.gsub(tableItem, "PRE&gt;", "")
		tableItem = string.gsub(tableItem, "&mdash;", "-")
		tableItem = string.gsub(tableItem, "\n", "")
		tableItem = string.gsub(tableItem, "  ", "")
	end
	
	return tableItem
	
end -- function	Substitute

function TimeStamp(itemDate)

	local tMonthNum={Jan=1;Feb=2;Mar=3;Apr=4;May=5;Jun=6;Jul=7;Aug=8;Sep=9;Oct=10;Nov=11;Dec=12;}
	local weekday, day, monthText, year, hour, min, sec, zone =
		string.match(itemDate, "(.-), (.-) (.-) (.-) (.-):(.-):(.-) (.-)")

	local timeStamp = os.time({year=year, month=tMonthNum[monthText], day=day, hour=hour, min=min, sec=sec})
	local checkDST = os.date('*t')['isdst']
	if checkDST then timeStamp = timeStamp + 3600 end
	
	return timeStamp
       
end -->TimeStamp

function Round(num, idp)

  if idp and idp>0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  
  return math.floor(num + 0.5)
  
end -->Round
