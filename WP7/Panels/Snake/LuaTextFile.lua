-- ## Information ################################################################
-- File:	LuaTextFile.lua
-- Author:	JSMorley
-- License:	Creative Commons Attribution-Non-Commercial-Share Alike 3.0
-- Updated:	February 12, 2011
-- ###############################################################################

-- ## Description ################################################################
-- Sample Lua script, demonstrating some ways to use the new integration of Lua
-- and Rainmeter.  See LuaTextFile.ini for some tips on how to set up the skin.
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

	FileToRead = "";

}

-- ## Initialize: ################################################################
-- The function Initialize() is used to set Lua to be able to read the values for
-- measures and meters from your skin later using GetValue(), and to define
-- and populate variables used in your script.  This section is required.
-- ###############################################################################
function Initialize()

	sFileToRead = PROPERTIES.FileToRead
	
end -- function Initialize

-- ## Update: ###################################################################
-- The function Update() is where you will put the bulk of your code.  This code
-- is executed on every update of the skin, and is required.  You can also add
-- your own functions in this file if needed, and call them from this function.
-- ###############################################################################
function Update()

	hReadingFile = io.input(sFileToRead)
	sAllText = io.read("*all")
	
	sAllText = string.gsub(sAllText, "\t", "     ")
	
	io.close(hReadingFile)
	
end -- function Update

-- ## GetStringValue: ############################################################
-- GetStringValue is a required function, which is how the script returns a value
-- to the calling Measure=Script in the skin.  I'm not using this in this case.
-- ###############################################################################
function GetStringValue()

	return tostring(sAllText)
	
end -- function GetStringValue

