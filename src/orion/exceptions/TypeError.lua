local __config__ = require('orion.exceptions.config')
local Exception  = require('orion.lang.Exception')

-- @class
local TypeError = {

    __class = 'TypeError',

    __namespace = __config__.__namespace,

    -- @param 
    __construct = function(self, expected, received)
        self.name    = self.__class
        self.level   = 0
        self.message = ("%s: incompatible types: expected '%s', but received '%s'"):format(self.name, expected, received)
    end,

    -- @override
    -- @return string
    get_message = function(self)
        return self.message
    end,

    -- @throws error If received type is not compatible with expected type.
    throw = function(self)
        error(self:get_message(), self:get_level())
    end
}

return __config__.__class:create(TypeError, Exception.template)