isScoreboardShown = false
local scoreboardAlpha = 0
local screenWidth, screenHeight = guiGetScreenSize()
local scoreboardFont = dxCreateFont( "LifestyleRounded.ttf", 20 ) 

local sc_allPlayers = 0
isScoreboardShown = false
local scoreboardAlpha = 0
local screenWidth, screenHeight = guiGetScreenSize()
local scoreboardFont = dxCreateFont( "LifestyleRounded.ttf", 20 ) 

local sc_allPlayers = 0
local startAnim = 10

fpsc = 0
function InitClient()
	fps1 = getTickCount() + 2000
	fpsc = 0
	removeEventHandler ( "onClientRender", getRootElement(), fpsread )
	addEventHandler ( "onClientRender", getRootElement(), fpsread )
end
addEventHandler("onClientResourceStart", getRootElement(), InitClient )

function fpsread()
	if fps1 > getTickCount() then
		fpsc = fpsc + 1
	else if fps1 < getTickCount() then
			fpsc = fpsc / 2
			fpsc = math.ceil ( fpsc )
			player = getLocalPlayer ()
			local data = setElementData(localPlayer, "FPS", fpsc)
			fps1 = getTickCount() + 2000
			fpsc = 0
		end
	end	
end

function renderScoreboard()
	if isScoreboardShown == false then
		if scoreboardAlpha > 0 then
			scoreboardAlpha = scoreboardAlpha-40
		end
		if startAnim + 2 <= 10 then
			startAnim = startAnim + 2
		end		
	else
		if scoreboardAlpha < 200 then
			scoreboardAlpha = scoreboardAlpha+40
			if startAnim - 2 >= 0 then
				startAnim = startAnim - 2
			end
		end	
	end
	
	if scoreboardAlpha ~= 0 then
		local scoreboardY = screenHeight/2-(480-(32-sc_allPlayers)*12)/2
		dxDrawRectangle ( screenWidth/2-640/2, scoreboardY+startAnim, 640, 480-(32-sc_allPlayers)*12, tocolor(0,0,0,scoreboardAlpha), false )
		local realScoreboardAlpha = scoreboardAlpha/200*255 
		if realScoreboardAlpha  then
			--dxDrawImage(screenWidth/2-350,screenHeight/2-(600-(32-sc_allPlayers)*12)/2,200,200, "img/title.png",0,0,0,white,false)
			dxDrawImage ( screenWidth/2-640/2+2, screenHeight/2-(600-(32-sc_allPlayers)*12)/2+60+startAnim,2550*0.25,188*0.25, "vi.png",0,0,0,tocolor(255,255,255, realScoreboardAlpha))
			--dxDrawText ( "PHOENIX-CITY - FORUM.PHOENIX-CITY.DE" , screenWidth/2-640/2+100, screenHeight/2-(600-(32-sc_allPlayers)*12)/2+60+startAnim, screenWidth, screenHeight, tocolor ( 247,136,0, realScoreboardAlpha ), 0.8, scoreboardFont )
			dxDrawLine( screenWidth/2-640/2, scoreboardY+50+startAnim, screenWidth/2+640/2, scoreboardY+50+startAnim, tocolor(255,0,0,realScoreboardAlpha), 2, false)
			
			dxDrawText ( "Admin | Name:", screenWidth/2-640/2+3, scoreboardY+53+startAnim, screenWidth, screenHeight, tocolor(82,139,139, realScoreboardAlpha), 1, "sans" )
			dxDrawText ( "Unternehmen:", screenWidth/2-640/2+210, scoreboardY+53+startAnim, screenWidth, screenHeight, tocolor(82,139,139, realScoreboardAlpha), 1, "sans" )
			dxDrawText ( "Gang:", screenWidth/2-640/2+345, scoreboardY+53+startAnim, screenWidth, screenHeight, tocolor(82,139,139, realScoreboardAlpha), 1, "sans" )
			dxDrawText ( "Level:", screenWidth/2-640/2+435, scoreboardY+53+startAnim, screenWidth, screenHeight, tocolor(82,139,139, realScoreboardAlpha), 1, "sans" )
			dxDrawText ( "Status:", screenWidth/2-640/2+485, scoreboardY+53+startAnim, screenWidth, screenHeight, tocolor(82,139,139, realScoreboardAlpha), 1, "sans" )
			dxDrawText ( "FPS:", screenWidth/2-640/2+555, scoreboardY+53+startAnim, screenWidth, screenHeight, tocolor(82,139,139, realScoreboardAlpha), 1, "sans" )
			dxDrawText ( "Ping:", screenWidth/2-640/2+605, scoreboardY+53+startAnim, screenWidth, screenHeight, tocolor(82,139,139, realScoreboardAlpha), 1, "sans" )
			
			sc_allPlayers = 0
			
			local thePlayers = getElementsByType("player")
			local comp = function(w1,w2)
				if getElementData(w1, "getPlayerSpecialRights") > getElementData(w2, "getPlayerSpecialRights") then
					return true
				end
			end
    
			table.sort(thePlayers,comp)
    
			--Normale Spieler
			for id, player in ipairs(thePlayers) do
				if isFloat(sc_allPlayers/2) == false then
					dxDrawRectangle ( screenWidth/2-640/2, scoreboardY+72+12*sc_allPlayers+startAnim, 640, 12, tocolor(122,122,122,15), false )
				end
				if getElementData(player, "getPlayerSpecialRights") == 4 then
					dxDrawText ( "#f9e04c-Gründer- #bdbdbd"..getPlayerName(player), screenWidth/2-640/2+3, scoreboardY+72+12*sc_allPlayers+startAnim, screenWidth, screenHeight, tocolor(255, 255, 255, realScoreboardAlpha), 0.9, "sans", "left", "top", false, false, false,true )				
				elseif getElementData(player, "getPlayerSpecialRights") == 3 then
			    	dxDrawText ( "#828482[#E01401Projektleitung#828482] #bdbdbd	"..getPlayerName(player), screenWidth/2-640/2+3, scoreboardY+72+12*sc_allPlayers+startAnim, screenWidth, screenHeight, tocolor(255, 255, 255, realScoreboardAlpha), 0.9, "sans", "left", "top", false, false, false,true )
				elseif getElementData(player, "getPlayerSpecialRights") == 2 then
					dxDrawText ( "#828482[#0000FFAdministrator#828482] #bdbdbd"..getPlayerName(player), screenWidth/2-640/2+3, scoreboardY+72+12*sc_allPlayers+startAnim, screenWidth, screenHeight, tocolor(255, 255, 255, realScoreboardAlpha), 0.9, "sans", "left", "top", false, false, false,true )
				elseif getElementData(player, "getPlayerSpecialRights") == 1 then
				    dxDrawText ( "#828482[#0FC803Moderator#828482] #bdbdbd"..getPlayerName(player), screenWidth/2-640/2+3, scoreboardY+72+12*sc_allPlayers+startAnim, screenWidth, screenHeight, tocolor(255, 255, 255, realScoreboardAlpha), 0.9, "sans", "left", "top", false, false, false,true )
				elseif getElementData(player, "getPlayerSpecialRights") == 0.5 then
					dxDrawText ( "#828482[#FFFF00Supporter#828482] #bdbdbd"..getPlayerName(player), screenWidth/2-640/2+3, scoreboardY+72+12*sc_allPlayers+startAnim, screenWidth, screenHeight, tocolor(255, 255, 255, realScoreboardAlpha), 0.9, "sans", "left", "top", false, false, false,true )	
				else
					dxDrawText ( getPlayerName(player), screenWidth/2-640/2+3, scoreboardY+72+12*sc_allPlayers+startAnim, screenWidth, screenHeight, tocolor(189, 189, 189, realScoreboardAlpha), 0.9, "sans", "left", "top", false, false, false,true )
				end
				
				if getElementData(player, "playerRegisterStatus") == "2" or getElementData(player, "playerRegisterStatus") == "1" then -- Check if logged in
					local job = getElementData(player, "job")
					local jobstring = "#CEE3F6Arbeitslos"
					
					if job == 1 then
						jobstring = "#AC0777Ares Automobiles"
					elseif job == 2 then
						jobstring = "#2EB014InterTrans"
					elseif job == 3 then
						jobstring = "#0040ffPolizei"
					elseif job == 4 then
						jobstring = "#FF9C00AutoFix" --#BDBDBD
					elseif job == 5 then
						jobstring = "#FA5858AutoHus"
					elseif job == 6 then
						jobstring = "#0000FFStaatsverwaltung"
					elseif job == 7 then
						jobstring = "#ff0000Rettungsdienst"
					elseif job == 8 then
						jobstring = "#F7FF00Yellow Cab"
					elseif job == 9 then
						jobstring = "#FFA500Liberty-News"
					elseif job == 10 then						
						jobstring = "#ffffffFahrschule"
					elseif job == 11 then						
						jobstring = "#99CCFFcar4you"					
					end
					
					
					dxDrawText ( jobstring, screenWidth/2-640/2+210, scoreboardY+72+12*sc_allPlayers+startAnim, screenWidth, screenHeight, tocolor(255, 255, 255, realScoreboardAlpha), 0.9, "sans", "left", "top", false, false, false,true )
					
					local gang = getElementData(player, "gang")
					local gangstring = "#CEE3F6Keine"
					if gang == 1 then
						gangstring = "#127115Grove Street"
					elseif gang == 2 then
						gangstring = "#FF5900Tokyo Drift"
					elseif gang == 3 then
						gangstring = "#0f70bfLakeside Crew"
					end
					
					dxDrawText ( gangstring, screenWidth/2-640/2+345, scoreboardY+72+12*sc_allPlayers+startAnim, screenWidth, screenHeight, tocolor(255, 255, 255, realScoreboardAlpha), 0.9, "sans", "left", "top", false, false, false,true )						
					
					if getElementData(player, "level") then
						dxDrawText ( getElementData(player, "level"), screenWidth/2-640/2+440, scoreboardY+72+12*sc_allPlayers+startAnim, screenWidth, screenHeight, tocolor(206,227,246, realScoreboardAlpha), 0.9, "sans" )
					else
						dxDrawText ( "-", screenWidth/2-640/2+435, scoreboardY+72+12*sc_allPlayers+startAnim, screenWidth, screenHeight, tocolor(255, 255, 255, realScoreboardAlpha), 0.9, "sans" )
					end
					
					if getElementData(player, "einsperrzeit") >= 1 then
						dxDrawText ( "Im Knast", screenWidth/2-640/2+485, scoreboardY+72+12*sc_allPlayers+startAnim, screenWidth, screenHeight, tocolor(230,33,53, realScoreboardAlpha), 0.9, "sans" )
					else
					if getElementData(player, "afk") == true then
						dxDrawText ( "AFK", screenWidth/2-640/2+485, scoreboardY+72+12*sc_allPlayers+startAnim, screenWidth, screenHeight, tocolor(75,226,136, realScoreboardAlpha), 0.9, "sans" )
					else
						if getElementData(player, "dienst") == 1 then
							dxDrawText ( "Im Dienst", screenWidth/2-640/2+485, scoreboardY+72+12*sc_allPlayers+startAnim, screenWidth, screenHeight, tocolor(228,220,15, realScoreboardAlpha), 0.9, "sans" )
						else
							dxDrawText ( "Ingame", screenWidth/2-640/2+485, scoreboardY+72+12*sc_allPlayers+startAnim, screenWidth, screenHeight, tocolor(11,250,195, realScoreboardAlpha), 0.9, "sans" )
						end
					end
				end	
				else
					dxDrawText ( "-", screenWidth/2-640/2+210, scoreboardY+72+12*sc_allPlayers+startAnim, screenWidth, screenHeight, tocolor(255, 255, 255, realScoreboardAlpha), 0.9, "sans" )
					dxDrawText ( "-", screenWidth/2-640/2+345, scoreboardY+72+12*sc_allPlayers+startAnim, screenWidth, screenHeight, tocolor(255, 255, 255, realScoreboardAlpha), 0.9, "sans" )	
					dxDrawText ( "-", screenWidth/2-640/2+440, scoreboardY+72+12*sc_allPlayers+startAnim, screenWidth, screenHeight, tocolor(255, 255, 255, realScoreboardAlpha), 0.9, "sans" )
					dxDrawText ( "Gast", screenWidth/2-640/2+485, scoreboardY+72+12*sc_allPlayers+startAnim, screenWidth, screenHeight, tocolor(255, 255, 255, realScoreboardAlpha), 0.9, "sans" )					
				end
				if getElementData(player, "FPS") then
					dxDrawText ( tostring(getElementData(player, "FPS")), screenWidth/2-640/2+560, scoreboardY+72+12*sc_allPlayers+startAnim, screenWidth, screenHeight, tocolor(206,227,246, realScoreboardAlpha), 0.9, "sans" )
				else
					dxDrawText ( "-", screenWidth/2-640/2+550, scoreboardY+72+12*sc_allPlayers+startAnim, screenWidth, screenHeight, tocolor(255, 255, 255, realScoreboardAlpha), 0.9, "sans" )
				end
				dxDrawText ( tostring(getPlayerPing(player)), screenWidth/2-640/2+610, scoreboardY+72+12*sc_allPlayers+startAnim, screenWidth, screenHeight, tocolor(206,227,246, realScoreboardAlpha), 0.9, "sans" )
				sc_allPlayers = sc_allPlayers + 1
			end
			dxDrawLine( screenWidth/2-640/2, scoreboardY+72+12*sc_allPlayers+5+startAnim, screenWidth/2+640/2, scoreboardY+72+12*sc_allPlayers+5+startAnim, tocolor(255,0,0,realScoreboardAlpha), 2, false)
			
			dxDrawText ( "© Liberty-Village 2018-2018", screenWidth/2-640/2, scoreboardY+72+12*sc_allPlayers+5+startAnim, screenWidth/2+640/2, scoreboardY+72+12*sc_allPlayers+5+startAnim, tocolor ( 255, 255, 255, realScoreboardAlpha ), 0.9, "sans-bold", "center", "top" )
			
			dxDrawText ( "Spieler: "..tostring(sc_allPlayers), screenWidth/2-640/2, scoreboardY+72+12*sc_allPlayers+5+startAnim, screenWidth/2+640/5, screenHeight, tocolor ( 255, 255, 255, realScoreboardAlpha ), 0.9, "clear" )
			
		end
	end
end
addEventHandler ( "onClientRender", getRootElement(), renderScoreboard, true, "low" )
 
function toggleScoreboard(key, keyState)
	if keyState == "down" and getElementData(getLocalPlayer(), "isPlayerLoggedIn") == true then
		isScoreboardShown = true
	elseif keyState == "up" then
		isScoreboardShown = false
	end
end
bindKey ( "TAB", "both", toggleScoreboard)

 function isFloat(number)
	return (math.floor(number) ~= number);
end
-------