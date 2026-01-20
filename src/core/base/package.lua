local package = {

    -- @field _namespace string
    -- @field _modules   string[]
    -- @return table<Package>
    new = function(_namespace, _modules)

        -- @class table
        -- @field namespace string
        -- @field modules   string[]
        local _table = {namespace = _namespace, modules = _modules}

        -- @class table
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
                    -- @class table
                    local paths = {}

                    for index, value in ipairs(self.modules) do
                        paths[value] = string.format('%s.%s', self.namespace, value)
                    end
                    
                    return paths
                end,

                -- @return table<Module>
                load_modules = function(self)
                    -- @class table
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

    -- @field _modules table
    -- @field _import  string[]
    -- @return args|...
    -- @type   Module
    from = function(_modules, _import)
        -- @class table
        local modules = {}

        for key, value in pairs(_import) do
            table.insert(modules, _modules[value])
        end

        return table.unpack(modules)
    end
    
}

return package