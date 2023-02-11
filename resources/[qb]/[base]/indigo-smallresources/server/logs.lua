local QBCore = exports['indigo-core']:GetCoreObject()

local Webhooks = {
    ['default'] = 'https://discordapp.com/api/webhooks/1035048969061011466/hphpHPUY6LGLC0z_BdSWx7hRXnlpnh99OIXGDNrSQ6Bn34aWmeXB81AGS13sv_lQH_b6',
    ['testwebhook'] = '',
    ['playermoney'] = 'https://discordapp.com/api/webhooks/1035049074547752990/XwquqhpvhtdUEvV7bTyfG72V88KNOQWx-msfBwaLsRRWJTGoOT6TqNnU_T3KuMtJlmsa',
    ['playerinventory'] = 'https://discordapp.com/api/webhooks/1035049159083970600/brw6POQIYmzEiwq0F9U_mdxrTlnZ4pPJDYe4a-VLPUXNYZlZGu7DlMH2yMTJp0IKqS2a',
    ['robbing'] = 'https://discordapp.com/api/webhooks/1035049235260903444/cwXy3TujrkIyQCnz-Iehn5l3ztIkyuVQP_BE1GUfHVn76WVjAhDhnR2TX1eZTw-9VOSy',
    ['cuffing'] = 'https://discordapp.com/api/webhooks/1035049314839445564/t4J1sB-RfY1xj-06YmVjPaIXoGqnCAPgyDloR1WOgEi88-9wzqBvrqQ-4TnvHEdpRjJZ',
    ['drop'] = 'https://discordapp.com/api/webhooks/1035049432238006403/vZewjm9lWj9f8qmS3a4A1DQAn-x4c_yDXiRNTZUo7z6qbdYw6yNK2UucyT4urglYW9hW',
    ['trunk'] = 'https://discordapp.com/api/webhooks/1035049657979645963/z7y8n-fxPjq28IZun_oh3XlsjNXy9cY6V6rnNAsKte6PLzJPfkJSXNNl7BdcrE6lA_uL',
    ['stash'] = 'https://discordapp.com/api/webhooks/1035049761197281280/LewjMNP-OPQ07kN_SaLUchQuIOHj6zjDQzjG1vFOPbbMb3DNE7DMRITWbDtBlCUvVEiT',
    ['glovebox'] = 'https://discordapp.com/api/webhooks/1035049831703511080/HytWNeVdbIf30KQGR1RBTlRmik0ajixz87ePQUSFmeM-enVuM72vRk43mPjDoFlO3aAJ',
    ['banking'] = 'https://discordapp.com/api/webhooks/1035049900041310299/MEKNkm2DoIbMnjW-8Boy-A0zpRcMDjS2ZzbXVgkR4kDAssmhi_tIBSk6bkW3A63IjjcM',
    ['vehicleshop'] = 'https://discordapp.com/api/webhooks/1035049959000653894/m187vLTxpi4hzQHth3QPhT_WSbcdpJSPvt8KaZ9QThto6MpsjXk8CX1GhVo_rV8tbUZF',
    ['vehicleupgrades'] = 'https://discordapp.com/api/webhooks/1035050075237384232/m2noBJ9V7vVHHwpos4tw5X2MOgWXmjERX4hvtwnsc1ydUgJKxfhdoa-_iFxlYL_lvVSs',
    ['shops'] = 'https://discordapp.com/api/webhooks/1035050160071393370/i6ADq4ys4qb6dEKR2b1CjDJJK_TpKcbz59GegD61VL0OpVRXPEog6bXlHEh7wnLqCN_V',
    ['dealers'] = 'https://discordapp.com/api/webhooks/1035050260717899786/nAEoOdss_Awjtq4OoaETMPZPNGmMEmwNQB9lWAlaECTlv0qEgtI3ihtRNSRkivVY-tcM',
    ['storerobbery'] = 'https://discordapp.com/api/webhooks/1035050321090711602/uaEhJ79_ADe22st6nVRnL70JN0VJKha-VpF8HOoCgrcLHQabOwiY25IhfFz-NzRWKmxP',
    ['bankrobbery'] = 'https://discordapp.com/api/webhooks/1035050395342487663/b_Phojb139Dnv8gmZD8_tDZ-2TsKOcpIyOLf0th7ekvIzgnLwzIL7z9ElDZ3OeIudVXU',
    ['powerplants'] = 'https://discordapp.com/api/webhooks/1035050476028297216/t4z9cFWB64N9WEDn7iCMq6Ecu43Bzg55XFqNsF_Mmie73c9ghu70AMCtWWareqbNsyQR',
    ['death'] = 'https://discordapp.com/api/webhooks/1035050549655122031/g9MkS0B7eXKUH_BazNHElCrEtQpClEvkIkgGCj2lGAVi1ChxKT3OyhpFcTNGdT-g89l8',
    ['joinleave'] = 'https://discordapp.com/api/webhooks/1035050618550751232/9RWktr3SZ2VbBxtkjdoRJgdzMMWGLlQg6_QRQ5Tg5SM9_UoCJludZYSV52QO-vf4rNVI',
    ['ooc'] = 'https://discordapp.com/api/webhooks/1035050689841352744/Ak_bg0k-CXv6oxX0EwWZrBOha6ZsgP0AkdjfOr8e6SBYcFx1p0YFAroUYVtaeqPIz3eb',
    ['report'] = 'https://discordapp.com/api/webhooks/1035050689841352744/Ak_bg0k-CXv6oxX0EwWZrBOha6ZsgP0AkdjfOr8e6SBYcFx1p0YFAroUYVtaeqPIz3eb',
    ['me'] = 'https://discordapp.com/api/webhooks/1035050874298437722/ZnXewyUdulqy4edoOsO66ZJTckjbjKZmdEeQZoMnqhOgI3xJWxOPeSe_9phaivPaErRb',
    ['pmelding'] = '',
    ['112'] = '',
    ['bans'] = 'https://discordapp.com/api/webhooks/1035050874298437722/ZnXewyUdulqy4edoOsO66ZJTckjbjKZmdEeQZoMnqhOgI3xJWxOPeSe_9phaivPaErRb',
    ['anticheat'] = 'https://discordapp.com/api/webhooks/1035051061750267906/gmp8_PcIyshk6UqCiLe0WKTyfNNN79QYwVl8QRfEzj9kOImwug0bpPs6shBn-Kkybujl',
    ['weather'] = 'https://discordapp.com/api/webhooks/1035051122915823617/tOtmSU22Jxp0Gugc-HmkZU6_WA2z5HmHkfSXgEtXx1-rh8h9aspw1ejbkNDNRxiX_0p6',
    ['moneysafes'] = '',
    ['bennys'] = '',
    ['bossmenu'] = '',
    ['robbery'] = '',
    ['casino'] = '',
    ['traphouse'] = '',
    ['911'] = '',
    ['palert'] = '',
    ['house'] = '',
}

local Colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ["lightgreen"] = 65309,
}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone)
    local tag = tagEveryone or false
    local webHook = Webhooks[name] or Webhooks['default']
    local embedData = {
        {
            ['title'] = title,
            ['color'] = Colors[color] or Colors['default'],
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'QBCore Logs',
                ['icon_url'] = 'https://media.discordapp.net/attachments/870094209783308299/870104331142189126/Logo_-_Display_Picture_-_Stylized_-_Red.png?width=670&height=670',
            },
        }
    }
    PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'QB Logs', embeds = embedData}), { ['Content-Type'] = 'application/json' })
    Citizen.Wait(100)
    if tag then
        PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'QB Logs', content = '@everyone'}), { ['Content-Type'] = 'application/json' })
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function()
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')
