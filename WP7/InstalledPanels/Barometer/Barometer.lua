-- ## Information ################################################################
-- File:	JSBarometer.lua
-- Author:	JSMorley
-- License:	Creative Commons Attribution-Non-Commercial-Share Alike 3.0
-- Updated:	February 20, 2011
-- ###############################################################################

-- ## Description ################################################################
-- Sample Lua script, demonstrating some ways to use the new integration of Lua
-- and Rainmeter.  See JSBarometer.ini for some tips on how to set up the skin.
--
-- Rainmeter, nor anyone associated with Rainmeter is responsible for teaching 
-- you the Lua scripting langague. This sample is only meant to demonstrate 
-- using the language with Rainmeter. There are many good sites where you can
-- learn Lua itself.  I recommend it. It will open up a lot of possibilities.
-- ###############################################################################

-- ## Properties: ################################################################
-- This PROPERTIES table is required.  It will be populated with the Key=Value
-- settings from the Measure=Script measure in your skin, below in the Initalize()
-- function.  This is how you pass settings of your choice from the skin to the
-- Lua script. It can be empty, but must exist.
-- ###############################################################################
PROPERTIES =
{

}

-- ## Initialize: ################################################################
-- The function Initialize() is used to set Lua to be able to read the values for
-- measures and meters from your skin later using GetValue(), and to define
-- and populate variables used in your script.  This section is required.
-- ###############################################################################
function Initialize()

	msMeasurePressure = SKIN:GetMeasure("MeasurePressure")
	msMeasureChange = SKIN:GetMeasure("MeasureChange")
	mtMeterPressure = tolua.cast(SKIN:GetMeter("MeterPressure"), "CMeterString")
	mtMeterDescription = tolua.cast(SKIN:GetMeter("MeterDescription"), "CMeterString")
	sUnitInSkin = SKIN:ReplaceVariables("#Unit#")
	
end -- function Initialize

-- ## Update: ###################################################################
-- The function Update() is where you will put the bulk of your code.  This code
-- is executed on every update of the skin, and is required.  You can also add
-- your own functions in this file if needed, and call them from this function.
-- ###############################################################################
function Update()

	SKIN:Bang("!DisableMeasure MeasureLuaScript")
	
	sCurrentPressure = msMeasurePressure:GetStringValue()
	sCurrentChange = msMeasureChange:GetStringValue()

	if string.lower(sUnitInSkin) == "c" then
		sConvertedPressure = tostring(round(tonumber(sCurrentPressure) * 33.8637526, 2))
	else
		sConvertedPressure = sCurrentPressure
	end
	
	if tonumber(sCurrentPressure) <= 28.5 then
		if sCurrentChange == "Falling" then
			sCurrentDescription = "Increasingly Stormy"
		elseif sCurrentChange == "Steady" then
			sCurrentDescription = "Rain and Stormy"
		elseif sCurrentChange == "Rising" then
			sCurrentDescription = "Stormy, but Improving"
		end
	end
		
	if tonumber(sCurrentPressure) >= 28.6 and tonumber(sCurrentPressure) <= 29.5 then
		if sCurrentChange == "Falling" then
			sCurrentDescription = "Rain Forecasted"
		elseif sCurrentChange == "Steady" then
			sCurrentDescription = "Rainy"
		elseif sCurrentChange == "Rising" then
			sCurrentDescription = "Rainy, but Improving"
		end
	end
	
	if tonumber(sCurrentPressure) >= 29.6 and tonumber(sCurrentPressure) <= 30.09 then
		if sCurrentChange == "Falling" then
			sCurrentDescription = "Changing toward Rain"
		elseif sCurrentChange == "Steady" then
			sCurrentDescription = "Possible Change"
		elseif sCurrentChange == "Rising" then
			sCurrentDescription = "Changing toward Fair"
		end
	end
	
	if tonumber(sCurrentPressure) >= 30.1 and tonumber(sCurrentPressure) <= 30.5 then
		if sCurrentChange == "Falling" then
			sCurrentDescription = "Fair, but Degrading"
		elseif sCurrentChange == "Steady" then
			sCurrentDescription = "Fair"
		elseif sCurrentChange == "Rising" then
			sCurrentDescription = "Fair, and Improving"
		end
	end
	
	if tonumber(sCurrentPressure) >= 30.6 then
		if sCurrentChange == "Falling" then
			sCurrentDescription = "Very Dry, but Degrading"
		elseif sCurrentChange == "Steady" then
			sCurrentDescription = "Very Dry"
		elseif sCurrentChange == "Rising" then
			sCurrentDescription = "Very Dry, and Improving"
		end		
	end
	
	mtMeterPressure:SetText(" "..sConvertedPressure)
	mtMeterDescription:SetText(sCurrentDescription)

end -- function Update

-- ## GetStringValue: ############################################################
-- GetStringValue is a required function, which is how the script returns a value
-- to the calling Measure=Script in the skin.  I'm not using this in this case.
-- ###############################################################################
function GetStringValue()

	return sCurrentDescription
	
end -- function GetStringValue

function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end