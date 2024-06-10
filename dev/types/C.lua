local C = {
    name = 'C',
    description = 'Регулятор',
    subtypes = {},
}


C.subtypes = {
    [ 1 ] = {
        name = 'C_PID',
        description = 'Пид-регулятор',
        parameters = {
            Parameter.P_k:withDefaultValue(1),
            Parameter.P_Ti:withDefaultValue(15),
            Parameter.P_Td:withDefaultValue(0.01),
            Parameter.P_dt:withDefaultValue(1000),

            Parameter.P_max:withDefaultValue(100),
            Parameter.P_min:withDefaultValue(0),

            Parameter.P_acceleration_time:withDefaultValue(30),
            Parameter.P_is_manual_mode:withDefaultValue(0),
            Parameter.P_U_manual:withDefaultValue(65),

            Parameter.P_k:number(2):withDefaultValue(0),
            Parameter.P_Ti:number(2):withDefaultValue(0),
            Parameter.P_Td:number(2):withDefaultValue(0),

            Parameter.P_out_max:withDefaultValue(100),
            Parameter.P_out_min:withDefaultValue(0),

            Parameter.P_is_reverse:withDefaultValue(0),
            Parameter.P_is_zero_start:withDefaultValue(1),
        },
        properties = {
            Property.IN_VALUE,
            Property.OUT_VALUE,
        },
    },

    [ 2 ] = {
        name = 'C_THLD',
        description = 'Пороговый регулятор',
        parameters = {
            Parameter.P_is_reverse,
            Parameter.P_delta,
        },
        properties = {
            Property.IN_VALUE,
            Property.OUT_VALUE,
        },
        tags = {
            Tag.ST,
            Tag.M,
            Tag.V,
            Tag.Z,
            Parameter.P_is_reverse,
            Parameter.P_delta,
        }
    },
}

-- Теги для подтипа C_PID + все параметры этого подтипа заносим в теги
C.subtypes[1].tags = {
    Tag.ST,
    Tag.M,
    Tag.V,
    Tag.Z,
    table.unpack(C.subtypes[1].parameters)
}

return C