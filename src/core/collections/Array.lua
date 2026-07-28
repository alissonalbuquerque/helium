local __config__ = require('src.core.collections.__config__')
local Indexable  = require('src.core.collections.interfaces.Indexable')
local Types      = require('src.core.base.Types')

-- @class Array
local Array = {

    -- @only_read string
    __class = 'Array',

    -- @only_read table
    __implements = {
        Indexable
    },

    -- @only_read string
    __namespace = __config__.__namespace,

    -- @param number len
    -- @param table|function input
    __construct = function(self, len, input)
        self.len   = len
        self.items = {}

        if Types:equals(type(input), Types.TABLE) then
            for i = 1, len do 
                self.items[i] = input[i] 
            end
        elseif Types:equals(type(input), Types.FUNCTION) then
            for i = 1, len do 
                self.items[i] = input() 
            end
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
    count = function(self)
        return self.len
    end,

    -- @param integer index
    -- @return integer
    -- @throws error If the index is out of bounds in 0 to length-1
    shift_index = function(self, index)
        Indexable.default.check_index(index, 0, self.len-1)
        return Indexable.default.shift_index(index, Indexable.INCREMENT)
    end,

    -- @return string
    __tostring = function(self)
        return __config__.__object:tostring(self)
    end
}

return __config__.__object:create(Array)