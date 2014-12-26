function object(fn)
	local __ENV = getfenv()
	return function(...)
		local _ENV = {}
		for k,v in pairs(__ENV) do
			_ENV[k] = v
		end

		local interface = {}
		local obj = {}

		setmetatable(_ENV, {
			__index = function(t, k)
				if k=='self'then
					return obj
				else
					return interface[k]
				end
			end,
			__newindex = function(t, k, v)
				if k=='self'then
					obj = v
				else
					interface[k] = v
				end
			end,
		})
		setfenv(fn, _ENV)

		fn(...)
		setmetatable(obj, {
			__index = function(t, k)
				if k=="interface" then
					return interface
				else
					return interface[k]
				end
			end,
			__newindex = function(t, k, v)
				interface[k] = v
			end,
		})
		return obj
	end
end

local cachedPrototypes = {}

local function prototype(name)
	assert(type(name)=='string')
	local p = cachedPrototypes[name]
	if not f then
		local f = loadfile(('./prototypes/%s.lua'):format(name))
		assert(type(f)=='function')
		p = f()
		cachedPrototypes[name]=p
	end
	assert(type(p)=='function')
	return p
end

local M = {
}

setmetatable(M, {
	__index = function(t, k)
		return prototype(k)
	end,
})
return M

