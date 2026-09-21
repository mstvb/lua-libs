-- class.lua
-- @module class
-- @description Einfaches Class OOP-Framework for Lua
-- @author mstvb/lua-libs
-- @version 1.0.0

local Class = {}
Class.__index = Class

--- @class Class
--- @field private __name string
--- @field public __index table
---
--- @field public new fun(className: string): Class
--- @field public set fun(key: string, val: any): Class
--- @field public get fun(key: string): any
--- @field public __str__ fun(): string

--- Create Instance
--- @param className string
--- @return Class instance
--- @example
---     local MyObject = Class:new("MyObject")
function Class:new(className)
    local instance = setmetatable({}, self)
    instance.__name = className
    return instance
end

--- Set Option from Class
--- @param key string
--- @param val any
--- @return Class self
--- @example
---     obj:set("greeting", "Hallo")
---     obj:set("count", 42)
function Class:set(key, val)
    self[key] = val
    return self
end

--- Returns Value from Class
--- @param key string
--- @return any
--- @example
---     local greeting = obj:get("greeting")
function Class:get(key)
    return self[key]
end

--- Returns Class Name
--- @return string
--- @example
---     print(obj:__str__())  -- Ausgabe: "MyClass"
function Class:__str__()
    return self.__name
end

--- @return Class
return Class
