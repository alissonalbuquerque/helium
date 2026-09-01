local __config__ = {}

    __config__.__namespace = 'orion.utils.uuid'
    __config__.__modules   = {'v3', 'v4', 'v5', 'v7'}
    __config__.__package   = require('orion.core.Package')
    __config__.__class     = require('orion.core.Class')
    __config__.__object    = require('orion.lang.Object')

return __config__
