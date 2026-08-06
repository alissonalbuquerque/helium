local __lang__ = require('src.lang.__init__')
local __config__ = require('src.lang.__config__')

local Object, Case = __config__.__package.from(__lang__, {'Object', 'Case'})

-- @class
local Enum = {

    -- @only_read string
    __class = 'Enum',

    -- @only_read string
    __namespace = __config__.__namespace,

    -- @param table<string, string|number|boolean> cases
    __construct = function(self, cases)
        self.cases = {}

        for name, value in pairs(cases) do
            self[name] = Case.new(name, value)

            table.insert(self.cases, self[name])
        end
    end,

    -- @return Case[]
    get_cases = function(self)
        return self.cases
    end
}

return __config__.__class:create(Enum, Object.template)