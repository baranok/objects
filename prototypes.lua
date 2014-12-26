function object(fn)
	local __ENV = getfenv()
	return function(...)
		local _ENV = {}
		for k,v in pairs(__ENV) do
			_ENV[k] = v
		end

		local interface = {}
		local obj = {}

		local properties = {}
		properties.setup = function(name, get, set)
			properties[name] = {
				get = get,
				set = set,
			}
		end
		_ENV.properties = properties

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
					local property = properties[k]
					if type(property)=='table' and type(property.get)=='function' then
						return property.get()
					else
						return interface[k]
	            	end
				end
			end,
			__newindex = function(t, k, v)
				local property = properties[k]
				if type(property)=='table' and type(property.set)=='function' then
					property.set(v)
				else
					interface[k] = v
	        	end
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
		local f, msg = loadfile(('./prototypes/%s.lua'):format(name))
		if not f then
			error(msg)
		end
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

