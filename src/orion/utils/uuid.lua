local __config__ = require('orion.util.config')
local Unit = require('orion.singleton.Unit')

-- @class
local uuid = {

    -- @only_read string
    __class = 'uuid',

    -- @only_read string
    __namespace = __config__.__namespace,
}

return __config__.__class:create(uuid, __config__.__object.template)