local prototypes = require 'prototypes'

local emptyFn = function() end

return function()
	local entity = prototypes.block('Bedrock block', 'stone')
	entity.health = 1000
	entity.maxHealth = 1000
	entity.applyDmg = emptyFn --invulnerability

	return entity
end
