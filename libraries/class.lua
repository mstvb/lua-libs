--- @class cls
--- @field __name string The name of the class
--- @field __index table Points to itself for prototypical inheritance
---
--- Creates a new Class definition
--- @param className string The name of the class for debugging and identity
--- @return cls | table
--- 
function cls(className)
    
    local class = {}
    class.__name = className
    class.__index = class

    --- Class Constructor
    --- @constructor
    --- @param attributes? table Class Attributes
    --- @return table instance
    ---
    function class:__init__(attributes)
        local instance = setmetatable(attributes or {}, class)
        return instance
    end

    --- Set a property on the instance
    --- @method setProperty
    --- @param key string The property name
    --- @param val any The value to assign
    ---
    function class:setProperty(key, val)
        if key and val then
            self[key] = val
        else
            return
        end
    end

    --- Get a Property from Class
    --- @method getProperty
    --- @param key string The property name
    --- @return any val
    ---
    function class:getProperty(key)
        if key then
            return self[key]
        else
            return error('Property not exists')
        end
    end

    --- Remove a Property from Class
    --- @method deleteProperty
    --- @param key string The property name
    ---
    function class:deleteProperty(key)
        if key then
            self[key] = nil
        else
            return
        end
    end

    --- Returns Class Name
    --- @method __name__
    --- @return string __name
    ---
    function class:__name__()
        return self.__name
    end

    return class

end