package.path = table.concat({
    package.path,
    '../../../src/?.lua',
    '../../../../src/?.lua',
}, ';')


-- Preparar teste unitário de classe Boolean
local Boolean = require('orion.types.Boolean')

local bool1 = Boolean.new(true)
local bool2 = Boolean.new(false)

print(bool1:hash_code(), bool2:hash_code())