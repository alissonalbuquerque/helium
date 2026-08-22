local __config__ = require('orion.exceptions.config')
local Exception  = require('orion.lang.Exception')

-- @class
local ValueError = {

    __class = 'ValueError',

    __namespace = __config__.__namespace,

    -- @param 
    __construct = function(self, value, message)
        self.name    = self.__class
        self.level   = 0
        self.message = ("%s: invalid value '%s'%s"):format(
            self.name,
            value,
            message ~= nil and (": %s"):format(message) or ""
        )
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

return __config__.__class:create(ValueError, Exception.template)