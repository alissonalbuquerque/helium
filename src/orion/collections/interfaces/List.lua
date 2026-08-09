local __config__ = require('src.core.collections.interfaces.__config__')

-- @interface List
local List = {

    -- @only_read string
    __interface = 'List',

    -- @only_read string
    __namespace = __config__.__namespace,

    -- @only_read string[]
    __methods = {
        'add',
        'remove',
        'get',
        'size',
        'is_empty'
    }
}

return List
