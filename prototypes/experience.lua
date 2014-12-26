local prototypes = require 'prototypes'

return object(function(xpTable)
	local xp = prototypes.variable(0, {0, math.huge})

	properties.setup('xp',
		function()
			return xp.current
		end,
		function(v)
			xp.current = v
		end
	)

	properties.setup('maxPsi',
		function()
			return psi.maxValue
		end,
		function(v)
			psi.maxValue = v
		end
	)

	properties.setup('regeneration',
		function()
			return psi.dt
		end,
		function(v)
			psi.dt = v
		end
	)

	self.step = function()
		psi.step()
	end
end)
