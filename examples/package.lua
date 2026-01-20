require ('libraries/inline')

local inline = inline

inline:commands('install', 'package')
inline:commands('remove', 'package')
inline:commands('list')
inline:commands('publish', 'package')
inline:commands('update', 'package', 'v0.2')