local V = {
    name = 'V',
    description = 'Клапан',
    subtypes = {},
}

local TAG_ST_M = {
    Tag.ST,
    Tag.M,
}

local TAG_FB = {
    Tag.ST,
    Tag.M,
    Parameter.P_ON_TIME,
    Parameter.P_FB,
    Tag.FB_OFF_ST,
}

V.subtypes = {
    [ 1 ] = {
        name = 'V_DO1',
        description = 'Клапан с одним каналом управления',
        channels = {
            DO = {},
        },
        tags = TAG_ST_M,
    },

    [ 2 ] = {
        name = 'V_DO2',
        description = 'Клапан с двумя каналами управления',
        channels = {
            DO = { 'Открыт', 'Закрыт' },
        },
        tags = TAG_ST_M,
    },

    [ 3 ] = {
        name = 'V_DO1_DI1_FB_OFF',
        channels = {
            DI = {},
            DO = {},
        },
        parameters = {
            Parameter.P_ON_TIME,
            Parameter.P_FB,
        },
        tags = TAG_FB,
    },
}

return V