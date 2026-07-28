local __package__ = require('src.core.base.package')
local __base__    = require('src.core.base.__init__')
local __wrapper__ = require('src.core.wrapper.__init__')
local __collections__ = require('src.core.collections.__init__')

-- local Case, Enum, Object  = __package__.from(__base__, {'Case', 'Enum', 'Object'})
-- local String, Number, Boolean = __package__.from(__wrapper__, {'String', 'Number', 'Boolean'})
local Array = __package__.from(__collections__, {'Array'})

-- local str  = String.new('Teste')
-- local num  = Number.new(10)
-- local bool = Boolean.new(true)
local arr1  = Array.new(5, {1, 2, 3, 4, 5})
-- local arr2  = Array.new(5, function() return String.new() end)

print(arr1:get('1'))
