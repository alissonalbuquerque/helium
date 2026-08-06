local __config__ = require('src.lang.__config__')

-- @interface
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