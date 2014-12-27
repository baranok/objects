local prototypes = require 'prototypes'

return object(function(name,material)
	self.material = material

	local unit = prototypes.unit(name)
	unit.regeneration = 0

	properties.setup('health',
		function()
			return unit.health
		end,
		function(v)
			unit.health = v
		end
	)

	properties.setup('maxHealth',
		function()
			return unit.maxHealth
		end,
		function(v)
			unit.maxHealth = v
		end
	)

	properties.setup('alive',
		function()
			return unit.alive
		end
	)

	properties.setup('name',
		function()
			return unit.name
		end,
		function(v)
			unit.name = v
		end
	)

	self.resistance = unit.resistance

	self.heal = unit.heal
	self.applyDmg = unit.applyDmg
	self.step = unit.step
end)
