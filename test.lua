require 'math2'
require 'utils'

local prototypes = require 'prototypes'

local o2 = prototypes.soldier()
local o3 = prototypes.block_stone()
local o4 = prototypes.block_stone()

o2.applyDmg(8, 2)
o2.heal(7, 1, 5)
o2.applyDmg(12, 1, 6)
print(o2.name, o2.health, o2.attribute.psi)


local t0,t1 = os.time(), os.time()
--[[
for i=1, 100 do
    printC(0x1F, '%d', t1-t0)
    printC(0x09, ' %s ', o2.name)
    printC(0x07, ' %0.2f', o2.health)
    printC(0x0C, ' %s\n', o2.alive)

	o2.step()
	utils.sleep(100)
	t1 = os.time()
end
]]--
o4.resistance.normal = 0.5
print(o3.name, o3.health, o3.resistance.normal)
print(o4.name, o4.health, o4.resistance.normal)
