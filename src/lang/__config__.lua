local __config__ = {}

    __config__.__namespace = 'src.lang'
    __config__.__modules   = {'AbstractClass', 'Exception', 'Object', 'Throwable', 'Types'}
    __config__.__package   = require('src.core.Package')
    __config__.__class     = require('src.core.Class')

return __config__