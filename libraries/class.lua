--- @class cls
--- 
--- Parameters
--- @param className string
---
--- Attributes
--- @field __name string
--- @field __index table
---
--- Methods
--- @field __init__ function
--- @field __name__ function
--- 
--- Returns
--- @return class instance
---
function cls(className)
    
    local class = {}
    class.__name = className
    class.__index = class

    --- Initialize Class
    --- 
    --- Parameters
    --- @param attributes? table
    ---
    --- Returns
    --- @return table instance
    ---
    function class:__init__(attributes)
        local instance = setmetatable(attributes or {}, class)
        return instance
    end

    --- Get Name of Class
    ---
    --- Returns
    --- @return string __name
    ---
    function class:__name__()
        return self.__name
    end

    return class
end
