-- @class Object
local Object = setmetatable(
    {
        SCALAR_TYPES  = {'nil', 'boolean', 'number', 'string'},

        TABLE_TYPE    = {'table'},

        FUNCTION_TYPE = {'function'},

        META_METHODS  = {'__tostring'},

        MAGIC_METHODS = {'__construct'},

        STRATEGY = {
            INCLUDE = 'include',
            EXCLUDE = 'exclude'
        },

        STRUCTS = {
            SCALARS     = 'scalars',
            TABLES      = 'tables',
            MAGICS      = 'magics',
            METHODS     = 'methods',
            METAMETHODS = 'metamethods'
        },
    },
    {
        __index = {

            -- @param  table _template
            -- @return table
            -- @type   Object<T>
            create = function(self, _template)

                local struct_keys = self:struct_keys(_template)

                local class_load  = self:class_load(_template, struct_keys)

                return class_load
            end,

            -- @param  table _class_schema
            -- @return table
            -- @type   ClassLoader<T>
            class_load = function(self, _template, _struct_keys)

                local loader = {

                    new = function(...)
                        local args = {...}

                        local schema = self:class_schema(_template, _struct_keys)

                        schema:__construct(table.unpack(args))

                        return schema
                    end

                }

                return loader
            end,

            -- @param  table _template
            -- @param  table _struct_keys
            -- @return table
            -- @type   Class<T>
            class_schema = function(self, _template, _struct_keys)

                local _structs = self:schema_struct(_template, _struct_keys)

                local _scalars     = _structs[self.STRUCTS.SCALARS]
                local _tables      = _structs[self.STRUCTS.TABLES]
                local _magics      = _structs[self.STRUCTS.MAGICS]
                local _methods     = _structs[self.STRUCTS.METHODS]
                local _metamethods = _structs[self.STRUCTS.METAMETHODS]

                local _table_root = self:merge_structs(_scalars, _tables)
                local _meta_index = self:merge_structs(_magics, _methods)

                local _schema = self:build_schema(_table_root, _meta_index, _metamethods)

                return _schema
            end,

            -- @param  table _table_root
            -- @param  table _meta_index
            -- @param  table _metamethods
            -- @return table
            -- @type   Class<T>
            build_schema = function(self, _table_root, _meta_index, _metamethods)

                local _metatable = {
                    __index = _meta_index
                }

                for _key, _value in pairs(_metamethods) do
                    _metatable[_key] = _value
                end
                
                local schema = setmetatable(_table_root, _metatable)

                return schema
            end,

            -- @param  table _template
            -- @param  table _struct_keys
            -- @return table
            schema_struct = function(self, _template, _struct_keys)
                local schema = {}

                    schema[self.STRUCTS.SCALARS]     = self:pick_struct(_template, _struct_keys[self.STRUCTS.SCALARS])
                    schema[self.STRUCTS.TABLES]      = self:pick_struct(_template, _struct_keys[self.STRUCTS.TABLES])
                    schema[self.STRUCTS.MAGICS]      = self:pick_struct(_template, _struct_keys[self.STRUCTS.MAGICS])
                    schema[self.STRUCTS.METHODS]     = self:pick_struct(_template, _struct_keys[self.STRUCTS.METHODS])
                    schema[self.STRUCTS.METAMETHODS] = self:pick_struct(_template, _struct_keys[self.STRUCTS.METAMETHODS])

                return schema
            end,
            
            -- @param  table ...
            -- @return table
            merge_structs = function(self, ...)
                local struct_merged = {}

                local structs = {...}

                for _, struct in ipairs(structs) do
                    for _key, _value in pairs(struct) do
                        struct_merged[_key] = _value
                    end
                end

                return struct_merged
            end,

            -- @param  table _keys
            -- @param  table _template
            -- @return table
            pick_struct = function(self, _template, _keys)
                local struct = {}

                for _, _key in ipairs(_keys) do
                    struct[_key] = _template[_key]
                end

                return struct
            end,

            -- @param  table _template
            -- @return table
            struct_keys = function(self, _template)
                local keys = {}
                
                    keys[self.STRUCTS.SCALARS]     = self:scalar_keys(_template)
                    keys[self.STRUCTS.TABLES]      = self:table_keys(_template)
                    keys[self.STRUCTS.MAGICS]      = self:magic_keys(_template)
                    keys[self.STRUCTS.METHODS]     = self:method_keys(_template)
                    keys[self.STRUCTS.METAMETHODS] = self:metamethod_keys(_template)

                return keys
            end,

            -- @param  table _template
            -- @return table
            scalar_keys = function(self, _template)
                return self:filter_keys(_template, self.SCALAR_TYPES)
            end,

            -- @param  table _template
            -- @return table
            table_keys = function(self, _template)
                return self:filter_keys(_template, self.TABLE_TYPE)
            end,

            -- @param  table _template
            -- @return table
            magic_keys = function(self, _template)
                return self:filter_methods(self:filter_keys(_template, self.FUNCTION_TYPE), {self.MAGIC_METHODS}, self.STRATEGY.INCLUDE)
            end,

            -- @param  table _template
            -- @return table
            metamethod_keys = function(self, _template)
                return self:filter_methods(self:filter_keys(_template, self.FUNCTION_TYPE), {self.META_METHODS}, self.STRATEGY.INCLUDE)
            end,

            -- @param  table _template
            -- @return table
            method_keys = function(self, _template)
                return self:filter_methods(self:filter_keys(_template, self.FUNCTION_TYPE), {self.MAGIC_METHODS, self.META_METHODS}, self.STRATEGY.EXCLUDE)
            end,

            -- @param  table _template
            -- @param  table _types
            -- @return table
            filter_keys = function(self, _template, _types)
                local keys = {}

                for _, _type in ipairs(_types) do

                    for _key, _value in pairs(_template) do
                        if type(_value) == _type then table.insert(keys, _key) end
                    end
                    
                end
                
                return keys
            end,

            -- @param  table   _keys
            -- @param  table[] _methods
            -- @param  string  _strategy
            -- @return table
            filter_methods = function(self, _keys, _methods, _strategy)
                local keys = {}

                local methods = {}

                for _, _method in ipairs(_methods) do
                    for _, _value in ipairs(_method) do
                        table.insert(methods, _value)
                    end
                end

                if _strategy == self.STRATEGY.INCLUDE then

                    for _, _key in ipairs(_keys) do
                        for _, _method in ipairs(methods) do
                            if _key == _method then
                                table.insert(keys, _key)
                            end
                        end
                    end

                end

                if _strategy == self.STRATEGY.EXCLUDE then

                    for _, _key in ipairs(_keys) do

                        local _is_excluded = false

                        for _, _method in ipairs(methods) do
                            if _key == _method then
                                _is_excluded = true
                                break
                            end
                        end

                        if _is_excluded == false then
                            table.insert(keys, _key)
                        end
                    end

                end

                return keys
            end,

            -- @param  table _table
            -- @return string
            tostring = function(self, _table)
                local _metatable = getmetatable(_table)

                setmetatable(_table, nil)

                local output = string.format('%s --> %s --> %s', _table.__namespace, _table.__class, tostring(_table):match('0x%x+'))

                setmetatable(_table, _metatable)
                
                return output                
            end
        }
    }
)

return Object
