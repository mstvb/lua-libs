# lua-libs

Useful Library for Lua 

## Contents

- [Libraries](#libraries)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Usage](#usage)
- [Project Links](#project-links)
- [Authors](#authors)

## Libraries

| Library Name | Path | Description |
| ----------- | ---- | ----------- |
| class | `libraries/class` | Class Implementation |
| match | `libraries/match` | Switch-Case Statements |
| localization | `libraries/localization` | Localization |

## Prerequisites

- Install Lua 5.4 or higher | [Lua](https://lua.org/)

```bash
curl -L -R -O https://www.lua.org/ftp/lua-5.4.0.tar.gz
tar zxf lua-5.4.0.tar.gz
cd lua-5.4.0
make all test
```

- Install Git for Version Control | [Git](https://git-scm.com/)

## Quick Start

```bash
# Execute `main.lua` from Library
lua main.lua

# Execute `translation_example.lua` from Library
cd examples
lua translation_example.lua
```

## Usage

> How to Use - Class Module 

```lua
local class = require('libraries/class') --- Import Module

local example_class = class:new("Example") --- Create a Class
example_class:set("greeting", "Hello from the Developer ;)") --- Set a Class Variable

print(example_class:__str__()) --- Print Name of Class
print(example_class:get(""greeting)) --- Print Variable from Class
```

> How to Use - Match Module

```lua
local match = require('libraries/match') --- Import Module

local example_match = match:new() --- Create a Swtich Case Statement

example_match:add("yes", function() print("Yes") end) --- Add Case when Yes
example_match:add("no", function() print("No") end) --- Add Case when No
example_match:set_default(function() print("Default") end) --- Add Default when Key not exists

print(example_match:get("yes")) --- Returns Function with Print Output: Yes
print(example_match:get("no")) --- Returns Function with Print Output: No
print(example_match:get("anything")) --- Returns Function when Key not exists with Print Output: Default

```

> How to Use - Localization Module

```lua
local localization = require('libraries/localization') --- Import Module

local translations = {
    de = {
        login_success = "Du hast dich erfolgreich eingeloggt, {username}",
        login_failed = "Der Login ist fehlgeschlagen",
    },
    en = {
        login_success = "You have a successfully logged in, {username}",
        login_failed = "Login has failed",
    }
}

local example_translate = localization:new(translations) --- Create a Localization
example_translate.set_language('en') --- Set Language

print(Localization:translate("login_success", {username="username"})) --- Print Output: You have successfully logged in, username
print(Localization:translate("login_failed")) --- Print Output: Login has failed

```

## Project Links

> lua-libs
* [Project Site](https://github.com/mstvb/lua-libs)
* [Issues](https://github.com/mstvb/lua-libs/issues)
* [Discussions](https://github.com/mstvb/lua-libs/discussions)

## Authors

> Manuel Staufer (mstvb)
* [Github](https://github.com/mstvb)
* [Email](mailto::manuel.staufervb@gmail.com)
