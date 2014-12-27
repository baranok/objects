local prototypes = require 'prototypes'

return object(function(name)
	self.name = name
	self.race = ''
	
	self.armor = 0
	self.shield = 0
	self.shieldBlockChance = 0
	self.shieldMana = 0
	self.shieldManaRatio = 1
	self.shieldBlocking = false
	self.evasion = 0
	self.miss = 0.05
	self.painThreshold = 12
	self.painChance = 0.3

	local entity = prototypes.entity()
	local experience = prototypes.experience()

	local mana = prototypes.mana()
	local psi = prototypes.psi()

	properties.setup('health',
		function()
			return entity.health
		end,
		function(v)
			entity.health = v
		end
	)

	properties.setup('maxHealth',
		function()
			return entity.maxHealth
		end,
		function(v)
			entity.maxHealth = v
		end
	)

	properties.setup('alive',
		function()
			return entity.alive
		end
	)

	properties.setup('regeneration',
		function()
			return entity.regeneration
		end,
		function(v)
			entity.regeneration = v
		end
	)

	properties.setup('xp',
		function()
			return experience.xp
		end,
		function(v)
			experience.xp = v
		end
	)

	properties.setup('level',
		function()
			return experience.level
		end,
		function(v)
			experience.level = v
		end
	)

	properties.setup('mana',
		function()
			return mana.mana
		end,
		function(v)
			mana.mana = v
		end
	)

	properties.setup('maxMana',
		function()
			return mana.maxMana
		end,
		function(v)
			mana.maxMana = v
		end
	)

	properties.setup('manaRegeneration',
		function()
			return mana.regeneration
		end,
		function(v)
			mana.regeneration = v
		end
	)

	properties.setup('psi',
		function()
			return psi.psi
		end,
		function(v)
			psi.psi = v
		end
	)

	properties.setup('maxPsi',
		function()
			return psi.maxPsi
		end,
		function(v)
			psi.maxPsi = v
		end
	)

	properties.setup('psiRegeneration',
		function()
			return psi.regeneration
		end,
		function(v)
			psi.regeneration = v
		end
	)

	self.addXp = experience.add

	self.attribute = prototypes.attribute()
	self.resistance = entity.resistance
	self.heal = entity.heal
	self.applyDmg = entity.applyDmg

	self.step = function()
		entity.step()
		experience.step()
	end
end)
