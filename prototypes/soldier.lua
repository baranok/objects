local prototypes = require 'prototypes'

return function()
	local unit = prototypes.unit('Soldier')
	unit.race = 'human'
	unit.health = 1000
	unit.maxHealth = 1000
	unit.armor = 5
	return unit
end
