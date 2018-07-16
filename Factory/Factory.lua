function FuncNew( obj ) -- for Inheritance 
	function obj:new( o )
		o = o or {}
	  	setmetatable( o, self )
	  	self.__index = self
	  	return o
	end
	return obj
end

--
Monster = {}
function Monster:create()
	return FuncNew( Monster ):new()
end
function Monster:appear() -- virtual
	-- do nothing
end

--
Ogre = Monster:create() -- inheritance Monster
Ogre.name = "Ogre"
function Ogre:create()
	return FuncNew( Ogre ):new()
end
function Ogre:appear() -- override
	print( "appearing an " .. Ogre.name )
end

Demon = Monster:create() -- inheritance Monster
Demon.name = "Demon"
function Demon:create()
	return FuncNew( Demon ):new()
end
function Demon:appear() -- override
	print( "appearing a " .. Demon.name )
end

Troll = Monster:create() -- inheritance Monster
Troll.name = "Troll"
function Troll:create()
	return FuncNew( Troll ):new()
end
function Troll:appear() -- override
	print( "appearing a " .. Troll.name )
end

--
MonsterFactory = {}
MonsterFactory.registryTable = {}
function MonsterFactory:create()
	return MonsterFactory
end
function MonsterFactory:instantiate( name )
	for k,v in pairs(self.registryTable) do
		if v.name == name then
			return v:create()
		end
	end
	return nil
end
function MonsterFactory:registry( monster )
	print( "Registering class '" .. monster.name .. "'" )
	table.insert( self.registryTable, monster )
end

--
MonsterFactory:registry( Ogre )
MonsterFactory:registry( Demon )
MonsterFactory:registry( Troll )

------------------------------------------------------
local monsters = {}

table.insert( monsters, MonsterFactory:instantiate( "Ogre" ) )
table.insert( monsters, MonsterFactory:instantiate( "Demon" ) )
table.insert( monsters, MonsterFactory:instantiate( "Troll" ) )

for k,v in pairs(monsters) do
	v:appear()
end