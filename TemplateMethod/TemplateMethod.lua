function FuncNew( obj ) -- for Inheritance 
	function obj:new( o )
		o = o or {}
	  	setmetatable( o, self )
	  	self.__index = self
	  	return o
	end
	return obj
end

HeroBase = {}
function HeroBase:create()
	return FuncNew( HeroBase ):new()
end
function HeroBase:_getHeroName() -- placeholders (virtual)
	-- do nothing
end
function HeroBase:_getHeroHP() -- placeholders (virtual)
	-- do nothing
end
function HeroBase:_getNumberOfSkills()
	print("8")
end
function HeroBase:showHeroInfo() -- template method
	print("Name:")
    self:_getHeroName()
    print("HP: ")
    self:_getHeroHP()
	print("Number of skills: ")
    self:_getNumberOfSkills()
end

Warrior = HeroBase:create()  -- inheritance
function Warrior:create()
	return FuncNew( Warrior ):new()
end
function Warrior:_getHeroName() -- implement placeholder methods
	print("Olberic")
end
function Warrior:_getHeroHP()
	print("8000")
end

Cleric = HeroBase:create()  -- inheritance
function Cleric:create()
	return FuncNew( Cleric ):new()
end
function Cleric:_getHeroName() -- implement placeholder methods
	print("Ophilia")
end
function Cleric:_getHeroHP()
	print("4000")
end

------------------------------------------------------

local warrior = Warrior:create()
warrior:showHeroInfo()

print("")

local cleric = Cleric:create()
cleric:showHeroInfo()