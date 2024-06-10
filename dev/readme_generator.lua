package.path =  './?.lua;' ..
                './types/?.lua;' ..
                package.path

local devices = require 'devices'

--- Сортировка таблицы
--- @param tbl table исхоная таблица
--- @param  sorting? function функция сортировки, по-умолчанию по полю .name
--- @return table sorted_table отсортированая таблица
local function toSortedTable(tbl, sorting)
    sorting = sorting or function (f, s) return f.name < s.name end
    local sorted_table = {}
    for _, parameter in pairs(tbl) do
        table.insert(sorted_table, parameter)
    end
    table.sort(sorted_table, sorting)
    return sorted_table
end


--- Генерация дерева всех устройства и их подтипов со ссылками на таблицу описания
--- @return string result md список типов и подтипов устройств
local function generateDevicesTree()
    local res = ''

    for _, type in pairs(devices) do
        res = res .. ('- **%s** - %s <sup>[[LUA](./types/%s.lua)]</sup>\n'):format(type.name, type.description or '', type.name)
        for _, subtype in pairs(type.subtypes or {}) do
            res = res .. ('  - [%s](#%s) - %s\n'):format(subtype.name, subtype.name, subtype.description or '')
        end
    end

    return res
end


--- Генерация html таблицы спецификаций (все параметры, свойства, ...)
--- @param specs table таблица спецификаций
--- @param ... table { field - поле спецификаций, header - заголовок, gsubs - {str, str} замены :gsub }
--- @return string result html-таблица
local function generateSpecsTable(specs, ...)
    local res =
        '<table>\n' ..
        '  <tr>'
    for _, arg in ipairs({...}) do
        res = res .. (' <th>%s</th>'):format(arg.header)
    end
    res = res .. ' </tr>\n'
    for _, spec in pairs(toSortedTable(specs)) do
        res = res .. '  <tr>'
        for _, arg in ipairs({...}) do
            local val = (' <td>%s</td>'):format((spec[arg.field] or ''))
            for _, gs in ipairs(arg.gsubs or {}) do
                val = val:gsub(gs[1], gs[2])
            end
            res = res .. val
        end
        res = res .. ' </tr>\n'
    end
    res = res .. '</table>\n'
    return res
end


--- Генерация таблиц с описанием всех подтипов
--- @return string result html-таблица
local function generateDevicesTables()
    local res = ''

    for _, type in pairs(devices) do
        res = res .. ('- %s\n'):format(type.name)
        for _, subtype in pairs(type.subtypes or {}) do
            res = res .. ('  * <table id=%s>\n'):format(subtype.name) ..
                ('      <tr> <th> <code>%s</code> - %s </th> </tr>\n')
                    :format(subtype.name, subtype.description or '')
            if subtype.channels ~= nil then
                res =res ..
                    '      <tr>\n' ..
                    '        <td>\n' ..
                    '          <b><i>Каналы ввода-вывода:</i></b>\n' ..
                    '          <ul>\n'
                for channel_type, comments in pairs(subtype.channels) do
                    if #comments > 0 then
                        for _, comment in ipairs(comments) do
                            res = res .. ('            <li> <code>%s</code> [ %s ] </li>\n')
                                :format(channel_type, comment)
                        end
                    else
                        res = res .. ('            <li> <code>%s</code> </li>\n')
                            :format(channel_type)
                    end
                end
                res = res ..
                    '          </ul>\n' ..
                    '        </td>\n' ..
                    '      </tr>\n'
            end

            if subtype.parameters ~= nil then
                res = res ..
                    '      <tr>\n' ..
                    '        <td>\n' ..
                    '          <table>\n' ..
                    '            <tr> <th colspan=3><a href=#параметры><b><i>Параметры</i></b></a></th> </tr>\n'
                for _, parameter in ipairs(subtype.parameters) do
                    res = res ..
                        '            <tr>' ..
                        (' <td><code>%s</code>%s</td>'):format(parameter.name, parameter.defaultValue and ' = '..parameter.defaultValue or '') ..
                        (' <td>%s</td><td>%s</td'):format(parameter.description or '', parameter.unit and parameter.unit:gsub('{0} ', ''):gsub('{0:Да;%-;Нет}', '(да/нет)') or '') ..
                        ' </tr>\n'
                end
                res = res ..
                    '          </table>\n' ..
                    '        </td>\n' ..
                    '      </tr>\n'
            end

            for _, specs in pairs( {
                { header = "Свойства", href = "свойства", data = subtype.properties },
                { header = "Рабочие параметры", href = "рабочие-параметры", data = subtype.rtParameters },
                { header = "Теги", href = "теги", data = subtype.tags },
            } ) do
                if specs.data ~= nil then
                    res = res ..
                        '      <tr>\n' ..
                        '        <td>\n' ..
                        '          <table>\n' ..
                        ('            <tr> <th colspan=2><a href=#%s><b><i>%s</i></b></a></th> </tr>\n'):format(specs.href, specs.header)
                    for _, spec in ipairs(specs.data) do
                        res = res .. ('            <tr> <td><code>%s</code></td> <td>%s</td> </tr>\n')
                            :format(spec.name, spec.description or '')
                    end
                    res = res ..
                        '          </table>\n' ..
                        '        </td>\n' ..
                        '      </tr>\n'
                end
            end
            res = res .. '    </table>\n\n'
        end
    end

    return res
end


--------------------------------------------------------------------------------
--- Шаблон 'readme.md' файла для описания устройств
--------------------------------------------------------------------------------
local readme = io.open('readme.md', 'w')
if (readme == nil) then
    return
end

readme:write(
    '# Устройства\n' ..
    '\n' ..
    'Все подтипы устройств описываются в каталоге [dev/types/](./types/).\n' ..
    'Пример [описания устройства](./types/readme.md).\n' ..
    '\n' ..
    'Список всех типов и подтипов устройств:\n' ..
    '\n' ..
    generateDevicesTree() ..
    '\n' ..
    'Списки всех используемых параметров и свойств:\n' ..
    '- [Параметры](#параметры) <sup>[[LUA](./parameters.lua)]</sup>\n' ..
    '- [Рабочие параметры](#рабочие-параметры) <sup>[[LUA](./runtime_parameters.lua)]</sup>\n' ..
    '- [Свойства](#свойства) <sup>[[LUA](./properties.lua)]</sup>\n' ..
    '- [Теги](#теги) <sup>[[LUA](./tags.lua)]</sup>\n' ..
    '\n' ..
    '## Описание устройств\n' ..
    '\n' ..
    generateDevicesTables() ..
    '\n' ..
    '\n' ..
    '## Параметры\n' ..
    generateSpecsTable(Parameter,
        { field = 'name', header = 'Название' },
        { field = 'description', header = 'Описание' },
        { field = 'unit', header = 'Единицы измерения', gsubs = {
            { '{0} ', '' },
            { '{0:Да;%-;Нет}', 'да / нет' }
        }}) ..
    '\n' ..
    '\n' ..
    '## Рабочие параметры\n' ..
    generateSpecsTable(RtParameter,
        { field = 'name', header = 'Название' },
        { field = 'description', header = 'Описание' }) ..
    '\n' ..
    '\n' ..
    '## Свойства\n' ..
    generateSpecsTable(Property,
        { field = 'name', header = 'Название' },
        { field = 'description', header = 'Описание' }) ..
    '\n' ..
    '\n' ..
    '## Теги\n' ..
    generateSpecsTable(Tag,
        { field = 'name', header = 'Название' },
        { field = 'description', header = 'Описание' })
)
--------------------------------------------------------------------------------

