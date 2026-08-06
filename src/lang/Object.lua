local __config__ = require('src.lang.__config__')

-- @class
local Object = {

    -- @only_read string
    __class = 'Object',

    -- @only_read string
    __namespace = __config__.__namespace,

    -- @return void
    __construct = function(self)

    end,

    -- @override
    -- @return string
    __tostring = function(self)
        return __config__.__class:tostring(self)
    end
}

return __config__.__class:create(Object)