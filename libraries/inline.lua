require("libraries/match") -- Import Switch Case Statements
require('libraries/class') --- Import Class Implementation

--- @class inline
--- 
--- Attributes
--- ----------
--- @type directory : string -- Packages Directory
--- @type prompt : string -- Console Prompt
--- @type packages : table ( string : string) -- Packages
---
--- Methods
--- -------
--- @type install : function -- Install Package
--- @type remove : function -- Remove Package
--- @type list : function -- List All Packages
--- @type publish : function -- Publish on Github
--- 
local inline = cls('inline').__init__()
inline:setProperty('directory', '/packages')
inline:setProperty('prompt', '[inline] >> ')
inline:setProperty('packages', { testing = '/path' })

--- Install Package
--- 
--- Parameters
--- ----------
--- @param pkg : string, required -- Package Name
---
--- Attributes
--- ----------
--- @type prompt : string -- Console Prompt
--- @type directory : string -- Packages Directory
---
--- @todo: Add Github Integration
--- 
function inline:install(pkg)
	print(string.format(self.prompt .. 'Install %s in %s', pkg, self.directory))
end

--- Remove Package
---
--- Parameters
--- ----------
--- @param pkg : string, required -- Package Name
--- 
--- Attributes
--- ----------
--- @type prompt : string -- Console Prompt
--- @type directory : string -- Packages Directory
---
function inline:remove(pkg)
	print(string.format(self.prompt .. 'Remove %s in %s', pkg, self.directory))
end

--- List All Packages
---
--- Attributes
--- ----------
--- @type packages : table (string : string) -- Packages
--- @type prompt : string -- Console Prompt
---
function inline:list()
	for name, ver in pairs(self.packages) do
		print(self.prompt .. name .. ' in ' .. ver)
	end
end

--- Publish on Github
--- 
--- Parameters 
--- ----------
--- @param pkg : string, required -- Package Name
---
--- Attributes
--- ----------
--- @type prompt : string -- Console Prompt
---
--- @todo Add Github Integration
---
function inline:publish(pkg)
    print(string.format(self.prompt .. 'uploading %s to Github',pkg))
    print(string.format(self.prompt .. 'Published on Github https://github.com/user/%s', pkg))
end

--- Commands Function for Inline
---
--- Parameters
--- ----------
--- @param ... : args -- Command
---
--- Attributes
--- ----------
--- @type prompt : string -- Console Prompt
---
function inline:commands(...)
    local args = {...}
	
	command = args[1]
	param = args[2]
	
	--- Init Switch-Case as Function
    local case = statement()

    -- Switch-Case Statements
    case:addStatement("install", function() inline:install(param) end)
    case:addStatement("remove",  function() inline:remove(param) end)
    case:addStatement("list",    function() inline:list() end)
    case:addStatement("publish", function() inline:publish(param) end)
	
	--- Switch-Case Default
    case:setDefault(function()
        print(self.prompt .. 'Please use: inline [install|remove|list] [name]')
    end)
	
	--- Get Action
	local action = case:get(command)
    
    if type(action) == "function" then
        action()
    else
        case:get("default")()
    end

end

inline:commands('install', 'testing')
inline:commands('remove', 'testing')
inline:commands('list', '')
inline:commands('publish', 'package')
