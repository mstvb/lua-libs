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

    --- Returns Class Name
    --- @method __name__
    --- @return string __name
    ---
    function class:__name__()
        return self.__name
    end

    return class
end
