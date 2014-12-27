local prototypes = require 'prototypes'

return object(function(health, maxHealth)
	local health = prototypes.variable(health or maxHealth or 1, {0, maxHealth or health or 1})
	health.dt = 0
	local dead = false

	health.minFn = function(v)
		health.dt = 0
		dead = true
		return v, true
	end

	properties.setup('alive', function()
		return (not dead) and health.current > 0
	end)

	properties.setup('health',
		function()
			return health.current
		end,
		function(v)
			health.current = v
		end
	)

	properties.setup('minHealth',
		function()
			return health.minValue
		end,
		function(v)
			health.minValue = v
		end
	)

	properties.setup('maxHealth',
		function()
			return health.maxValue
		end,
		function(v)
			health.maxValue = v
		end
	)

	properties.setup('regeneration',
		function()
			return health.dt
		end,
		function(v)
			health.dt = v
		end
	)

	self.add = function(amount, time, offset)
		if time then
			health.mod(amount, time, offset)
		else
			health.add(amount)
		end
	end

	self.step = function()
		health.step()
	end
end)
