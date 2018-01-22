function FuncNew( obj )
	function obj:new( o )
		o = o or {}
	  	setmetatable( o, self )
	  	self.__index = self
	  	return o
	end
	return obj
end

Singleton = {}
function Singleton:Singleton()
	-- Here will be the instance stored.
	local m_instance = nil -- private

	-- Static access method.
	function self:getInstance()
		if not m_instance then
			print("new Singleton")
			m_instance = FuncNew( Singleton ):new()
		else
			print("already exist")
		end
		return m_instance
	end
end
-- Private constructor to prevent instancing.
Singleton:Singleton()
function Singleton:Singleton() end

------------------------------------------------------

-- local s = Singleton:new()
-- s:getInstance() -- lua error
local s = Singleton:getInstance()
print(s)
-- Singleton:Singleton() -- Won't work
local r = Singleton:getInstance()
-- The addresses will be the same.
print(r)
