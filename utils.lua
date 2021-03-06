utils = utils or {}
local ffi = require 'ffi'

ffi.cdef[[
void Sleep(uint32_t dwMilliseconds);
]]

utils.sleep = function(ms)
	ffi.C.Sleep(ms)
end

utils.bag = function()
	local o = {}
	local t = {}
	
	local currentIndex = 0

	local toBeRemoved = {}
	o.insert = function(v)
		t[currentIndex] = v
		currentIndex = currentIndex + 1
	end
	o.iter = function()
		local index, value
		return function()
			index, value = next(t,index)
			return index, value
		end
	end
	o.remove = function(i)
		table.insert(toBeRemoved, i)
	end

	o.clear = function()
		t = {}
		toBeRemoved = {}
	end

	o.process = function()
		for _, index in ipairs(toBeRemoved) do
			t[index] = nil
		end
		toBeRemoved = {}
	end
	return o
end

local console = require 'console'
local con

function printC(color, fmt, ...)
	if not con then
		con = console.prepare()
	end

	con.attr(color or 0x07)
	if #({...})>0 then
		io.write(fmt:format(...))
	else
		io.write(fmt)
	end
end
