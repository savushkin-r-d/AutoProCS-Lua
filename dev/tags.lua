--------------------------------------------------------------------------------
--- Метатаблица тега
local metaTag = {}
metaTag.__index = metaTag

--- Добавить счетчик для тега
--- ---
--- Используется для указания индексируемого тега:
--- { name = 'TAG' } => { name = 'TAG', count = n } <- .TAG[ 1 ] .. .TAG[ n ]
--- @param count integer количество индексов для тегов (начиная с 1)
--- @return table tag новая таблица с указаным количеством индексов
function metaTag:count(count)
    return setmetatable( { count = count }, { __index = self } )
end

--------------------------------------------------------------------------------
--- Метатаблица списка тегов
local metaTagTable = {}

--- Добавить новый тег в список
--- @param self table список тегов
--- @param key string ключ-название тега 
--- @param value table описание тега { description } 
metaTagTable.__newindex = function (self, key, value)
    value.name = key
    rawset(self, key, setmetatable( value, metaTag ))
end


--------------------------------------------------------------------------------
--- Таблица списка тегов
--- ---
--- <-- metaPropertiesTable
--- 
---  - name - название тега (можно не указывать: автоматически подставляется значение ключа)
---  - description - описание тега
local tag = setmetatable({}, metaTagTable)

tag.ST = {
    description = "Состояние"
}

tag.M = {
    description = "Ручной режим"
}

tag.V = {
    description = 'Аналоговое значение'
}

tag.P_CZ = {
    description = 'Сдвиг нуля'
}

tag.BLINK = {
    description = 'Индикация местонахождения устройства'
}

tag.NAMUR_ST = {
    description = 'Состояние по стандарту NAMUR'
}

tag.OPENED = {
    description = 'Открыт'
}

tag.CLOSED = {
    description = 'Закрыт'
}

tag.FB_OFF_ST = {
    description = 'Текущее состояние обратной связи (на отключенное состояние)'
}

tag.FB_ON_ST = {
    description = 'Текущее состояние обратной связи (на включенное состояние)'
}

tag.CS = {
    description = 'Сигнал управления'
}

tag.ERR = {
    description = 'Ошибка'
}

tag.T = {
    description = 'Температура'
}

tag.OK = {
    description = 'Проверка устройства'
}

tag.R = {
    description = 'Реверс (обычно мотор)'
}

tag.FRQ = {
    description = 'Частота (обычно мотор)'
}

tag.RPM = {
    description = 'Обороты в минуту (обычно мотор)'
}

tag.EST = {
    description = 'Расширенное состояние (обычно мотор)'
}

tag.CLEVEL = {
    description = 'Пересчитанный уровень (обычно в уровне)'
}

tag.L_BLUE = {
    description = 'Состояние голубой лампочки'
}

tag.L_RED = {
    description = 'Состояние красной лампочки'
}

tag.L_YELLOW = {
    description = 'Состояние желтой лампочки'
}

tag.L_GREEN = {
    description = 'Состояние зеленой лампочки'
}

tag.L_SIREN = {
    description = 'Состояние сирены'
}

tag.ABS_V = {
    description = 'Абсолютное значение'
}

tag.P_MIN_FLOW = {
    description = 'Минимальное значение потока'
}

tag.P_MAX_FLOW = {
    description = 'Максимальное значение потока'
}

tag.F = {
    description = 'Расход'
}

tag.ST_CH = {
    description = 'Состояние канала'
}

tag.NOMINAL_CURRENT_CH = {
    description = 'Заданный ток канала'
}

tag.LOAD_CURRENT_CH = {
    description = 'Текущий ток канала'
}

tag.ERR_CH = {
    description = 'Авария канала'
}

tag.Z = {
    description = 'Задание'
}

tag.RESULT = {
    description = 'Результат обработки'
}

tag.READY = {
    description = 'Готовность'
}


return tag