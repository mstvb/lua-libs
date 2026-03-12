Class = {}

--- @class cls
--- 
--- Parameters
--- @param className string
---
--- Attributes
--- @field __name string
---
--- Methods
--- @field new fun(className) Class Constructor
--- @field set fun(key, val) Set Class Attribute
--- @field get fun(key) Get Class Attribute
--- @field __str__ fun() Class as String
---

--- Class Instructor
---
--- Parameters
--- @param className string
---
--- Attributes
--- @field self Class
--- @field __name string
--- 
--- Returns
--- @return Class
---
function Class:new(className)
    setmetatable({}, self)
    self.__name = className
    return self
end

--- Set Class Attribute
---
--- Parameters
--- @param key string
--- @param val any
--- 
--- Attributes
--- @field self Class
--- 
--- Returns
--- @return self Class
---
function Class:set(key, val)
  self[key] = val
    return self
end

--- Get Class Attributes
--- 
--- Parameters
--- @param key string
---
--- Attributes
--- @field self Class
---
--- Returns
--- @return any
---
function Class:get(key)
  if key in self then
    return self[key]
  else
    return nil
  end
end

--- Class as String
---
--- Attributes
--- @field __name string
--- 
--- Returns
--- @return string
---
function Class:__str__()
  return self.__name
end
