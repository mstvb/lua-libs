--- @class statement
--- @constructor
--- @field match self
--- @field __index table
--- @field default nil
--- @field instance table
--- 
--- @return statement | table
---
function statement() 
	local match = {}
    match.__index = match
	match.default = false

	--- Add Match Statement
	--- @method add
	--- @param key string
	--- @param statement function
	---
	function match:add(key, statement)	
		--- IF key and statement
		if key and statement then
			self[key] = statement
		--- ELSE
		else
			error('Key | Statement not exists')
		end
	end

	--- Set Default Option
	--- @method set_default
	--- @param default function
	---
	function match:set_default(default)
		--- IF default
		if default then
			self.default = default
		--- ELSE
		else
			error('Default not exists')
		end
	end

	--- Check if Equal Function
	--- @method get
	--- @param equal any
	--- @return self function
	--- 
	function match:get(equal)
		--- IF Equal
		if equal then
			return self[equal]
		--- ELSE IF --
		elseif type(self.default) == 'function' then
			return self.default()
		--- ELSE
		else
			error('Equal not exists')
		end
	end

	return match

end