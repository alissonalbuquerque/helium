local __config__ = require('src.core.collections.exceptions.__config__')
local Exception  = require('src.core.base.Exception')

-- @class ArrayInvalidArgumentException
local ArrayInvalidArgumentException = {

    -- @only_read string
    __class = 'ArrayInvalidArgumentException',

    -- @only_read string
    __namespace = __config__.__namespace,

    -- @override
    -- @param string name
    -- @param string message
    -- @param integer level
    __construct = function(self)
        self.name    = self.__class,
        self.level   = 0
        self.message = "Invalid input type for Array constructor. Expected table or function."
    end,

    -- @throws error If type of constructor is not table or function.
    throw = function(self)
        error(self:get_message(), self:get_level())
    end
}

return __config__.__object:create(ArrayInvalidArgumentException)
