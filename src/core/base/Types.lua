-- @class Types
local Types = setmetatable(
    {
        NIL      = 'nil',
        BOOLEAN  = 'boolean',
        NUMBER   = 'number',
        INTEGER  = 'integer',
        FLOAT    = 'float',
        STRING   = 'string',
        TABLE    = 'table',
        FUNCTION = 'function',
    },
    {
        __index = {

            -- @param string a
            -- @param string b
            -- @return boolean
            equals = function(self, a, b)
                return a == b
            end,

            -- @param string a
            -- @param string b
            -- @return boolean
            not_equals = function(self, a, b)
                return a ~= b
            end
        }
    }
)

return Types
