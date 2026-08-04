local __config__ = require('src.core.base.interfaces.__config__')

-- @interface Throwable
local Throwable = {

    -- @only_read string
    __interface = 'Throwable',

    -- @only_read string
    __namespace = __config__.__namespace,

    -- @only_read string[]
    __methods = {
        'throw'
    }
}

return Throwable
