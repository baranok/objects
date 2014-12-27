local prototypes = require 'prototypes'

return function()
	local entity = prototypes.weapon('Pistol')
	entity.class = 'normal'
	--[[
	entity.damageBase = 23
	entity.damageDice = 2
	entity.damageSide = 6
	entity.damageType = 'normal'
	--]]
	entity.reloadTime = 2100
	entity.jamReloadTime = entity.ReloadTime*0.6
	entity.jamChance = 1/360
	entity.fireRate = 60/500 --500 RPM/rounds per minute
	entity.fireMode = 'semi'
	
	return entity
end
