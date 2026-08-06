local __lang__ = require('src.lang.__init__')
local __config__ = require('src.types.__config__')

local Object = __config__.__package.from(__lang__, {'Object'})

-- @class
local Integer = {

    -- @only_read string
    __class = 'Integer',

    -- @only_read string
    __namespace = __config__.__namespace,

    -- @param boolean value
    __construct = function(self, value)
        self.value = value
    end,

    -- @return boolean
    get_integer = function(self)
        return self.value
    end,

    -- @return boolean
    get_value = function(self)
        return self.value
    end
}

return __config__.__class:create(Integer, Object.template)