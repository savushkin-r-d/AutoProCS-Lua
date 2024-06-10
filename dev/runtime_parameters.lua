--------------------------------------------------------------------------------
--- Метатаблица списка параметров времени выполнения
local metaRtParameterTable = {}

--- Добавить новый параметр в список
--- @param self table список параметров
--- @param key string ключ-название параметра 
--- @param value table описание параметра { description } 
metaRtParameterTable.__newindex = function (self, key, value)
    value.name = key
    rawset(self, key, value)
end


--------------------------------------------------------------------------------
--- Таблица списка параметров времени выполнения
--- ---
--- <-- metaPropertiesTable
---
--- Используемые поля:
---  - name - название параметра (можно не указывать: автоматически подставляется значение ключа)
---  - description - описание параметра
local rtParameter = setmetatable({}, metaRtParameterTable)

rtParameter.R_VTUG_NUMBER = {
    description = 'Номер клапана на пневмоострове',
}

rtParameter.R_VTUG_SIZE = {
    description = 'Размер области клапана для пневмоострова',
}

rtParameter.R_AS_NUMBER = {
    description = 'Номер клапана в AS-i',
}

rtParameter.R_CONST_RED = {
    description = 'Тип красного сигнала устройства при подаче на него сигнала DO. (Постоянный: 0 или мигающий: 1).',
}

rtParameter.R_ID_ON = {
    description = 'Номер клеммы пневмоострова для сигнала "Открыть"',
}

rtParameter.R_ID_UPPER_SEAT = {
    description = 'Номер клеммы пневмоострова для сигнала "Открыть верхнее седло"',
}

rtParameter.R_ID_LOWER_SEAT = {
    description = 'Номер клеммы пневмоострова для сигнала "Открыть нижнее седло"',
}


return rtParameter