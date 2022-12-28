--██╗  ██╗███████╗██╗   ██╗███████╗     █████╗ ███╗   ██╗██████╗      ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗
--██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔════╝    ██╔══██╗████╗  ██║██╔══██╗    ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝
--█████╔╝ █████╗   ╚████╔╝ ███████╗    ███████║██╔██╗ ██║██║  ██║    ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗
--██╔═██╗ ██╔══╝    ╚██╔╝  ╚════██║    ██╔══██║██║╚██╗██║██║  ██║    ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║
--██║  ██╗███████╗   ██║   ███████║    ██║  ██║██║ ╚████║██████╔╝    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║
--╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝    ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝      ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝


CreateThread(function()
    if Config.Control.ENABLE then
        RegisterKeyMapping(Config.Control.command, Config.Control.description, 'keyboard', Config.Control.key)
        TriggerEvent('chat:addSuggestion', '/'..Config.Control.command, Config.Control.description)
        RegisterCommand(Config.Control.command, function()
            TriggerEvent('cdev:Control')
        end)
    end

    if Config.ControlRight.ENABLE then
        RegisterKeyMapping(Config.ControlRight.command, Config.ControlRight.description, 'keyboard', Config.ControlRight.key)
        TriggerEvent('chat:addSuggestion', '/'..Config.ControlRight.command, Config.ControlRight.description)
        RegisterCommand(Config.ControlRight.command, function()
            TriggerEvent('cdev:ControlRight')
        end)
    end

    if Config.ControlLeft.ENABLE then
        RegisterKeyMapping(Config.ControlLeft.command, Config.ControlLeft.description, 'keyboard', Config.ControlLeft.key)
        TriggerEvent('chat:addSuggestion', '/'..Config.ControlLeft.command, Config.ControlLeft.description)
        RegisterCommand(Config.ControlLeft.command, function()
            TriggerEvent('cdev:ControlLeft')
        end)
    end
    
    if Config.EmoteCancel.ENABLE then
        RegisterKeyMapping(Config.EmoteCancel.command, Config.EmoteCancel.description, 'keyboard', Config.EmoteCancel.key)
        TriggerEvent('chat:addSuggestion', '/'..Config.EmoteCancel.command, Config.EmoteCancel.description)
        RegisterCommand(Config.EmoteCancel.command, function()
            TriggerEvent('cdev:EmoteCancel')
        end)
    end
end)