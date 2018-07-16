function FuncNew( obj ) -- for Inheritance 
	function obj:new( o )
		o = o or {}
	  	setmetatable( o, self )
	  	self.__index = self
	  	return o
	end
	return obj
end

Observer = {}
function Observer:create()
	function self:update( p ) -- virtual update
		-- do nothing
	end
	return FuncNew( Observer ):new()
end

Subject = {}
function Subject:create()
	self.m_observerList = {}
	function self:attach( observer )
		table.insert( self.m_observerList, observer )
	end
	function self:detach( observer )
		for k,v in pairs( self.m_observerList ) do
			if v == observer then
				table.remove( self.m_observerList, k )
			end
		end
	end
	function self:notify() -- virtual notify
		-- do nothing
	end
	return FuncNew( Subject ):new()
end

Subject1 = Subject:create() -- inheritance Subject
function Subject1:create()
	local m_state = nil
	function self:notify() -- override notify
		for k,v in pairs( self.m_observerList ) do
			v:update( m_state )
		end
	end
	function self:setState( s ) 
		m_state = s
		self:notify()
	end
	function self:getState( s ) 
		return m_state
	end
	return FuncNew( Subject1 ):new()
end

Observer1 = Observer:create() -- inheritance Subject
function Observer1:create( n )
	local m_name = n
	local m_state = nil
	function self:update( p ) -- override update
		m_state = p
	end
	function self:getName()
		return m_name
	end
	function self:getState()
		return m_state
	end
	return FuncNew( Observer1 ):new()
end

Observer2 = Observer:create() -- inheritance Subject
function Observer2:create( n )
	local m_name = n
	local m_state = nil
	function self:update( p ) -- override update
		m_state = p
	end
	function self:getName()
		return m_name
	end
	function self:getState()
		return m_state
	end
	return FuncNew( Observer2 ):new()
end

------------------------------------------------------

local product = Subject1:create()
local shop1 = Observer1:create( "shop1--" )
local shop2 = Observer2:create( "shop2--" )
product:attach( shop1 )
product:attach( shop2 )
product:setState( 12 )
--print( shop1.m_state )
print( shop1:getName() .. tostring( shop1:getState() ) )
print( shop2:getName() .. tostring( shop2:getState() ) )
print( "" )
product:detach( shop2 )
product:setState( 11 )
print( shop1:getName() .. tostring( shop1:getState() ) )
print( shop2:getName() .. tostring( shop2:getState() ) )
