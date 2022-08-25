if Config.Dispatch == nil or Config.Dispatch == 0 then
    if GetResourceState('cd_dispatch') == 'starting' or GetResourceState('cd_dispatch') == 'started' then
        Config.Dispatch = 1
    end
end

CreateThread(function()
    if Config.Dispatch == 1 then
        RegisterNetEvent('cd_dispatch:Dispatch')
        AddEventHandler('cd_dispatch:Dispatch', function()
            local data = exports['cd_dispatch']:GetPlayerInfo()

            TriggerServerEvent('cd_dispatch:AddNotification', {
                job_table = { 'police' },
                coords = data.coords,
                title = '10-50 - Drug Deal',
                message = 'A ' .. data.sex .. ' selling drugs at ' .. data.street,
                flash = 0,
                unique_id = tostring(math.random(0000000, 9999999)),
                blip = {
                    sprite = 51,
                    scale = 1.2,
                    colour = 2,
                    flashes = false,
                    text = '911 - Drug Deal',
                    time = 5 * 60 * 1000,
                    sound = 1
                }
            })
        end)
    end
end)