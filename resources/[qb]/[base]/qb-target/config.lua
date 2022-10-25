Config = {}

Config.TargetModels = {

    ['stripEffects'] = {
        models = `ba_prop_club_dimmer`,
        options = {
            {
                type = "client",
                event = "qb-stripclub:client:open:effect:panel",
                icon = "fas fa-hand-paper",
                label = "Effects Dimmer",
                job = "vanilla",

            },
        },
    }

}