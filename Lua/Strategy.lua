function FuncNew( obj ) -- for Inheritance 
	function obj:new( o )
		o = o or {}
	  	setmetatable( o, self )
	  	self.__index = self
	  	return o
	end
	return obj
end

AttackStrategy = {}
function AttackStrategy:create()
	return FuncNew( AttackStrategy ):new()
end
function AttackStrategy:attack() -- virtual
	-- do nothing
end

SwordAttackStrategy = AttackStrategy:create() -- inheritance AttackStrategy
function SwordAttackStrategy:create()
	return FuncNew( SwordAttackStrategy ):new()
end
function SwordAttackStrategy:attack() -- override
	print( "use sword to attack" )
end

ArcheryAttackStrategy = AttackStrategy:create() -- inheritance AttackStrategy
function ArcheryAttackStrategy:create()
	return FuncNew( ArcheryAttackStrategy ):new()
end
function ArcheryAttackStrategy:attack() -- override
	print( "use bow to attack" )
end

HeroBase = {}
function HeroBase:create( n, s )
	return FuncNew( HeroBase ):new({
		m_name = n,
		m_strategy = s or AttackStrategy:create()
	})
end
function HeroBase:attack()
  	print( self.m_name )
  	print( self.m_strategy:attack() )
end

------------------------------------------------------

-- local warrior0 = HeroBase:create( "warrior0" )
-- warrior
local swordAttackStrategy = SwordAttackStrategy:create()
local warrior1 = HeroBase:create( "warrior1", swordAttackStrategy )
-- archer
local archeryAttackStrategy = ArcheryAttackStrategy:create()
local archer1 = HeroBase:create( "archer1", archeryAttackStrategy )

-- warrior0:attack()
warrior1:attack()
archer1:attack()