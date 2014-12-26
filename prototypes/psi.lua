local prototypes = require 'prototypes'

return object(function(current, max)
	local psi = prototypes.variable(current or max or 1, {0, max or 1})
	psi.dt = 0.1

	properties.setup('psi',
		function()
			return psi.current
		end,
		function(v)
			psi.current = v
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
