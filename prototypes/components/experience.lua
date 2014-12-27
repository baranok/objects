local prototypes = require 'prototypes'

return object(function(xpTable)
	local xp = prototypes.variable(0, {0, math.huge})
	local level = 0

	properties.setup('xp',
		function()
			return xp.current
		end,
		function(v)
			xp.current = v
		end
	)

	properties.setup('level',
		function()
			return level
		end,
		function(v)
			level = v
		end
	)

	self.add = function(amount, time)
		xp.add(amount, time or 1)
	end

	self.step = function()
		xp.step()
	end
end)
