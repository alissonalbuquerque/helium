local __config__ = require('src.core.collections.interfaces.__config__')

-- @interface Iterable
local Iterable = {

    -- @only_read string
    __interface = 'Iterable',

    -- @only_read string
    __namespace = __config__.__namespace,

    -- @only_read string[]
    __methods = {
        'iterator'
    }
}

return Iterable
