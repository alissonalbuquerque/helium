local __config__ = require('src.core.wrapper.__config__')

local String = {

    -- @only_read string
    __class = 'String',

    -- @only_read string
    __namespace = __config__.__namespace,

    -- @param string|nil value
    __construct = function(self, value)
        self.value = value or ''
    end,

    -- @return string
    get_string = function(self)
        return self.value
    end,

    -- @return string
    get_value = function(self)
        return self.value
    end,

    -- @return String
    -- upper = function(self)
    --     return self.value
    -- end,

    -- @return String
    -- lower = function(self)
    --     return self.value
    -- end,

    -- @return String
    -- format = function(self, ...)
    --     return self.value
    -- end,

    -- @return number
    -- len = function(self)
    --     return self.value
    -- end,

    -- @override
    -- @return string
    __tostring = function(self)
        return __config__.__object:tostring(self)
    end
}

return __config__.__object:create(String)
