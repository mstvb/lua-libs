require("libraries/match") -- Import Switch Case Statements
require('libraries/class') --- Import Class Implementation

--- @class inline
--- @constructor
--- @field directory string -- Packages Directory
--- @field prompt string -- Console Prompt
--- @field packages table ( string : string) -- Packages
--- 
inline = cls('inline').__init__()

--- Inline Class Attributes
inline.directory = '/packages'
inline.prompt = '[inline] >> '
inline.packages = { testing = '/path' }

--- Install Package
--- @method install
--- @param pkg string, required
--- @todo: Add Github Integration
--- 
function inline:install(pkg)
	print(string.format(self.prompt .. 'Install %s in %s', pkg, self.directory))
end

--- Remove Package
--- @method remove
--- @param pkg string, required 
---
function inline:remove(pkg)
	print(string.format(self.prompt .. 'Remove %s in %s', pkg, self.directory))
end

--- List All Packages
--- @method list
--- 
function inline:list()
	for name, ver in pairs(self.packages) do
		print(self.prompt .. name .. ' in ' .. ver)
	end
end

--- Publish on Github
--- @method publish
--- @param pkg string, required
---
--- @todo Add Github Integration
---
function inline:publish(pkg)
    print(string.format(self.prompt .. 'uploading %s to Github', pkg))
    print(string.format(self.prompt .. 'Published on Github https://github.com/user/%s', pkg))
end

--- Update Package
--- @method update
--- @param pkg string, required
--- @param version number | string, required
---
--- @todo Add Github Integration
---
function inline:update(pkg, version)
    print(string.format(self.prompt .. 'Update %s to %s from Github', pkg, version or 'latest'))
end

--- Commands Function for Inline
--- @method commands
--- @param ... string
---
function inline:commands(...)
    local args = {...}

	local command = args[1]
	local param = args[2]
    local param_last = args[3]

	--- Init Switch-Case as Function
    local case = statement()

    -- Switch-Case Statements
    case:add("install", function() inline:install(param) end)
    case:add("remove",  function() inline:remove(param) end)
    case:add("list",    function() inline:list() end)
    case:add("publish", function() inline:publish(param) end)
    case:add("update",  function() inline:update(param, param_last) end)

	--- Switch-Case Default
    case:set_default(function()
        print(self.prompt .. 'Please use: inline [install|remove|list|publish] [name]')
    end)

	local action = case:get(command)

    --- IF Action
    if type(action) == "function" then
        action()
    --- ELSE
    else
        case:get("default")()
    end

end
