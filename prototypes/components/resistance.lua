local prototypes = require 'prototypes'

return object(function()
	normal = 0
	hollow = 0 --experimental, armor is doubled if attacked with this; but resist should be same as normal, maybe make it like damage modifier
	spell = 0
	fire = 0
	explosive = 0
	energy = 0

	acid = 0
	mental = 0
	disease = 0
	rad = 0
	gas = 0

	interface.set = function(k,v)
		interface[k] = math.clamp(v, -1, 1)
	end
end)
