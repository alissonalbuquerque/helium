local __config__ = require('src.core.collections.__config__')
local Iterable   = require('src.core.collections.interfaces.Iterable')
local Indexable  = require('src.core.collections.interfaces.Indexable')
local types      = require('src.core.base.types')

-- @class Array
local Array = {

    -- @only_read string
    __class = 'Array',

    __implements = {
        Iterable,
        Indexable
    },

    -- @only_read string
    __namespace = __config__.__namespace,

    -- @param number len
    -- @param table|function input
    __construct = function(self, len, input)
        self.len   = len
        self.items = {}

        if type(input) == types.TABLE then
            for i = 1, len do self.items[i] = input[i] end
        elseif type(input) == types.FUNCTION then
            for i = 1, len do self.items[i] = input() end
        else
            error('Invalid input type for Array constructor. Expected table or function.')
        end

    end,

    -- @param integer index
    -- @param Any item
    -- @return void
    set = function(self, index, item)
        self.items[self:shift_index(index)] = item
    end,

    -- @param integer index
    -- @return Any
    get = function(self, index)
        return self.items[self:shift_index(index)]
    end,

    -- @return integer
    shift_index = function(self, index)
        return Indexable.default.shift_index(index, Indexable.INCREMENT)
    end

    -- iterator
    -- tostring
}

return __config__.__object:create(Array)