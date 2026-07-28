local __config__ = require('src.core.collections.interfaces.__config__')

-- @interface Iterator
local Iterator = {

    -- @only_read string
    __interface = 'Iterator',

    -- @only_read string
    __namespace = __config__.__namespace,

    -- @only_read string[]
    __methods = {
    }
}

return Iterator
