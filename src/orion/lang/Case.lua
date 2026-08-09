local __config__ = require('orion.lang.config')

-- @class
local Case = {

    -- @only_read string
    __class = 'Case',

    -- @only_read string
    __namespace = __config__.__namespace,

    -- @param string name
    -- @param string|number|boolean value
    __construct = function(self, name, value)
        self.name  = name
        self.value = value
    end,

    -- @return string
    get_name = function(self)
        return self.name
    end,

    -- @return string|number|boolean
    get_value = function(self)
        return self.value
    end
}

return __config__.__class:create(Case, __config__.__object.template)