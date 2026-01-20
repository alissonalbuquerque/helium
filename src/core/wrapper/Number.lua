local __config__ = require('src.core.wrapper.__config__')

local Number = {

    -- @only_read string
    __class = 'Number',

    -- @only_read string
    __namespace = __config__.__namespace,

    -- @only_read string
    TYPE_FLOAT = 'float',

    -- @only_read string
    TYPE_INTEGER = 'integer',

    -- @param number value
    __construct = function(self, value)
        self.value = value
    end,

    -- @return number
    get_number = function(self)
        return self.value
    end,

    -- @return number
    get_value = function(self)
        return self.value
    end,

    -- @return string
    get_type = function(self)
        return math.type(self.value)
    end,

    -- @return boolean
    is_float = function(self)
        return self:get_type() == self.TYPE_FLOAT
    end,

    -- @return boolean
    is_integer = function(self)
        return self:get_type() == self.TYPE_INTEGER
    end,

    -- @override
    -- @return string
    __tostring = function(self)
        return __config__.__object:tostring(self)
    end
}

return __config__.__object:create(Number)

-- is_float() : boolean
-- is_integer() : boolean

-- @return wrapper.Number
-- abs = function(self)

--     local constructor = {
--         math.abs(self:content())
--     }

--     return self:new(constructor)
-- end,

-- @return wrapper.Number
-- ceil = function(self)

--     local constructor = {
--         math.ceil(self:content())
--     }

--     return self:new(constructor)
-- end,

-- @return wrapper.Number
-- floor = function(self)

--     local constructor = {
--         math.floor(self:content())
--     }

--     return self:new(constructor)
-- end,

-- @return wrapper.Number
-- round = function(self, digits)

--     local digits = digits or 2
--     local fmt = string.format("%%.%df", digits)

--     local cosntructor = {
--         tonumber(string.format(fmt, self:content()))
--     }

--     return self:new(cosntructor)
-- end,

-- @return number
-- content = function(self)
--     return self.attributes.wrapped_number
-- end,

-- @return number
-- val = function(self)
--     return self:content()
-- end,
