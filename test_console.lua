require 'utils'

for i=0, 0xF do
	printC(7, "%2d ", i)
	printC(i, "%s\n", string.rep(string.char(219), 16))
end