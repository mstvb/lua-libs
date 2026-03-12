Statement = {}
--- @class statement
--- 
--- Attributes
--- @field __index table
--- @field default boolean|function
---
--- Methods
--- @field add function
--- @field set_default function
--- @field get function
--- 
--- Returns
--- @return table match
---
function Statement:new() 
	setmetatable({}, self)
    self.__index = match
	self.default = false

--- Add Match Statement
---
--- Parameters
--- @param key string
--- @param statement function
---
function Statement:add(key, statement)	
	if key and statement then
		self[key] = statement
	else
		error('Key | Statement not exists')
	end
end

--- Set Default Option
---
--- Parameters
--- @param default function
---
function Statement:set_default(default)
	if default then
		self.default = default
	else
		error('Default not exists')
	end
end

--- Check if Equal Function
--- 
--- Parameters
--- @param equal string
--- 
--- Returns
--- @return function
---
function Statement:get(equal)
	if equal then
		return self[equal]
	elseif type(self.default) == 'function' then
		return self.default()
	else
		error('Equal not exists')
	end
end
