--- @diagnostic disable: undefined-doc-name, undefined-field

package.path =  './lua/dev/?.lua;' ..
                './lua/dev/types/?.lua;' ..
                package.path

local devices = require 'devices'


--- Инициализация спецификации устройств
--- @param devicesSpecificationBuilder DevicesSpecificationBuilder
function Init(devicesSpecificationBuilder)
    -- инициализация спецификации типов устройств
    for type_id, type in pairs(devices) do
        local typeBuilder = devicesSpecificationBuilder:AddType(type.name, type_id, type.description or '')
        -- Инициализация спецификации подтипов
        for subtype_id, subtype in pairs(type.subtypes) do
            local subtypeBuilder = typeBuilder:AddSubtype(subtype.name, subtype_id, subtype.description or '')

            -- Инициализация спецификации параметров           
            for _, parameter in ipairs(subtype.parameters or {}) do
                subtypeBuilder:AddParameter(
                    devicesSpecificationBuilder:FindOrAddParameter(
                        parameter.name,
                        parameter.description or '',
                        parameter.unit or Unit.Empty,
                        parameter.defaultValue or nil))
            end

            -- Инициализация параметров времени выполнения
            for _, rt_parameter in ipairs(subtype.rt_paramters or {}) do
                subtypeBuilder:AddRtParamter(
                    devicesSpecificationBuilder:FindOrAddRtParameter(
                        rt_parameter.name,
                        rt_parameter.describing or ''))
            end

            -- Инициализация спецификации свойств
            for _, property in ipairs(subtype.properties or {}) do
                subtypeBuilder:AddProperty(
                    devicesSpecificationBuilder:FindOrAddProperty(
                        property.name,
                        property.description or ''))
            end

            -- Инициализация спецификации тегов
            for _, tag in pairs(subtype.tags or {}) do
                subtypeBuilder:AddTag(
                    devicesSpecificationBuilder:FindOrAddTag(
                        tag.name,
                        tag.description or '',
                        tag.count or 1))
            end

            -- Инициализация спецификации каналов ввода-вывода
            for channel_type, channels in pairs(subtype.channels or {}) do
                if not next(channels) then
                    subtypeBuilder:AddChannel(
                        devicesSpecificationBuilder:FindOrAddChannel(
                            channel_type,
                            ''));
                else
                    for _, comment in ipairs(channels) do
                        subtypeBuilder:AddChannel(
                            devicesSpecificationBuilder:FindOrAddChannel(
                                channel_type,
                                comment ));
                    end
                end
            end
        end
    end
end