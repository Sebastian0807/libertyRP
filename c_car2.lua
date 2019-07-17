 ID = 470

 function DFFFile ()
	DFF = engineLoadDFF( "patriot.dff", 0 ) 
	engineReplaceModel ( DFF, ID )

 end 
 addEventHandler( "onClientResourceStart", resourceRoot, DFFFile )