local __package__ = require('src.core.base.package')
local __base__    = require('src.core.base.__init__')
local __wrapper__ = require('src.core.wrapper.__init__')
local __collections__ = require('src.core.collections.__init__')

local Case, Enum, Object, Exception = __package__.from(__base__, {'Case', 'Enum', 'Object', 'Exception'})
local String, Number, Boolean = __package__.from(__wrapper__, {'String', 'Number', 'Boolean'})
local Array = __package__.from(__collections__, {'Array'})
