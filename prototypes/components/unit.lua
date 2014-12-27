local prototypes = require 'prototypes'

return object(function(name)
	self.name = name
	self.race = ''
	self.shieldBlocking = false

	local entity = prototypes.entity()
	local experience = prototypes.experience()

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

	properties.setup('regeneration',
		function()
			return entity.regeneration
		end,
		function(v)
			entity.regeneration = v
		end
	)

	properties.setup('xp',
		function()
			return experience.xp
		end,
		function(v)
			experience.xp = v
		end
	)

	properties.setup('level',
		function()
			return experience.level
		end,
		function(v)
			experience.level = v
		end
	)

	self.addXp = experience.add

	self.resistance = entity.resistance
	self.heal = entity.heal
	self.applyDmg = entity.applyDmg

	self.step = function()
		entity.step()
		experience.step()
	end
end)
