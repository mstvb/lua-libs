# lua-libs

Useful Library for Lua with `projects` from [ `mstvb` ] 

## Contents

- [Libraries](#libraries)
- [Class](#class)
- [Project Links](#project-links)
- [Authors](#authors)
- [License](#license)

## Libraries

| Library Name | Path | Description |
| ----------- | ---- | ----------- |
| class | `libraries/class` | Class Implementation |
| match | `libraries/match` | Switch-Case Statements |
| inline | `-- not ready --` | Package Manager for Lua | 

## Class

> Class Implementation in Lua

```lua

require('libraries/class')

local example = cls('Example'):__init__()

```

| Function Name | Description | Usage |
| ------------ | ----------- | ----- |
| `__init__` | Initialize Class | --- |
| `__name__` | Returns `className` | --- |  
| `setProperty` | Set Property | `setProperty(key, val)` |
| `getProperty` | Returns Property | `getProperty(key)` |
| `deleteProperty` | Delete Property | `deleteProperty(key)` | 

## Match

> Switch-Case Statements in Lua

```lua

require('libraries/match')

function run(...)
    local args = {...}

    local command = args[1]
    local param = args[2]

    local case = statement()

    case:addStatement('help', function() print('Help Command') end)
    case:addStatement('hello', function() print('Hello Human') end)

    case:setDefault(function() print('Command not Found') end)

    local action = case:get(command)

    action()
end 
```

| Function Name | Description | Usage |
| -------------| ------------| ----- |
| `addStatement` | Add Statement to Switch-Case | `addStatement('statment-name', action)` |
| `setDefault` | Set Default by not Equal |  `setDefault(action)` |
| `get` | Get Statement | `get(variable)` |

## Inline

> Package Manager for Lua

* Use Commands in Shell | Console for Package Management

```bash
inline install | remove | list | publish
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