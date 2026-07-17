local __config__ = require('src.core.collections.interfaces.__config__')

-- @interface Indexable
local Indexable = {

    -- @only_read string
    interface = 'Indexable',

    -- @only_read string
    namespace = __config__.__namespace,

    -- @only_read integer
    INCREMENT = 1,

    -- @only_read string[]
    methods = {
        'set',
        'get',
        'shift_index'
    },

    -- @only_read function[]
    default = {
        shift_index = function(index, shift)
            return index + shift
        end
    }
}

return Indexable
