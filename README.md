Object prototype system
=======================

Prototype definition:
---------------------

```lua
local prototypes = require 'prototypes'

return object(function(name)
	self.name = name
end)
```

Prototype usage:
---------------------

```lua
local prototypes = require 'prototypes'

local o1 = prototypes.base('object name')
```
