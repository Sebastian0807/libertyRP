--[[
Project: VitaRP
File: autohaus-server.lua
Author(s):	Tommi, Nitaco
]]--
--Lift
local keypad1up = createObject(2886, 1073, 1718.8000488281 , 11.5, 0, 0, 180)
local keypad2down = createObject(2886, 1072.5, 1718.8000488281, 19.799999237061, 0, 0, 180)
setElementData(keypad1up, "cinfo", {"Lift benutzen"})
setElementData(keypad2down, "cinfo", {"Lift benutzen"})
local hebebuhne = createObject ( 16501, 1068.6999511719, 1721, 9.7299995422363, 0, 90, 90)
local keyPadState = 0
local hebebuneMoving = false

setElementDoubleSided(hebebuhne, true)

function keyPad_func(theButton, theState, thePlayer)
	local pX, pY, pZ = getElementPosition(thePlayer)
	if theButton == "left" and theState == "down" then
		if hebebuneMoving == false then
			if isElement(source) and getElementData(thePlayer, "job") == 1 then
				if source == keypad1up or source == keypad2down then
					if getDistanceBetweenPoints3D(1073, 1718.8000488281 , 11.5, pX, pY, pZ ) < 100 or getDistanceBetweenPoints3D(1072.5, 1718.8000488281, 19.799999237061, pX, pY, pZ ) < 100 then
						if keyPadState == 0 then
							moveObject(hebebuhne, 2500, 1068.6999511719, 1721, 9.7299995422363)
							keyPadState = 1
							hebebuneMoving = true
							setTimer(
								function()
									hebebuneMoving = false
								end, 2500, 1)
						elseif keyPadState == 1 then
							moveObject(hebebuhne, 2500, 1068.6999511719, 1721, 17.60000038147)
							keyPadState = 0
							hebebuneMoving = true
							setTimer(
								function()
									hebebuneMoving = false
								end, 2500, 1)
						end
					end
				end
			end
		end
	end
end
addEventHandler("onElementClicked", getRootElement(), keyPad_func)

--TorLV
local keypad3 = createObject(2886, 1064.2001953125, 1724.7998046875,11.5, 0, 0, 180)
local keypad4 = createObject(2886, 1064.5, 1723.099609375, 11.5, 0, 0, 0)
setElementData(keypad3, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(keypad4, "cinfo", {"Tor Öffnen/Schließen"})
local tor = createObject ( 16775, 1068.5, 1723.4000244141, 17, 0, 90, 0)

local keyPadState2 = 0
local hebebuneMoving2 = false


function keyPad_func2(theButton, theState, thePlayer)
	local pX, pY, pZ = getElementPosition(thePlayer)
	if theButton == "left" and theState == "down" then
		if hebebuneMoving2 == false then
			if isElement(source) and getElementData(thePlayer, "job") == 1 then
				if source == keypad3 or source == keypad4 then
					if getDistanceBetweenPoints3D(1065.900390625, 1734, 16.639999389648, pX, pY, pZ ) < 100 or getDistanceBetweenPoints3D(1064.199951171, 1734, 16.639999389648, pX, pY, pZ ) < 100 then
						if keyPadState2 == 0 then
							moveObject(tor, 2500, 1068.5, 1723.4000244141, 17)
							keyPadState2 = 1
							hebebuneMoving2 = true
							setTimer(
								function()
									hebebuneMoving2 = false
								end, 2500, 1)
						elseif keyPadState2 == 1 then
							moveObject(tor, 2500, 1068.5, 1723.4000244141, 2.6)
							keyPadState2 = 0
							hebebuneMoving2 = true
							setTimer(
								function()
									hebebuneMoving2 = false
								end, 2500, 1)
						end
					end
				end
			end
		end
	end
end
addEventHandler("onElementClicked", getRootElement(), keyPad_func2)


--- Hebebühnen-Script für Ares bezüglich TÜV

-- Hebebühne 1 - Lastkraftwagen, ...

--local buehne1 = createObject( 984, 1112.9699707031, 1716.1999511719, 9.8299999237061, 0, 90, 90 )
--local buehne2 = createObject( 984, 1113, 1719.4000244141, 9.8299999237061, 0, 90, 270 )
--local buehne1_key = createObject( 2886, 1108.5, 1715.1999511719, 11, 0, 0, 270 )
--setElementData( buehne1_key, "cinfo", {"Hebebühne hoch/runter"} )

--function ares_buehne1_func ( button, state, player )
--	if getElementData( player, "job" ) ~= 1 then return end
--		if getElementData( buehne1, "moving" ) and getElementData( buehne2, "moving" ) == true then return end
--			setElementData( buehne1, "moving", true )
--			setElementData( buehne2, "moving", true )
--			setTimer( setElementData, 2600, 1, buehne1, "moving", false )   
--			setTimer( setElementData, 2600, 1, buehne2, "moving", false )  
--		if getElementData( buehne1, "state" ) and getElementData( buehne2, "state" ) == "open" then
--			moveObject( buehne1, 2500, 1112.9699707031, 1716.1999511719, 9.8299999237061 )
--			moveObject( buehne2, 2500, 1113, 1719.4000244141, 9.8299999237061 )
--			setElementData( buehne1, "state", "closed" )
--			setElementData( buehne2, "state", "closed" )
--	else
--		moveObject( buehne1, 2500, 1112.9699707031, 1716.1999511719, 12.300000190735 )
--		moveObject( buehne2, 2500, 1113, 1719.4000244141, 12.300000190735 )
--		setElementData( buehne1, "state", "open" )
--		setElementData( buehne2, "state", "open" )
--	end
--end
--addEventHandler( "onElementClicked", buehne1_key, ares_buehne1_func )


-- Hebebühne 2 - Porsonenkraftwagen, ...

--local buehne3 = createObject( 984, 1114.9697265625, 1710.7001953125, 9.8299999237061, 0, 90, 90 )
--local buehne4 = createObject( 984, 1115, 1712.6999511719, 9.8299999237061, 0, 90, 270 )
--local buehne2_key = createObject( 2886, 1110.0999755859, 1709.6999511719, 11, 0, 0, 270 )
--setElementData( buehne2_key, "cinfo", {"Hebebühne hoch/runter"} )

--function ares_buehne2_func ( button, state, player )
--	if getElementData( player, "job" ) ~= 1 then return end
--		if getElementData( buehne3, "moving" ) and getElementData( buehne4, "moving" ) == true then return end
--			setElementData( buehne3, "moving", true )
--			setElementData( buehne4, "moving", true )
--			setTimer( setElementData, 2600, 1, buehne3, "moving", false )   
--			setTimer( setElementData, 2600, 1, buehne4, "moving", false )  
--		if getElementData( buehne3, "state" ) and getElementData( buehne4, "state" ) == "open" then
--			moveObject( buehne3, 2500, 1114.9697265625, 1710.7001953125, 9.8299999237061 )
--			moveObject( buehne4, 2500, 1115, 1712.6999511719, 9.8299999237061 )
--			setElementData( buehne3, "state", "closed" )
--			setElementData( buehne4, "state", "closed" )
--	else
--		moveObject( buehne3, 2500, 1114.9697265625, 1710.7001953125, 12.30000019073 )
--		moveObject( buehne4, 2500, 1115, 1712.6999511719, 12.30000019073 )
--		setElementData( buehne3, "state", "open" )
--		setElementData( buehne4, "state", "open" )
--	end
--end
--addEventHandler( "onElementClicked", buehne2_key, ares_buehne2_func )


-- Hebebühne 3 - Motorräder (Bikes, ...)

--local buehne5 = createObject( 983, 1113.5, 1706.6999511719, 9.8299999237061, 0, 90, 270 )
--local buehne5_key = createObject( 2886, 1110.6999511719, 1705.6999511719, 11, 0, 0, 270 )
--setElementData( buehne5_key, "cinfo", {"Hebebühne hoch/runter"} )

--function ares_buehne3_func ( button, state, player )
--	if getElementData( player, "job" ) ~= 1 then return end
--		if getElementData( buehne5, "moving" ) == true then return end
--			setElementData( buehne5, "moving", true )
--			setTimer( setElementData, 2600, 1, buehne5, "moving", false )   
--		if getElementData( buehne5, "state" ) == "open" then
--			moveObject( buehne5, 2500, 1113.5, 1706.6999511719, 9.8299999237061 )
--			setElementData( buehne5, "state", "closed" )
--	else
--		moveObject( buehne5, 2500, 1113.5, 1706.6999511719, 12.30000019073 )
--		setElementData( buehne5, "state", "open" )
--	end
--end
--addEventHandler( "onElementClicked", buehne5_key, ares_buehne3_func )


--Sflagertor
local tor1 = createObject( 16501, -1918.9000244141, 278.39999389648, 41.099998474121, 0, 0, 90)
local tor_key1 = createObject(2886, -1925.5, 277.60000610352, 42.0, 0, 0, 0)
--local tor_key2 = createObject(2886, -1925.5, 277.60000610352, 42.0, 0, 0, 0)
setElementData( tor_key1, "cinfo", {"Tor öffnen/schließen"} )
setElementData( tor_key2, "cinfo", {"Tor öffnen/schließen"} )

setElementData( tor1, "doubleside", true )

function ares_tor_func ( button, state, player )
	if getElementData( player, "job" ) ~= 1 then return end
	if getElementData( tor1, "moving" ) == true then return end
	setElementData( tor1, "moving", true )
	
    setTimer(function()
        setElementData(tor1, "moving", false)
    end, 2600, 1)
	
	if getElementData( tor1, "state" ) == "open" then
		moveObject( tor1, 2500,  -1918.9000244141, 278.39999389648, 41.099998474121 ) 
		setElementData( tor1, "state", "closed" )
	else
		moveObject( tor1, 2500, -1918.9000244141, 278.39999389648, 37.2 ) 
		setElementData( tor1, "state", "open" )
	end
end
addEventHandler( "onElementClicked", tor_key1, ares_tor_func )
addEventHandler( "onElementClicked", tor_key2, ares_tor_func )