local prototypes = require 'prototypes'

return object(function(name,material)
	self.name = name
	self.material = material

	local entity = prototypes.entity()
	entity.regeneration = 0

	properties.setup('health',
		function()
			return entity.health
		end,
		function(v)
			entity.health = v
		end
	)

	properties.setup('maxHealth',
		function()
			return entity.maxHealth
		end,
		function(v)
			entity.maxHealth = v
		end
	)

	properties.setup('alive',
		function()
			return entity.alive
		end
	)

	properties.setup('name',
		function()
			return entity.name
		end,
		function(v)
			entity.name = v
		end
	)

	self.resistance = entity.resistance
	self.heal = entity.heal
	self.applyDmg = entity.applyDmg
	self.step = entity.step
end)
