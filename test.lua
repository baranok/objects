require 'math2'
require 'utils'

local prototypes = require 'prototypes'
local console = require 'console'
local con = console.prepare()

local function printC(color, fmt, ...)
	con.attr(color or 0x07)
	io.write(fmt:format(...))
end

local o1 = prototypes.base('testovaci objekt')
local o2 = prototypes.living(10, 15)
o2.regeneration = 0.1
o2.add(-8, 2)
o2.add(7, 1, 5)

local t0,t1 = os.time(), os.time()

for i=1, 100 do
    printC(0x1F, '%d', t1-t0)
    printC(0x07, ' %0.2f', o2.health)
    printC(0x0C, ' %s\n', o2.alive)

	o2.step()
	utils.sleep(100)
	t1 = os.time()
end
