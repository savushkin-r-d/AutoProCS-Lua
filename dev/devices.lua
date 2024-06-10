Unit = require 'unit_format'
Parameter = require 'parameters'
Property = require 'properties'
RtParameter = require 'runtime_parameters'
Tag = require 'tags'

--- Типы устройств <br/>
--- key - номер типа <br/>
--- value - таблица с описанием типа (описываются в отдельном файле и подключаются как модуль)
local devices = {
    [ 0 ] = require 'V',
    [ 1 ] = require 'VC',
    [ 20 ] = require 'C',
}

return devices