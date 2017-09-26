AttackStrategy = {}
function AttackStrategy:create()
	return AttackStrategy:new( nil )
end
function AttackStrategy:new( o )
	o = o or {}
  	setmetatable( o, self )
  	self.__index = self
  	return o
end
function AttackStrategy:attack() -- virtual
	-- do nothing
end

SwordAttackStrategy = AttackStrategy:new() -- inheritance AttackStrategy
function SwordAttackStrategy:create()
	return SwordAttackStrategy:new( nil )
end
function SwordAttackStrategy:new( o )
	o = o or {}
  	setmetatable( o, self )
  	self.__index = self
  	return o
end
function SwordAttackStrategy:attack() -- override 
	print( "use sword to attack" )
end

ArcheryAttackStrategy = AttackStrategy:new() -- inheritance AttackStrategy
function ArcheryAttackStrategy:create()
	return ArcheryAttackStrategy:new( nil )
end
function ArcheryAttackStrategy:new( o )
	o = o or {}
  	setmetatable( o, self )
  	self.__index = self
  	return o
end
function ArcheryAttackStrategy:attack() -- override
	print( "use bow to attack" )
end

HeroBase = {}
function HeroBase:create( n, s )
	local hero = HeroBase:new({
		m_name = n,
		m_strategy = s or AttackStrategy:create()
	})
	return hero
end
function HeroBase:new( o )
	o = o or {}
	setmetatable( o, self )
	self.__index = self
	return o
end
function HeroBase:attack()
  	print( self.m_name )
  	print( self.m_strategy:attack() )
end

-- local warrior0 = HeroBase:create( "warrior0" )
-- warrior0:attack()

-- warrior
local swordAttackStrategy = SwordAttackStrategy:create()
local warrior1 = HeroBase:create( "warrior1", swordAttackStrategy )
warrior1:attack()

-- archer
local archeryAttackStrategy = ArcheryAttackStrategy:create()
local archer1 = HeroBase:create( "archer1", archeryAttackStrategy )
archer1:attack()

