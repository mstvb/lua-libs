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
function statement() 
	local match = {}
    match.__index = match
	match.default = false

	--- Add Match Statement
	---
	--- Parameters
	--- @param key string
	--- @param statement function
	---
	--- Attributes
	--- @field match table
	---
	function match:add(key, statement)	
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
	--- Attributes
	--- @field match table
	---
	function match:set_default(default)
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
	--- Attributes
	--- @field match table
	--- 
	--- Returns
	--- @return function
	---
	function match:get(equal)
		if equal then
			return self[equal]
		elseif type(self.default) == 'function' then
			return self.default()
		else
			error('Equal not exists')
		end
	end

	return match

end
