local __lang__ = require('orion.lang.init')
local __config__ = require('orion.lang.config')

local AbstractClass, Throwable = __config__.__package.from(__lang__, {'AbstractClass', 'Throwable'})

-- @abstract
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
        self.message = "Message Exception"
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
    end
}

return __config__.__class:create(Exception, __config__.__object.template)