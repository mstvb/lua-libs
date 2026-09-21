-- match.lua
-- @module match
-- @description Match-Statement-Modul für switch-case-ähnliche Logik in Lua
-- @author mstvb/lua-libs
-- @version 1.0.0

local Statement = {}
Statement.__index = Statement

--- @class Statement
--- @brief A Class for Match-Case-Logik (switch-case-Alternative)
--- @field public __index table Metatable for Function-Access
--- @field public default function|boolean Default-Function oder false
---
--- @field public add fun(key: string, statement: function): nil
--- @field public set_default fun(default: function): nil
--- @field public get fun(equal: string): any

--- @return Statement self
function Statement:new() 
    local instance = setmetatable({}, self)
    instance.default = false
    return instance
end

--- Add Statement
--- @param key string
--- @param statement function
--- @raise error
--- @example
---     stmt:add("option1", function() print("Option 1") end)
function Statement:add(key, statement)	
    if key and statement then
        self[key] = statement
    else
        error('Key | Statement not exists')
    end
end

--- Set Default Function
--- @param default function
--- @raise error
--- @example
---     stmt:set_default(function() print("Unknown Option") end)
function Statement:set_default(default)
    if default then
        self.default = default
    else
        error('Default not exists')
    end
end

--- Call Statement
--- @param equal string
--- @return any
--- @raise error
--- @example
---     stmt:get("option1")  -- Executes function when match
function Statement:get(equal)
    if equal and self[equal] then
        return self[equal]()
    elseif type(self.default) == 'function' then
        return self.default()
    else
        error('Key "' .. tostring(equal) .. '" not found and no default exists')
    end
end

--- @return Statement
return Statement
