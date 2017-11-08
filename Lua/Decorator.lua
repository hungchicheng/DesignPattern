function FuncNew( obj ) -- for Inheritance 
	function obj:new( o )
		o = o or {}
	  	setmetatable( o, self )
	  	self.__index = self
	  	return o
	end
	return obj
end

Hero = {}
function Hero:create( name )
	return FuncNew( Hero ):new({ m_name = name })
end
function Hero:show()
	print( self.m_name .. " with " )
end

Helmet = {}
function Helmet:create( child )
	return FuncNew( Helmet ):new({ m_child = child })
end
function Helmet:show()
	self.m_child:show()
	print( "Helmet, " )
end

Armour = {}
function Armour:create( child )
	return FuncNew( Armour ):new({ m_child = child })
end
function Armour:show()
	self.m_child:show()
	print( "Armour, " )
end

Boots = {}
function Boots:create( child )
	return FuncNew( Boots ):new({ m_child = child })
end
function Boots:show()
	self.m_child:show()
	print( "Boots, " )
end

------------------------------------------------------

local hero1H = Helmet:create(Hero:create("Hero1"))
local hero2HA = Armour:create(Helmet:create(Hero:create("Hero2")))
local hero3HAB = Boots:create(Armour:create(Helmet:create(Hero:create("Hero3"))))
local hero4BH = Helmet:create(Boots:create(Hero:create("Hero4")))

hero1H:show()
hero2HA:show()
hero3HAB:show()
hero4BH:show()
print("\nLua automatically deletes objects that become garbage\n")
