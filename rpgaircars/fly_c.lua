isFlying = false

Cars = {}

--## CAR IDs ##--

Cars[502] = true



bindKey("lshift","down",
function()
	if (isPedInVehicle(localPlayer) and Cars[getElementModel(getPedOccupiedVehicle(localPlayer))]) then
		if isWorldSpecialPropertyEnabled("aircars") then
			setWorldSpecialPropertyEnabled ( "aircars", false )
			outputChatBox("Aircars deaktiviert!.",255,45,45)
			if isFlying then
				removeEventHandler("onClientRender", root, checkFlight)
			end
			isFlying = false
		else
			setWorldSpecialPropertyEnabled ( "aircars", true )
			outputChatBox("Aircars aktiviert!",0,174,0)
			if not isFlying then
				addEventHandler("onClientRender", root, checkFlight)
			end
			isFlying = true
		end
	end
end)
	
function checkFlight()
	if (not isPedInVehicle(localPlayer)) or (not Cars[getElementModel(getPedOccupiedVehicle(localPlayer))]) or isPlayerDead(localPlayer) then
		setWorldSpecialPropertyEnabled ( "aircars", false )
		if isFlying then
			removeEventHandler("onClientRender", root, checkFlight)
		end
		isFlying = false
		outputChatBox("Flying Car disabled.",255,45,45)
	end
end