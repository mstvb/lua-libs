--- translation_example.lua

local Localization = require('./libraries/localization')

local translations = {
    de = {
        login_success = "Erfolgreich eingeloggt, {username}",
        balance = "Dein Guthaben beträgt {amount} €",
        notification = "{sender} hat dir {message_count} Nachrichten gesendet"
    },
    en = {
        login_success = "Successfully logged in, {username}",
        balance = "Your balance is {amount} €",
        notification = "{sender} sent you {message_count} messages"
    }
}

Localization:init(translations)
Localization:setLanguage('de')

print(Localization:translate("login_success", {username="username"}))
print(Localization:translate("balance", {amount="1.520,50"}))
print(Localization:translate("notification", {sender="Florian", message_count=5}))
