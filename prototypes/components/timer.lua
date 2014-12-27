local prototypes = require 'prototypes'

return object(function(timer)
	local timer = (type(timer)=='function' and timer) or os.clock
	local time0 = timer()

	properties.timeDiff = {
		get = function()
			return timer() - time0
		end,
	}
	properties.time = {
		get = function()
			return time0
		end,
	}

	self.step = function()
		local time1 = timer()
		local diff = time1 - time0
		time0 = time1
		return diff
	end
end)
