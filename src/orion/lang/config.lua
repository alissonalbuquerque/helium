local __config__ = {}

    __config__.__namespace = 'orion.lang'
    __config__.__modules   = {'AbstractClass', 'Exception', 'Object', 'Throwable', 'Types'}
    __config__.__package   = require('orion.core.Package')
    __config__.__class     = require('orion.core.Class')
    __config__.__object    = require('orion.lang.Object')

return __config__