local __config__ = require('orion.types.config')
local Types      = require('orion.lang.Types')
local TypeError  = require('orion.exceptions.TypeError')

-- @class
local Boolean = {

    -- @only_read string
    __class = 'Boolean',

    -- @only_read string
    __namespace = __config__.__namespace,

    -- @param boolean value
    __construct = function(self, value)
        local expected, received = Types.BOOLEAN, Types:type(value)

        if Types:not_equals(expected, received) then TypeError.new(expected, received):throw() end

        self.value = value
    end,

    -- @param Object other
    -- @return boolean
    equals = function(self, other)
        return Types:equals(Types:class(self), Types:class(other)) and (self.value == other.value)
    end,

    -- @return integer
    hash_code = function(self)
        return self.value and 1231 or 1237
    end,

    -- @return boolean
    get_boolean = function(self)
        return self.value
    end,

    -- @return boolean
    is_true = function(self)
        return self.value == true
    end,
    
    -- @return boolean
    is_false = function(self)
        return self.value == false
    end,

    -- @override
    -- @return string
    __tostring = function(self)
        return tostring(self.value)
    end
}

return __config__.__class:create(Boolean, __config__.__object.template)