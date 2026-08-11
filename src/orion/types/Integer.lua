local __config__ = require('orion.types.config')
local TypeError  = require('orion.exceptions.TypeError')
local Types  = require('orion.lang.Types')
local Float  = require('orion.types.Float')
local Number = require('orion.types.Number')
local String = require('orion.types.String')

-- @class
local Integer = {

    -- @only_read string
    __class = 'Integer',

    -- @only_read string
    __namespace = __config__.__namespace,

    -- @param integer|string value
    __construct = function(self, value)
        
        -- receber value como integer ou uma string que represente um integer, fora esses casos disparar erros
        -- Exception -> ValueError - integer ou string que represente um integer
        -- Exception -> TypeError  - para verificação de tipos de entrada diferentes de integer|string
        
        self.value = value
    end,

    -- @param Object other
    -- @return boolean
    equals = function(self, other)
        return Types:equals(Types:class(self), Types:class(other)) and (self.value == other.value)
    end,

    -- @return integer
    hash_code = function(self)
        return self.value
    end,

    -- @return integer
    get_integer = function(self)
        return self.value
    end,

    -- @return Float
    as_float = function(self)
        return Float.new(self.value)
    end,

    -- @return Number
    as_number = function(self)
        return Number.new(self.value)
    end,

    -- @return String
    as_string = function(self)
        return String.new(self.value)
    end,

    -- @override
    -- @return string
    __tostring = function(self)
        return tostring(self.value)
    end
}

return __config__.__class:create(Integer, __config__.__object.template)