function cls(className)
	--- Lua Class Implementation
	---
	--- Parameters
	--- @param className : string
	---
	--- Attributes
	--- @type class : table ( string | any )
	---
	--- Methods
	--- @type __init__(attributes): table ( string | any )
	--- @type setProperty(key, val): 
	--- @type getProperty(key)
	--- @type deleteProperty(key)
	

    local class = {}
	assert(className, 'className not exists')
    class.__name = className
    class.__index = class

    function class:__init__(attributes)
        local instance = setmetatable(attributes or {}, class)
        if instance.init then
            instance:init()
        end
        return instance
    end

    function class:setProperty(key, val)
		assert(key, 'key not exists')
		assert(val, 'val not exists') 
		self[key] = val
    end

    function class:getProperty(key)
		assert(key, 'key not exists')
        return self[key]
	end

    function class:deleteProperty(key)
		assert(key, 'key not exists')
		if self[key] then
        	self[key] = nil
			return true
		else
			return false
		end
    end

	function class:__name__()
		return self.__name
	end

    return class
end