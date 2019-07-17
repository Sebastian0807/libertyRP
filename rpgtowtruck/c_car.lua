ID = 525

function DFFFile ()
	DFF = engineLoadDFF( "towtruck.dff", 0 ) 
	engineReplaceModel ( DFF, ID )

end 
addEventHandler( "onClientResourceStart", resourceRoot, DFFFile )