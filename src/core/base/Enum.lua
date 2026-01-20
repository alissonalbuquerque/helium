local __config__ = require('src.core.base.__config__')
local case = require('src.core.base.Case')

-- @class Enum
local Enum = {

    -- @only_read string
    __class = 'Enum',

    -- @only_read string
    __namespace = __config__.__namespace,

    -- @param table cases
    __construct = function(self, cases)
        self.cases = {}

        for name, value in pairs(cases) do
            self[name] = case.new(name, value)

            table.insert(self.cases, self[name])
        end
    end,

    -- @return table<Case>
    get_cases = function(self)
        return self.cases
    end,

    -- @override
    -- @return string
    __tostring = function(self)
        return __config__.__object:tostring(self)
    end
}

return __config__.__object:create(Enum)
