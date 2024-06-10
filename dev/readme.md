# Устройства

Все подтипы устройств описываются в каталоге [dev/types/](./types/).
Пример [описания устройства](./types/readme.md).

Список всех типов и подтипов устройств:

- **V** - Клапан <sup>[[LUA](./types/V.lua)]</sup>
  - [V_DO1](#V_DO1) - Клапан с одним каналом управления
  - [V_DO2](#V_DO2) - Клапан с двумя каналами управления
  - [V_DO1_DI1_FB_OFF](#V_DO1_DI1_FB_OFF) - 
- **VC** - Управляемый Клапан <sup>[[LUA](./types/VC.lua)]</sup>
  - [VC](#VC) - Аналоговый клапан
  - [VC_IOLINK](#VC_IOLINK) - IO-Link аналоговый клапан
  - [VC_VIRT](#VC_VIRT) - Виртуальный аналоговый клапан (без привязки к модулям)
- **C** - Регулятор <sup>[[LUA](./types/C.lua)]</sup>
  - [C_THLD](#C_THLD) - Пороговый регулятор
  - [C_PID](#C_PID) - Пид-регулятор

Списки всех используемых параметров и свойств:
- [Параметры](#параметры) <sup>[[LUA](./parameters.lua)]</sup>
- [Рабочие параметры](#рабочие-параметры) <sup>[[LUA](./runtime_parameters.lua)]</sup>
- [Свойства](#свойства) <sup>[[LUA](./properties.lua)]</sup>
- [Теги](#теги) <sup>[[LUA](./tags.lua)]</sup>

## Описание устройств

- V
  * <table id=V_DO1>
      <tr> <th> <code>V_DO1</code> - Клапан с одним каналом управления </th> </tr>
      <tr>
        <td>
          <b><i>Каналы ввода-вывода:</i></b>
          <ul>
            <li> <code>DO</code> </li>
          </ul>
        </td>
      </tr>
      <tr>
        <td>
          <table>
            <tr> <th colspan=2><a href=#теги><b><i>Теги</i></b></a></th> </tr>
            <tr> <td><code>ST</code></td> <td>Состояние</td> </tr>
            <tr> <td><code>M</code></td> <td>Ручной режим</td> </tr>
          </table>
        </td>
      </tr>
    </table>

  * <table id=V_DO2>
      <tr> <th> <code>V_DO2</code> - Клапан с двумя каналами управления </th> </tr>
      <tr>
        <td>
          <b><i>Каналы ввода-вывода:</i></b>
          <ul>
            <li> <code>DO</code> [ Открыт ] </li>
            <li> <code>DO</code> [ Закрыт ] </li>
          </ul>
        </td>
      </tr>
      <tr>
        <td>
          <table>
            <tr> <th colspan=2><a href=#теги><b><i>Теги</i></b></a></th> </tr>
            <tr> <td><code>ST</code></td> <td>Состояние</td> </tr>
            <tr> <td><code>M</code></td> <td>Ручной режим</td> </tr>
          </table>
        </td>
      </tr>
    </table>

  * <table id=V_DO1_DI1_FB_OFF>
      <tr> <th> <code>V_DO1_DI1_FB_OFF</code> -  </th> </tr>
      <tr>
        <td>
          <b><i>Каналы ввода-вывода:</i></b>
          <ul>
            <li> <code>DO</code> </li>
            <li> <code>DI</code> </li>
          </ul>
        </td>
      </tr>
      <tr>
        <td>
          <table>
            <tr> <th colspan=3><a href=#параметры><b><i>Параметры</i></b></a></th> </tr>
            <tr> <td><code>P_ON_TIME</code></td> <td>Время включения</td><td>мс</td </tr>
            <tr> <td><code>P_FB</code></td> <td>Обратная связь</td><td>(да/нет)</td </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td>
          <table>
            <tr> <th colspan=2><a href=#теги><b><i>Теги</i></b></a></th> </tr>
            <tr> <td><code>ST</code></td> <td>Состояние</td> </tr>
            <tr> <td><code>M</code></td> <td>Ручной режим</td> </tr>
            <tr> <td><code>P_ON_TIME</code></td> <td>Время включения</td> </tr>
            <tr> <td><code>P_FB</code></td> <td>Обратная связь</td> </tr>
            <tr> <td><code>FB_OFF_ST</code></td> <td>Текущее состояние обратной связи (на отключенное состояние)</td> </tr>
          </table>
        </td>
      </tr>
    </table>

- VC
  * <table id=VC>
      <tr> <th> <code>VC</code> - Аналоговый клапан </th> </tr>
      <tr>
        <td>
          <b><i>Каналы ввода-вывода:</i></b>
          <ul>
            <li> <code>AO</code> </li>
          </ul>
        </td>
      </tr>
      <tr>
        <td>
          <table>
            <tr> <th colspan=2><a href=#теги><b><i>Теги</i></b></a></th> </tr>
            <tr> <td><code>ST</code></td> <td>Состояние</td> </tr>
            <tr> <td><code>M</code></td> <td>Ручной режим</td> </tr>
            <tr> <td><code>V</code></td> <td>Аналоговое значение</td> </tr>
          </table>
        </td>
      </tr>
    </table>

  * <table id=VC_IOLINK>
      <tr> <th> <code>VC_IOLINK</code> - IO-Link аналоговый клапан </th> </tr>
      <tr>
        <td>
          <b><i>Каналы ввода-вывода:</i></b>
          <ul>
            <li> <code>AI</code> </li>
            <li> <code>AO</code> </li>
          </ul>
        </td>
      </tr>
      <tr>
        <td>
          <table>
            <tr> <th colspan=2><a href=#теги><b><i>Теги</i></b></a></th> </tr>
            <tr> <td><code>ST</code></td> <td>Состояние</td> </tr>
            <tr> <td><code>M</code></td> <td>Ручной режим</td> </tr>
            <tr> <td><code>V</code></td> <td>Аналоговое значение</td> </tr>
            <tr> <td><code>BLINK</code></td> <td>Индикация местонахождения устройства</td> </tr>
            <tr> <td><code>NAMUR_ST</code></td> <td>Состояние по стандарту NAMUR</td> </tr>
            <tr> <td><code>OPENED</code></td> <td>Открыт</td> </tr>
            <tr> <td><code>CLOSED</code></td> <td>Закрыт</td> </tr>
          </table>
        </td>
      </tr>
    </table>

  * <table id=VC_VIRT>
      <tr> <th> <code>VC_VIRT</code> - Виртуальный аналоговый клапан (без привязки к модулям) </th> </tr>
      <tr>
        <td>
          <table>
            <tr> <th colspan=2><a href=#теги><b><i>Теги</i></b></a></th> </tr>
            <tr> <td><code>ST</code></td> <td>Состояние</td> </tr>
            <tr> <td><code>M</code></td> <td>Ручной режим</td> </tr>
            <tr> <td><code>V</code></td> <td>Аналоговое значение</td> </tr>
          </table>
        </td>
      </tr>
    </table>

- C
  * <table id=C_THLD>
      <tr> <th> <code>C_THLD</code> - Пороговый регулятор </th> </tr>
      <tr>
        <td>
          <table>
            <tr> <th colspan=3><a href=#параметры><b><i>Параметры</i></b></a></th> </tr>
            <tr> <td><code>P_is_reverse</code></td> <td>Выход обратного действия 100-0</td><td>(да/нет)</td </tr>
            <tr> <td><code>P_delta</code></td> <td>Дельта срабатывания</td><td></td </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td>
          <table>
            <tr> <th colspan=2><a href=#свойства><b><i>Свойства</i></b></a></th> </tr>
            <tr> <td><code>IN_VALUE</code></td> <td>Входное значение</td> </tr>
            <tr> <td><code>OUT_VALUE</code></td> <td>Выходное значение</td> </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td>
          <table>
            <tr> <th colspan=2><a href=#теги><b><i>Теги</i></b></a></th> </tr>
            <tr> <td><code>ST</code></td> <td>Состояние</td> </tr>
            <tr> <td><code>M</code></td> <td>Ручной режим</td> </tr>
            <tr> <td><code>V</code></td> <td>Аналоговое значение</td> </tr>
            <tr> <td><code>Z</code></td> <td>Задание</td> </tr>
            <tr> <td><code>P_is_reverse</code></td> <td>Выход обратного действия 100-0</td> </tr>
            <tr> <td><code>P_delta</code></td> <td>Дельта срабатывания</td> </tr>
          </table>
        </td>
      </tr>
    </table>

  * <table id=C_PID>
      <tr> <th> <code>C_PID</code> - Пид-регулятор </th> </tr>
      <tr>
        <td>
          <table>
            <tr> <th colspan=3><a href=#параметры><b><i>Параметры</i></b></a></th> </tr>
            <tr> <td><code>P_k</code> = 1</td> <td>Коэффициент усиления</td><td></td </tr>
            <tr> <td><code>P_Ti</code> = 15</td> <td>Время интегрирования</td><td></td </tr>
            <tr> <td><code>P_Td</code> = 0.01</td> <td>Время дифференцирования</td><td></td </tr>
            <tr> <td><code>P_dt</code> = 1000</td> <td>Интервал расчета</td><td>мс</td </tr>
            <tr> <td><code>P_max</code> = 100</td> <td>Макс. входное значение</td><td></td </tr>
            <tr> <td><code>P_min</code> = 0</td> <td>Мин. входное значение</td><td></td </tr>
            <tr> <td><code>P_acceleration_time</code> = 30</td> <td>Время выхода</td><td>с</td </tr>
            <tr> <td><code>P_is_manual_mode</code> = 0</td> <td>Ручной режим</td><td>(да/нет)</td </tr>
            <tr> <td><code>P_U_manual</code> = 65</td> <td>Заданное ручное значение</td><td>%</td </tr>
            <tr> <td><code>P_k2</code> = 0</td> <td>Коэффициент усиления</td><td></td </tr>
            <tr> <td><code>P_Ti2</code> = 0</td> <td>Время интегрирования</td><td></td </tr>
            <tr> <td><code>P_Td2</code> = 0</td> <td>Время дифференцирования</td><td></td </tr>
            <tr> <td><code>P_out_max</code> = 100</td> <td>Макс. выходное значение</td><td></td </tr>
            <tr> <td><code>P_out_min</code> = 0</td> <td>Мин. выходное значение</td><td></td </tr>
            <tr> <td><code>P_is_reverse</code> = 0</td> <td>Выход обратного действия 100-0</td><td>(да/нет)</td </tr>
            <tr> <td><code>P_is_zero_start</code> = 1</td> <td>Выход прямого действия 0-100</td><td>(да/нет)</td </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td>
          <table>
            <tr> <th colspan=2><a href=#свойства><b><i>Свойства</i></b></a></th> </tr>
            <tr> <td><code>IN_VALUE</code></td> <td>Входное значение</td> </tr>
            <tr> <td><code>OUT_VALUE</code></td> <td>Выходное значение</td> </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td>
          <table>
            <tr> <th colspan=2><a href=#теги><b><i>Теги</i></b></a></th> </tr>
            <tr> <td><code>ST</code></td> <td>Состояние</td> </tr>
            <tr> <td><code>M</code></td> <td>Ручной режим</td> </tr>
            <tr> <td><code>V</code></td> <td>Аналоговое значение</td> </tr>
            <tr> <td><code>Z</code></td> <td>Задание</td> </tr>
            <tr> <td><code>P_k</code></td> <td>Коэффициент усиления</td> </tr>
            <tr> <td><code>P_Ti</code></td> <td>Время интегрирования</td> </tr>
            <tr> <td><code>P_Td</code></td> <td>Время дифференцирования</td> </tr>
            <tr> <td><code>P_dt</code></td> <td>Интервал расчета</td> </tr>
            <tr> <td><code>P_max</code></td> <td>Макс. входное значение</td> </tr>
            <tr> <td><code>P_min</code></td> <td>Мин. входное значение</td> </tr>
            <tr> <td><code>P_acceleration_time</code></td> <td>Время выхода</td> </tr>
            <tr> <td><code>P_is_manual_mode</code></td> <td>Ручной режим</td> </tr>
            <tr> <td><code>P_U_manual</code></td> <td>Заданное ручное значение</td> </tr>
            <tr> <td><code>P_k2</code></td> <td>Коэффициент усиления</td> </tr>
            <tr> <td><code>P_Ti2</code></td> <td>Время интегрирования</td> </tr>
            <tr> <td><code>P_Td2</code></td> <td>Время дифференцирования</td> </tr>
            <tr> <td><code>P_out_max</code></td> <td>Макс. выходное значение</td> </tr>
            <tr> <td><code>P_out_min</code></td> <td>Мин. выходное значение</td> </tr>
            <tr> <td><code>P_is_reverse</code></td> <td>Выход обратного действия 100-0</td> </tr>
            <tr> <td><code>P_is_zero_start</code></td> <td>Выход прямого действия 0-100</td> </tr>
          </table>
        </td>
      </tr>
    </table>



## Параметры
<table>
  <tr> <th>Название</th> <th>Описание</th> <th>Единицы измерения</th> </tr>
  <tr> <td>P_C0</td> <td>Сдвиг нуля</td> <td></td> </tr>
  <tr> <td>P_DT</td> <td>Время порогового фильтра</td> <td>мс</td> </tr>
  <tr> <td>P_ERR</td> <td>Аварийное значение</td> <td></td> </tr>
  <tr> <td>P_ERR_MIN_FLOW</td> <td>Ошибка счета импульсов</td> <td></td> </tr>
  <tr> <td>P_FB</td> <td>Обратная связь</td> <td>да / нет</td> </tr>
  <tr> <td>P_H_CONE</td> <td>Высота конической части танка</td> <td>м</td> </tr>
  <tr> <td>P_H_TRUNC</td> <td>Высота усеченной части танка</td> <td>м</td> </tr>
  <tr> <td>P_MAX_F</td> <td>Макс. значение для потока</td> <td></td> </tr>
  <tr> <td>P_MAX_P</td> <td>Давление датчика</td> <td>бар</td> </tr>
  <tr> <td>P_MAX_V</td> <td>Мак. значение</td> <td></td> </tr>
  <tr> <td>P_MIN_F</td> <td>Мин. значение для потока</td> <td></td> </tr>
  <tr> <td>P_MIN_V</td> <td>Мин. значение</td> <td></td> </tr>
  <tr> <td>P_NOMINAL_W</td> <td>Номинальная нагрузка</td> <td>кг</td> </tr>
  <tr> <td>P_OFF_TIME</td> <td>Время выключения</td> <td>мс</td> </tr>
  <tr> <td>P_ON_TIME</td> <td>Время включения</td> <td>мс</td> </tr>
  <tr> <td>P_R</td> <td>Радиус танка</td> <td>м</td> </tr>
  <tr> <td>P_READY_TIME</td> <td>Предельное время отсутствия готовности к работе</td> <td>с</td> </tr>
  <tr> <td>P_RKP</td> <td>Рабочий коэффициент передачи</td> <td>мВ/В</td> </tr>
  <tr> <td>P_SHAFT_DIAMETER</td> <td>Диаметр вала</td> <td>м</td> </tr>
  <tr> <td>P_TRANSFER_RATIO</td> <td>Передаточное число</td> <td></td> </tr>
  <tr> <td>P_Td</td> <td>Время дифференцирования</td> <td></td> </tr>
  <tr> <td>P_Ti</td> <td>Время интегрирования</td> <td></td> </tr>
  <tr> <td>P_U_manual</td> <td>Заданное ручное значение</td> <td>%</td> </tr>
  <tr> <td>P_acceleration_time</td> <td>Время выхода</td> <td>с</td> </tr>
  <tr> <td>P_delta</td> <td>Дельта срабатывания</td> <td></td> </tr>
  <tr> <td>P_dt</td> <td>Интервал расчета</td> <td>мс</td> </tr>
  <tr> <td>P_is_manual_mode</td> <td>Ручной режим</td> <td>да / нет</td> </tr>
  <tr> <td>P_is_reverse</td> <td>Выход обратного действия 100-0</td> <td>да / нет</td> </tr>
  <tr> <td>P_is_zero_start</td> <td>Выход прямого действия 0-100</td> <td>да / нет</td> </tr>
  <tr> <td>P_k</td> <td>Коэффициент усиления</td> <td></td> </tr>
  <tr> <td>P_max</td> <td>Макс. входное значение</td> <td></td> </tr>
  <tr> <td>P_min</td> <td>Мин. входное значение</td> <td></td> </tr>
  <tr> <td>P_out_max</td> <td>Макс. выходное значение</td> <td></td> </tr>
  <tr> <td>P_out_min</td> <td>Мин. выходное значение</td> <td></td> </tr>
</table>


## Рабочие параметры
<table>
  <tr> <th>Название</th> <th>Описание</th> </tr>
  <tr> <td>R_AS_NUMBER</td> <td>Номер клапана в AS-i</td> </tr>
  <tr> <td>R_CONST_RED</td> <td>Тип красного сигнала устройства при подаче на него сигнала DO. (Постоянный: 0 или мигающий: 1).</td> </tr>
  <tr> <td>R_ID_LOWER_SEAT</td> <td>Номер клеммы пневмоострова для сигнала "Открыть нижнее седло"</td> </tr>
  <tr> <td>R_ID_ON</td> <td>Номер клеммы пневмоострова для сигнала "Открыть"</td> </tr>
  <tr> <td>R_ID_UPPER_SEAT</td> <td>Номер клеммы пневмоострова для сигнала "Открыть верхнее седло"</td> </tr>
  <tr> <td>R_VTUG_NUMBER</td> <td>Номер клапана на пневмоострове</td> </tr>
  <tr> <td>R_VTUG_SIZE</td> <td>Размер области клапана для пневмоострова</td> </tr>
</table>


## Свойства
<table>
  <tr> <th>Название</th> <th>Описание</th> </tr>
  <tr> <td>IN_VALUE</td> <td>Входное значение</td> </tr>
  <tr> <td>IP</td> <td>IP-адрес</td> </tr>
  <tr> <td>MT</td> <td>Связанные моторы</td> </tr>
  <tr> <td>OUT_VALUE</td> <td>Выходное значение</td> </tr>
  <tr> <td>PT</td> <td>Датчик давления</td> </tr>
  <tr> <td>SIGNALS_SEQUENCE</td> <td>Последовательность сигналов</td> </tr>
</table>


## Теги
<table>
  <tr> <th>Название</th> <th>Описание</th> </tr>
  <tr> <td>ABS_V</td> <td>Абсолютное значение</td> </tr>
  <tr> <td>BLINK</td> <td>Индикация местонахождения устройства</td> </tr>
  <tr> <td>CLEVEL</td> <td>Пересчитанный уровень (обычно в уровне)</td> </tr>
  <tr> <td>CLOSED</td> <td>Закрыт</td> </tr>
  <tr> <td>CS</td> <td>Сигнал управления</td> </tr>
  <tr> <td>ERR</td> <td>Ошибка</td> </tr>
  <tr> <td>ERR_CH</td> <td>Авария канала</td> </tr>
  <tr> <td>EST</td> <td>Расширенное состояние (обычно мотор)</td> </tr>
  <tr> <td>F</td> <td>Расход</td> </tr>
  <tr> <td>FB_OFF_ST</td> <td>Текущее состояние обратной связи (на отключенное состояние)</td> </tr>
  <tr> <td>FB_ON_ST</td> <td>Текущее состояние обратной связи (на включенное состояние)</td> </tr>
  <tr> <td>FRQ</td> <td>Частота (обычно мотор)</td> </tr>
  <tr> <td>LOAD_CURRENT_CH</td> <td>Текущий ток канала</td> </tr>
  <tr> <td>L_BLUE</td> <td>Состояние голубой лампочки</td> </tr>
  <tr> <td>L_GREEN</td> <td>Состояние зеленой лампочки</td> </tr>
  <tr> <td>L_RED</td> <td>Состояние красной лампочки</td> </tr>
  <tr> <td>L_SIREN</td> <td>Состояние сирены</td> </tr>
  <tr> <td>L_YELLOW</td> <td>Состояние желтой лампочки</td> </tr>
  <tr> <td>M</td> <td>Ручной режим</td> </tr>
  <tr> <td>NAMUR_ST</td> <td>Состояние по стандарту NAMUR</td> </tr>
  <tr> <td>NOMINAL_CURRENT_CH</td> <td>Заданный ток канала</td> </tr>
  <tr> <td>OK</td> <td>Проверка устройства</td> </tr>
  <tr> <td>OPENED</td> <td>Открыт</td> </tr>
  <tr> <td>P_CZ</td> <td>Сдвиг нуля</td> </tr>
  <tr> <td>P_MAX_FLOW</td> <td>Максимальное значение потока</td> </tr>
  <tr> <td>P_MIN_FLOW</td> <td>Минимальное значение потока</td> </tr>
  <tr> <td>R</td> <td>Реверс (обычно мотор)</td> </tr>
  <tr> <td>READY</td> <td>Готовность</td> </tr>
  <tr> <td>RESULT</td> <td>Результат обработки</td> </tr>
  <tr> <td>RPM</td> <td>Обороты в минуту (обычно мотор)</td> </tr>
  <tr> <td>ST</td> <td>Состояние</td> </tr>
  <tr> <td>ST_CH</td> <td>Состояние канала</td> </tr>
  <tr> <td>T</td> <td>Температура</td> </tr>
  <tr> <td>V</td> <td>Аналоговое значение</td> </tr>
  <tr> <td>Z</td> <td>Задание</td> </tr>
</table>
