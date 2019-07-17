-- The Body. Author: xMode
local shader = dxCreateShader( "fx/nodirt-shader.fx" )
addEventHandler( "onClientResourceStart", resourceRoot, function()
    engineApplyShaderToWorldTexture( shader, "vehiclegrunge*" )
end)
-- End