local __config__ = {}

    __config__.__namespace = 'src.types'
    __config__.__modules   = {'Boolean', 'Float', 'Integer', 'Number', 'String'}
    __config__.__package   = require('src.core.Package')
    __config__.__class     = require('src.core.Class')

return __config__