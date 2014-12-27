local prototypes = require 'prototypes'

return function()
	local entity = prototypes.block('Metal block', 'metal')
	entity.health = 5000
	entity.maxHealth = 5000
	entity.armor = 6

	setResist('explosive', -0.25)
	setResist('acid', -1)

	return entity
end
