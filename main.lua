-- main.lua
-- @description Demo für class + match Module

local class_module = require("libraries/class")
local match_module = require("libraries/match")

--- @class AppConfig
--- @field public greeting string
--- @field public version string

--- LOGIC
local app = class_module:new("AppConfig")
app:set("greeting", "Hello from mstvb/lua-libs!")
app:set("version", "1.0.0")

--- CLASS MODULE
print("=== Class-Modul Test ===")
print("Class Name: " .. app:__str__())
print("Greeting: " .. app:get("greeting"))
print("Version: " .. app:get("version"))

--- MATCH MODULE
--- @class ActionHandler
--- @field public stmt Statement
local handler = class_module:new("ActionHandler")
handler.stmt = match_module:new()

handler.stmt:add("start", function() 
    print("[START] Init") 
    return true 
end)
handler.stmt:add("stop", function() 
    print("[STOP] Shutdown") 
    return false 
end)
handler.stmt:set_default(function() 
    print("[ERROR] Unknown Action") 
    return nil 
end)

print("\n=== Match-Modul Test ===")
handler.stmt:get("start")
handler.stmt:get("stop")
handler.stmt:get("unknown")

print("\n=== Integration successfully ===")
