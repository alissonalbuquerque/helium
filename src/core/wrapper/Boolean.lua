local __config__ = require('src.core.wrapper.__config__')

local Boolean = {

    -- @only_read string
    __class = 'Boolean',

    -- @only_read string
    __namespace = __config__.__namespace,

    -- @param boolean value
    __construct = function(self, value)
        self.value = value
    end,

    -- @return boolean
    get_boolean = function(self)
        return self.value
    end,

    -- @return boolean
    get_value = function(self)
        return self.value
    end,

    -- @override
    -- @return string
    __tostring = function(self)
        return __config__.__object:tostring(self)
    end
}

return __config__.__object:create(Boolean)