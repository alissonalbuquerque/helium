local __config__ = require('src.lang.__config__')

-- @interface
local AbstractClass = {

    -- @only_read string
    __interface = 'AbstractClass',

    -- @only_read string
    __namespace = __config__.__namespace,

    -- @only_read string[]
    __methods = {
           
    }
}

return AbstractClass