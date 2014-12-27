local prototypes = require 'prototypes'

local emptyFn = function() end

return function()
	local entity = prototypes.block('Stone', 'Stone')
	entity.health = 100
	entity.maxHealth = 100
	entity.applyDmg = emptyFn

	local function setResist(name, value)
		entity.resistance[name] = value
	end

	setResist('normal', 11)

	return entity
end
