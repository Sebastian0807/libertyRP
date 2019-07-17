ID = 550

function TXDFile ()
	TXD = engineLoadTXD( "sunrise.txd" ) 
	engineImportTXD( TXD, ID )
end 
addEventHandler( "onClientResourceStart", resourceRoot, TXDFile )

function TXDFile ()
	TXD = engineLoadTXD( "sunrise3.txd" ) 
	engineImportTXD( TXD, ID )
end 
addEventHandler( "onClientResourceStart", resourceRoot, TXDFile )

function DFFFile ()
	DFF = engineLoadDFF( "sunrise.dff" ) 
	engineReplaceModel ( DFF, ID )

end 
addEventHandler( "onClientResourceStart", resourceRoot, DFFFile )