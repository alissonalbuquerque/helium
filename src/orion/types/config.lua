local __config__ = {}

    __config__.__namespace = 'orion.types'
    __config__.__modules   = {'Boolean', 'Float', 'Integer', 'Number', 'String'}
    __config__.__package   = require('orion.core.Package')
    __config__.__class     = require('orion.core.Class')
    __config__.__object    = require('orion.lang.Object')

return __config__