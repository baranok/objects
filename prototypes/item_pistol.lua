local prototypes = require 'prototypes'

return function()
	local entity = prototypes.item('Pistol')
	entity.class = 'weapon'
	entity.slot = 'righthand'
	entity.cost = 300

	return entity
end
