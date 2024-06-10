--------------------------------------------------------------------------------
--- Метатаблица списка параметров
local metaPropertyTable = {}

--- Добавить новое свойство в список
--- @param self table список свойств
--- @param key string ключ-название свойства 
--- @param value table описание свойства { description } 
metaPropertyTable.__newindex = function (self, key, value)
    value.name = key
    rawset(self, key, value)
end


--------------------------------------------------------------------------------
--- Таблица списка свойств
--- ---
--- <-- metaPropertiesTable
---
--- Используемые поля:
---  - name - название свойсва (можно не указывать: автоматически подставляется значение ключа)
---  - description - описание свойства
local property = setmetatable({}, metaPropertyTable)

property.MT = {
    description = 'Связанные моторы',
}

property.PT = {
    description = 'Датчик давления',
}

property.IN_VALUE = {
    description = 'Входное значение',
}

property.OUT_VALUE = {
    description = 'Выходное значение',
}

property.IP = {
    description = 'IP-адрес',
}

property.SIGNALS_SEQUENCE = {
    description = 'Последовательность сигналов',
}


return property