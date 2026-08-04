local __config__ = require('src.core.base.interfaces.__config__')

-- @interface AbstractClass
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
