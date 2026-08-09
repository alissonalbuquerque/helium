local __config__ = require('orion.types.config')

-- @class
local Float = {

    -- @only_read string
    __class = 'Float',

    -- @only_read string
    __namespace = __config__.__namespace,

    -- @param boolean value
    __construct = function(self, value)
        self.value = value
    end,

    -- @return boolean
    get_float = function(self)
        return self.value
    end,

    -- @return boolean
    get_value = function(self)
        return self.value
    end
}

return __config__.__class:create(Float, __config__.__object.template)