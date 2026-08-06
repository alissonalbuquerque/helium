-- @table Package
local Package = {

    -- @field _namespace string
    -- @field _modules   string[]
    -- @return Object|metatable|Package
    new = function(_namespace, _modules)

        local _table = {namespace = _namespace, modules = _modules}

        local _metatable = {
            __index = {

                -- @return string
                get_namespace = function(self) 
                    return self.namespace
                end,

                -- @return string[]
                get_modules = function(self)
                    return self.modules
                end,

                -- @return string[]
                get_paths = function(self)
                    local paths = {}

                    for _, _module in ipairs(self.modules) do
                        paths[_module] = ("%s.%s"):format(self.namespace, _module)
                    end
                    
                    return paths
                end,

                -- @return module[]
                load_modules = function(self)
                    local package = {}

                    for key, path in pairs(self:get_paths()) do
                        package[key] = require(path)
                    end

                    return package
                end
            }
        }

        return setmetatable(_table, _metatable)
    end,

    -- @field _modules module[]
    -- @field _imports string[]
    -- @return args|... -> module[]
    from = function(_modules, _imports)
        local modules = {}

        for _, _value in pairs(_imports) do
            table.insert(modules, _modules[_value])
        end

        return table.unpack(modules)
    end
    
}

return Package