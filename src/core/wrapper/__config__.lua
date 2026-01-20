local __config__ = {}

    __config__.__namespace = 'src.core.wrapper'
    __config__.__modules   = {'String', 'Number', 'Boolean'}
    __config__.__package   = require('src.core.base.package')
    __config__.__object    = require('src.core.base.Object')

return __config__
