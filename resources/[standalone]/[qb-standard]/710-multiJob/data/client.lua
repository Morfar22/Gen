local QBCore = exports['qb-core']:GetCoreObject()

RegisterKeyMapping('+changejob', 'Toggle MultiJob Menu', 'keyboard', Config.OpenKey)

RegisterCommand('+changejob', function()
    TriggerEvent('710-multiJob:Client:OpenMenu')
end)
if Config.usingQBmenu then 
    RegisterNetEvent('710-multiJob:Client:OpenMenu', function()
        local Player = QBCore.Functions.GetPlayerData()
        local citizenid = Player.citizenid
        local Menu = {
            {
                header = "<center><img src=https://i.imgur.com/0SqHk1a.png width=50vh></center><br>Skift job<br>",
                isMenuHeader = true
            },
            {
                header = "Skift job".."<br>Du arbejder lige pt. som: "..Player.job.label..".<br>",
                txt = '',
                params = {
                    isServer = true,
                    event = "710-multiJob:Server:ChangeJob",
                    args = {
                        citizenid = citizenid
                    }
                }
            },
        }
        exports['qb-menu']:openMenu(Menu)
    end)
end

if Config.usingRenzuContext then 
    RegisterNetEvent('710-multiJob:Client:OpenMenu', function()
        local Player = QBCore.Functions.GetPlayerData()
        local citizenid = Player.citizenid
        local multimenu = {}
    firstmenu = {
    ['ChangeJob'] = {
        ['title'] = 'Skift job',
        ['fa'] = '<i class="fad fa-hood-cloak"></i>',
        ['type'] = 'event', 
        ['content'] = '710-multiJob:Server:ChangeJob',
        ['variables'] = {server = true, send_entity = false, onclickcloseui = true, custom_arg = {args = citizenid}, arg_unpack = false},
    },
    ['CheckJob'] = {
        ['title'] = 'Dit nuværende arbejde '..Player.job.label..".", 
        ['fa'] = '<i class="fad fa-question-square"></i>',
        ['type'] = 'event', 
        ['content'] = '710-multiJob:Server:ChangeJob', -- Doesnt matter what one they click they will still change jobs
        ['variables'] = {server = true, send_entity = false, onclickcloseui = true, custom_arg = {args = citizenid}, arg_unpack = false},
    },
    }
    multimenu['Change Jobs'] = firstmenu 
        TriggerEvent('renzu_contextmenu:insertmulti',multimenu,"Switch Job", false,"<left><img src=https://i.imgur.com/0SqHk1a.png width=35vh></center></i> Change Jobs<br>")
        TriggerEvent('renzu_contextmenu:show')
    end)
end