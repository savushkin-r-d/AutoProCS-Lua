--------------------------------------------------------------------------------
--- Метатаблица описания параметра
local metaParameter = {}
metaParameter.__index = metaParameter

--- Установка номера для параметра
--- ---
--- Используется при необходимости указания нескольких параметров в одноме устройстве:<br/>
--- { name = 'P' }:number(2) => { name = 'P2' }
--- @param number integer номер параметра
--- @return table parameter новая таблица с измененным именем
function metaParameter:number(number)
    return setmetatable( { name = self.name..number }, { __index = self } )
end

--- Добавление в таблицу значения по-умолчанию (новая таблица, доступ к описанию по _index)
--- { name, description } => { name, descption, defaultValue }
--- @param value number значение по-умолчанию
--- @return table parameter новая таблица со значением по-умолчанию
function metaParameter:withDefaultValue(value)
    return setmetatable( { defaultValue = value }, { __index = self } )
end


--------------------------------------------------------------------------------
--- Метатаблица списка параметров
local metaParameterTable = {}

--- Добавить новый параметр в список
--- @param self table список параметров
--- @param key string ключ-название параметра 
--- @param value table описание параметра { description, unit } 
metaParameterTable.__newindex = function (self, key, value)
    value.name = key
    rawset(self, key, setmetatable(value, metaParameter ))
end


--------------------------------------------------------------------------------
--- Таблица списка параметров
--- ---
--- <-- metaParametersTable
---
--- Используемые поля:
---  - name - название параметра (можно не указывать: автоматически подставляется значение ключа)
---  - description - описание параметра
---  - unit - формат единиц измерения (используется таблица Unit или задать в формате "{0} уе.")
---  - defaultValue - значение по-умолчанию (можно не указывать): <br/>
---    * при необходимости задается в конкретном устройстве методом :withDefaultValue(value): <br/>
---       Parameter.P_:withDefaultValue(2.0)
local parameter = setmetatable({}, metaParameterTable)

parameter.P_NOMINAL_W = {
    description = "Номинальная нагрузка",
    unit = Unit.Kilograms,
}

parameter.P_RKP = {
    description = "Рабочий коэффициент передачи",
    unit = Unit.RKP,
}

parameter.P_C0 = {
    description = "Сдвиг нуля"
}

parameter.P_DT = {
    description = "Время порогового фильтра",
    unit = Unit.Milliseconds,
}

parameter.P_ON_TIME = {
    description = "Время включения",
    unit = Unit.Milliseconds,
}

parameter.P_OFF_TIME = {
    description = "Время выключения",
    unit = Unit.Milliseconds,
}

parameter.P_FB = {
    description = "Обратная связь",
    unit = Unit.Boolean,
}

parameter.P_ERR = {
    description = "Аварийное значение"
}

parameter.P_MIN_V = {
    description = "Мин. значение"
}

parameter.P_MAX_V = {
    description = "Мак. значение"
}

parameter.P_MAX_P = {
    description = "Давление датчика",
    unit = Unit.Bars,
}

parameter.P_R = {
    description = "Радиус танка",
    unit = Unit.Meters,
}

parameter.P_H_CONE = {
    description = "Высота конической части танка",
    unit = Unit.Meters,
}

parameter.P_H_TRUNC = {
    description = "Высота усеченной части танка",
    unit = Unit.Meters,
}

parameter.P_MIN_F = {
    description = "Мин. значение для потока"
}

parameter.P_MAX_F = {
    description = "Макс. значение для потока"
}

parameter.P_k = {
    description = "Коэффициент усиления"
}

parameter.P_Ti = {
    description = "Время интегрирования"
}

parameter.P_Td = {
    description = "Время дифференцирования"
}

parameter.P_dt = {
    description = "Интервал расчета",
    unit = Unit.Milliseconds,
}

parameter.P_max = {
    description = "Макс. входное значение"
}

parameter.P_min = {
    description = "Мин. входное значение"
}

parameter.P_acceleration_time = {
    description = "Время выхода",
    unit = Unit.Seconds,
}

parameter.P_is_manual_mode = {
    description = "Ручной режим",
    unit = Unit.Boolean,
}

parameter.P_U_manual = {
    description = "Заданное ручное значение",
    unit = Unit.Percentages,
}

parameter.P_out_max = {
    description = "Макс. выходное значение"
}

parameter.P_out_min = {
    description = "Мин. выходное значение"
}

parameter.P_is_reverse = {
    description = "Выход обратного действия 100-0",
    unit = Unit.Boolean,
}

parameter.P_is_zero_start = {
    description = "Выход прямого действия 0-100",
    unit = Unit.Boolean
}

parameter.P_SHAFT_DIAMETER = {
    description = "Диаметр вала",
    unit = Unit.Meters,
}

parameter.P_TRANSFER_RATIO = {
    description = "Передаточное число"
}

parameter.P_READY_TIME = {
    description = "Предельное время отсутствия готовности к работе",
    unit = Unit.Seconds,
}

parameter.P_ERR_MIN_FLOW = {
    description = "Ошибка счета импульсов"
}

parameter.P_delta = {
    description = "Дельта срабатывания",
}

return parameter