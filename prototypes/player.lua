local prototypes = require 'prototypes'

return function()
	local unit = prototypes.unit('Player')
	unit.health = 1000
	unit.maxHealth = 1000
	return unit
end
