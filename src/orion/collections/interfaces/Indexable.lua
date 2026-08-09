local __config__ = require('src.core.collections.interfaces.__config__')
local Types = require('src.core.base.Types')

-- @interface Indexable
local Indexable = {

    -- @only_read string
    __interface = 'Indexable',

    -- @only_read string
    __namespace = __config__.__namespace,

    -- @only_read string[]
    __methods = {
        'set',
        'get',
        'count',
        'shift_index'
    },

    -- @only_read integer
    INCREMENT = 1,

    -- @only_read function[]
    default = {
        -- @return integer
        shift_index = function(index, shift)
            return index + shift
        end,

        -- @throws error If the 'input_index' is not a integer
        -- @throws error If the 'input_index' is out of bounds in 'start_index' to 'end_index'
        check_index = function(input_index, start_index, end_index)
            if Types:not_equals(math.type(input_index), Types.INTEGER) then
                error("Invalid argument: index must be an integer", 2)
            end

            if input_index < start_index or input_index > end_index then 
                error(("Index %d out of bounds [%d, %d]"):format(input_index, start_index, end_index), 2)
            end
        end
    }
}

return Indexable
