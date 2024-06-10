local VC = {
    name = 'VC',
    description = 'Управляемый Клапан',
    subtypes = {},
}

VC.subtypes = {

    [ 1 ] = {
        name = 'VC',
        description = 'Аналоговый клапан',
        channels = {
            AO = {},
        },
        tags = {
            Tag.ST,
            Tag.M,
            Tag.V,
        },
    },

    [ 2 ] = {
        name = 'VC_IOLINK',
        description = 'IO-Link аналоговый клапан',
        channels = {
            AO = {},
            AI = {},
        },
        tags = {
            Tag.ST,
            Tag.M,
            Tag.V,
            Tag.BLINK,
            Tag.NAMUR_ST,
            Tag.OPENED,
            Tag.CLOSED,
        },
    },

    [ 3 ] = {
        name = 'VC_VIRT',
        description = 'Виртуальный аналоговый клапан (без привязки к модулям)',
        tags = {
            Tag.ST,
            Tag.M,
            Tag.V,
        },
    },
}

return VC