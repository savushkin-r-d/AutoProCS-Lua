--- C# формат единиц измерения.
--- вместо {0} подставляется значение для отображения
local unit = {
    Empty = "{0}";
    Boolean = "{0:Да;-;Нет}";
    Seconds = "{0} с";
    Milliseconds = "{0} мс";
    Meters = "{0} м";
    Kilograms = "{0} кг";
    Bars = "{0} бар";
    RKP = "{0} мВ/В";
    Percentages = "{0} %";
    DegreesCelsius = "{0} °C";
    CubicMeterPerHour = "{0} м3/ч";
}

return unit
