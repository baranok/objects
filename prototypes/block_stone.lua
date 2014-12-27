local prototypes = require 'prototypes'

local emptyFn = function() end

return function()
	local entity = prototypes.block('Stone block', 'stone')
	entity.health = 10000
	entity.maxHealth = 10000
	--entity.applyDmg = emptyFn --invulnerability
	entity.armor = 10

	local function setResist(name, value)
		entity.resistance[name] = value
	end

	setResist('explosive', -1)

	return entity
end
