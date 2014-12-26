local prototypes = require 'prototypes'

return object(function(current, max)
	local mana = prototypes.variable(current or max or 1, {0, max or 1})
	mana.dt = 0.1

	properties.setup('mana',
		function()
			return mana.current
		end,
		function(v)
			mana.current = v
		end
	)

	properties.setup('maxMana',
		function()
			return mana.maxValue
		end,
		function(v)
			mana.maxValue = v
		end
	)

	properties.setup('regeneration',
		function()
			return mana.dt
		end,
		function(v)
			mana.dt = v
		end
	)

	self.step = function()
		mana.step()
	end
end)
