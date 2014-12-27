local prototypes = require 'prototypes'

return function()
	local entity = prototypes.block('Wooden block', 'wood')
	entity.health = 1500
	entity.maxHealth = 1500

	setResist('explosive', -0.25)
	setResist('fire', -1)

	return entity
end
