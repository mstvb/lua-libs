function statement()
	
	local match = {}
    match.__index = match
	
	local instance = setmetatable({}, match)
	
	function match:addStatement(key, statement)
		assert(key, 'key not exists')
		assert(statement, 'statement not exists')
		self[key] = statement
	end
	
	function match:setDefault(default)
		assert(default, 'default not exists')
		self['default'] = default
	end
	
	function match:get(equal)
		assert(equal, 'equal not exists')
		return self[equal] or self['default']
	end
	
	return match
	
end