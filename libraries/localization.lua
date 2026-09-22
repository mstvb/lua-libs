--- localization.lua
--- 
--- @module localization
--- @author mstvb
--- @version 1.0.0

local Localization = {}
Localization.__index = Localization

Localization.config = {
    default_lang = 'en',
    current_lang = 'en',
    translations = {},
    fallback_to_key = true
}

--- @class Localization
--- @param translation table
--- @field public __index table 
--- @field public config table
---
--- @return Localization self
function Localization:init(translation)
    self.config.translations = translation or {}
    self:setLanguage(self.config.default_lang)
end

--- Set Language
---
--- @param lang string 
---
--- @return boolean
function Localization:setLanguage(lang)
    if self.config.translations[lang] then
        self.config.current_lang = lang
        return true
    end
    return false
end

--- Translate with Key from Localization and Variables
---
--- @param key string
--- @param replacements any
---
--- @return string
function Localization:translate(key, replacements)
    local translation = self.config.translations[self.config.current_lang][key]
    
    if not translation then
        translation = self.config.translations[self.config.default_lang][key]
        
        if not translation then
            if self.config.fallback_to_key then
                return key
            else
                error("Translation key not found: " .. key)
            end
        end
    end
    
    if replacements then
        for k, v in pairs(replacements) do
            -- Sicher: keine Pattern-Meta-Zeichen
            local escaped_k = tostring(k):gsub('[%^%$%(%)%%%.%[%]%*%+%-?]','%%%1')
            translation = translation:gsub('{'..escaped_k..'}', tostring(v))
        end
    end
    
    return translation
end

return Localization
