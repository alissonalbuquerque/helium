local __config__ = require('src.core.base.__config__')
local Throwable  = require('src.core.base.interfaces.Throwable')
local AbstractClass = require('src.core.base.interfaces.AbstractClass')

-- @Abstract Exception
local Exception = {

    -- @only_read string
    __class = 'Exception',

    -- @only_read table
    __implements = {
        Throwable,
        AbstractClass
    },

    -- @only_read string
    __namespace = __config__.__namespace,

    -- @param string name
    -- @param string message
    -- @param integer level
    __construct = function(self)
        self.name    = self.__class
        self.level   = 0
        self.message = "Abstract Exception"
    end,

    -- @return string
    get_name = function(self)
        return self.name
    end,

    -- @return string
    get_message = function(self)
        return self.message
    end,

    -- @return integer
    get_level = function(self)
        return self.level
    end,

    -- @override
    -- @return string
    __tostring = function(self)
        return __config__.__object:tostring(self)
    end
}

return __config__.__object:create(Exception)
