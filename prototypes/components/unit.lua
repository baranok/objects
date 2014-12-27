local prototypes = require 'prototypes'

return object(function(name)
	self.name = name
	self.resistance = prototypes.resistance()

	local living = prototypes.living(10, 10)
	living.regeneration = 0.1

	properties.setup('health',
		function()
			return living.health
		end,
		function(v)
			living.health = v
		end
	)

	properties.setup('maxHealth',
		function()
			return living.maxHealth
		end,
		function(v)
			living.maxHealth = v
		end
	)

	properties.setup('alive',
		function()
			return living.alive
		end
	)

	properties.setup('regeneration',
		function()
			return living.regeneration
		end,
		function(v)
			living.regeneration = v
		end
	)

	self.heal = function(amount, time, offset)
		living.add(amount, time, offset or 0)
	end

	self.applyDmg = function(amount, time, offset)
		living.add(-amount, time, offset or 0)
	end

	self.step = function()
		living.step()
	end

end)
