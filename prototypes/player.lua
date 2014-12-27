local prototypes = require 'prototypes'

return function()
	local unit = prototypes.unit('Player')
	unit.race = 'human'
	unit.health = 1000
	unit.maxHealth = 1000
	unit.mana = 100
	unit.maxMana = 600
	unit.manaRegeneration = 5
	unit.psi = 200
	unit.maxPsi = 200

	unit.armor = 8
	unit.shield = 10
	unit.shieldBlockChance = 0.2
	unit.shieldMana = 5
	unit.shieldManaRatio = 1
	unit.evasion = 0.06
	unit.miss = 0.03

	return unit
end
