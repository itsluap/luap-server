--██╗  ██╗███████╗██╗   ██╗███████╗     █████╗ ███╗   ██╗██████╗      ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗
--██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔════╝    ██╔══██╗████╗  ██║██╔══██╗    ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝
--█████╔╝ █████╗   ╚████╔╝ ███████╗    ███████║██╔██╗ ██║██║  ██║    ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗
--██╔═██╗ ██╔══╝    ╚██╔╝  ╚════██║    ██╔══██║██║╚██╗██║██║  ██║    ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║
--██║  ██╗███████╗   ██║   ███████║    ██║  ██║██║ ╚████║██████╔╝    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║
--╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝    ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝      ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝


CreateThread(function()
    if Config.Control.ENABLE then
        RegisterKeyMapping(Config.Control.command, L('command_control'), 'keyboard', Config.Control.key)
        TriggerEvent('chat:addSuggestion', '/'..Config.Control.command, L('command_control'))
        RegisterCommand(Config.Control.command, function()
            TriggerEvent('cdev:Control')
        end)
    end

    if Config.ControlRight.ENABLE then
        RegisterKeyMapping(Config.ControlRight.command, L('command_control_right'), 'keyboard', Config.ControlRight.key)
        TriggerEvent('chat:addSuggestion', '/'..Config.ControlRight.command, L('command_control_right'))
        RegisterCommand(Config.ControlRight.command, function()
            TriggerEvent('cdev:ControlRight')
        end)
    end

    if Config.ControlLeft.ENABLE then
        RegisterKeyMapping(Config.ControlLeft.command, L('command_control_left'), 'keyboard', Config.ControlLeft.key)
        TriggerEvent('chat:addSuggestion', '/'..Config.ControlLeft.command, L('command_control_left'))
        RegisterCommand(Config.ControlLeft.command, function()
            TriggerEvent('cdev:ControlLeft')
        end)
    end
    
    if Config.EmoteCancel.ENABLE then
        RegisterKeyMapping(Config.EmoteCancel.command, L('command_cancel'), 'keyboard', Config.EmoteCancel.key)
        TriggerEvent('chat:addSuggestion', '/'..Config.EmoteCancel.command, L('command_cancel'))
        RegisterCommand(Config.EmoteCancel.command, function()
            TriggerEvent('cdev:EmoteCancel')
        end)
    end
end)