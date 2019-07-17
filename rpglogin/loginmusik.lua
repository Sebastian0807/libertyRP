function loginMusic () 
    sound = playSound("music.mp3", false) 
    setSoundVolume(sound, 3.2) 
end 
addEventHandler ( "onClientResourceStart", resourceRoot, loginMusic) 
  
function stopMySound ( ) 
    if isElement ( sound ) then 
        destroyElement ( sound ) 
    end 
end 
addEventHandler ( "onClientPlayerSpawn", localPlayer, stopMySound ) 
