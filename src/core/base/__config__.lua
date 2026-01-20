local __config__ = {}

    __config__.__namespace = 'src.core.base'
    __config__.__modules   = {'Case', 'Enum', 'Object'}
    __config__.__package   = require('src.core.base.package')
    __config__.__object    = require('src.core.base.Object')

return __config__
