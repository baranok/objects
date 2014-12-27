local prototypes = require 'prototypes'

return object(function()
	str = 5
	vit = 5
	agi = 5
	dex = 5
	int = 5
	pow = 5
	psi = 5

	interface.set = function(k,v)
		interface[k] = math.clamp(v, -10, 50) -- ?
	end
end)
