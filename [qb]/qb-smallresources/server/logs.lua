local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['default'] = 'https://discord.com/api/webhooks/984277035612512306/_siWMp_na9TLKrM47lGFJfgBu5h6M6Qe1-rMenpvxM08UQwMZP7ora1KFOskoyGDVRCa',
    ['testwebhook'] = 'https://discord.com/api/webhooks/984277086883680276/ATXn7qCNvYsLkicmvuNe2v_uwmh8ag9OVrp3gVv9NVYQCwf-uiSUDFECXLjRk4yqeJr1',
    ['playermoney'] = 'https://discord.com/api/webhooks/984277178885754890/bjqZJuTPfRYjFt-p44ap2MgE8ZnU_5VOp68UZEs-XRIVgkXlKGSI4UhXfiEJfxljDvwR',
    ['playerinventory'] = 'https://discord.com/api/webhooks/984277222351314974/B9kJNHv6f8_SdhY7jCkXw5RyY_azcZirh4RB1K5C0Q9mc2jZig1pig6pI6YfeBHoN4C7',
    ['robbing'] = 'https://discord.com/api/webhooks/984277261966520351/VEeph6OOpreFK0AjOKcufBnpGfmn1zDa1YPdszxUvX9euT2rPn8R78RBOSmetpgZI-3W',
    ['cuffing'] = 'https://discord.com/api/webhooks/984277308569432104/qXSL5mva4--raxy84_Lq3mJqRZWWA56OWR36Gyz_l_Q4QnctuRsRrclHRZkrXgL2wMSe',
    ['drop'] = 'https://discord.com/api/webhooks/984277347932983297/HkUXMkUGe7Tqkduo31CTpQvwCE8LLsY_kq_IRT4UIHSLjTE2gnRT_fR8zWJsxJPHzC00',
    ['trunk'] = 'https://discord.com/api/webhooks/984277395773214721/kjuQ3fSLHAMVQezzSMNOt03tWxts4mQJV0iL2fN6HfCvd868U2vejof1avD_ASY4IRff',
    ['stash'] = 'https://discord.com/api/webhooks/984277438831927316/4G6i0xgvXgd6_-OYwSsmngb66fIQMYqlTCdruvJA-dZTGW3GTUo_UuYDotm9aaCspWBD',
    ['glovebox'] = 'https://discord.com/api/webhooks/984277487951437834/_5XhWfKvKAJnJZ38KcuVYIadIx0CQt1KVB39SmwjkMPKf2vYMAGWwGRpoiZs3FBYbJSc',
    ['banking'] = 'https://discord.com/api/webhooks/984277525456879656/3EphuBTY-RrFi51UJIUmvnTSX3JtKyWS9OfUirto1ipNuODVDanSIWyTk9YS6KEiTeit',
    ['vehicleshop'] = 'https://discord.com/api/webhooks/984277568469487697/qpgyp-p5a5JjnrJ-dJ7eOunecRGrWP8j1ESkyTHo65iqJEdGIp970rlR8A256f42HTNh',
    ['vehicleupgrades'] = 'https://discord.com/api/webhooks/984277608445399071/lPNaC4vb36n1Vr2rqRe_-xKPiIpGomu6NRixFl20H3eXN0Qx5iJNfq0rA16mAg57lqJT',
    ['shops'] = 'https://discord.com/api/webhooks/984277648110919710/7s2reknxu64RullfuMhjPmU1Ew9ar3lDyAXTUGuJVACfMnO05YbkP-1bUM-unPVIm65i',
    ['dealers'] = 'https://discord.com/api/webhooks/984277685180178433/ue_yZxBpFmYgLzBukxxnHjSVZf360AnJMImk0YejkDHuM4T3CU4-F5CGwzuXWUQVlmtt',
    ['storerobbery'] = 'https://discord.com/api/webhooks/984277723449008158/PC7fAIKnsj46CKjWeBzqm8Z_F_oClcOJ3lCRhrMfcKuAV5x2uAq3P_VQlZrTA_YQJV_P',
    ['bankrobbery'] = 'https://discord.com/api/webhooks/984277759511625829/D722JBuLp5RjeM6qDhB1MK0CJXiUGPmx9U1-D3uc5nc8DfZnE1JkpbrigeyJg7bOjedi',
    ['powerplants'] = 'https://discord.com/api/webhooks/984277799206551602/nMJ5pVLbaM5Sx05aM9KsnqbG70o9LAg-ne6J8xv-2ljzAkskpdvcLt4V4BPPs59DUA6d',
    ['death'] = 'https://discord.com/api/webhooks/984277849118736394/8CD8iLwQoCr-T5isDKH4_fn7LopahlMu0z7-o4EGORjYJFigGWQAIjzc2Jj0gflv4-Gq',
    ['joinleave'] = 'https://discord.com/api/webhooks/984277939938005032/ECvbRc2DZKGO4a6zqH4uQEMUCOu7KX88Z3PUSVcPQWjZoNptx4SBTNNSbYvisjyfVncv',
    ['ooc'] = 'https://discord.com/api/webhooks/984277977816768563/uVv57luwoSf5UF3EjLM9Z9wQtAxeIZ2yn0oe3DO0W859uyxUSeS75UXwlLWn4Ivo8wiF',
    ['report'] = 'https://discord.com/api/webhooks/984278016257585222/P2AXheVNmpBXxVkrSkB17uJFBVfrJqcNw3ugH5pTN5Ypl2q13gFemHKN6FfCKlxc1XgM',
    ['me'] = 'https://discord.com/api/webhooks/984278054387986452/uaAymNrNGYrbOm1jsXKLXDJWWTxOA0-MGj7zr48f147C8hBBodqhjYVsQMekampXxvv4',
    ['pmelding'] = 'https://discord.com/api/webhooks/984278094556852224/DhnO4mvg9Y7WzMojv1VSraDb9VKaWuhxWCh6TbWWwqf71gZLZlgoydChMFaXKBahxDJq',
    ['112'] = 'https://discord.com/api/webhooks/984278135119962163/twiTKrPeh7cDeRHJW8VqiJMaZVELWcJrtNkHltaIFv6I4b6lD4YyYaIZqstPd-kaR6TD',
    ['bans'] = 'https://discord.com/api/webhooks/984278171954319380/7QUUU5iYbks4mRDcGKGBRaywD8QD8nHmpHDIF78kyqPegWBZ2_bun1sJbzwcVXj--QgP',
    ['anticheat'] = 'https://discord.com/api/webhooks/984278207949852694/Gq0pfrvgQXVa4Sfm1smMO3F5225_Himl6eEl8GwoJTdQpiOQE9-bUH0mWs_RaPCp6tOZ',
    ['weather'] = 'https://discord.com/api/webhooks/984278269178298369/BhEos3QhoQyumUxRODYprXqc97oGladD8gErq61eT8AA_ZxfaFxCAkD2Yi_HKaKnLIbw',
    ['moneysafes'] = 'https://discord.com/api/webhooks/984278303387025448/VRpM4YHyYxtpKDBIKPcib2xrmWJTW891sNZvuI6FRQySUxxrZdpmmXEWHjrW5AyBlTzc',
    ['bennys'] = 'https://discord.com/api/webhooks/984278340464676955/PtUSwswEW4Y9Z4x0HkUxxqsHa2VSqB9osCBrLS4HVy7T6LuXBjRorFWf9-vlvUTCzy61',
    ['bossmenu'] = 'https://discord.com/api/webhooks/984278376242106398/hCAKqdYU2DXeLgRyq41TlkXOtOscJeOr1deZaQIup6xnJ565_m2BHzHh5nzjl5B4iUb0',
    ['robbery'] = 'https://discord.com/api/webhooks/984278416511615046/lmIBqlOn7dA7ORgH05Z6f5QVKE-IQrdLqhCzjUllIv2L5Vlu71NhO93LpFbpPvzjUKKr',
    ['casino'] = 'https://discord.com/api/webhooks/984278460526632980/Tijq6uA1XlkdrADco9x5XzIbL5BeVCON2Mp3zOXsr468HhlzDxahXZmy8lOZ21-fxGBu',
    ['traphouse'] = 'https://discord.com/api/webhooks/984278501790199808/aClGv9vtNgttLMe5waN9QjSnU6GDXYWfLZBKUOfMKmEJJaQ1F6i68bG5CwXvOVj9D5Ux',
    ['911'] = 'https://discord.com/api/webhooks/984278544374956033/eDdAUmeWyhQW9xz3o71BbZHN3ONYMqHV5zSNekK5xpFoUUGlS1TZLJ_E69NFy5VZ9ZVW',
    ['palert'] = 'https://discord.com/api/webhooks/984278580638908446/rtLh3N_rOrByg4GOoaJsbfCjfwjcX4X4PtHXKn1_S4LjJtUmhCvKuJAe9-jeHquuoO2p',
    ['house'] = 'https://discord.com/api/webhooks/984278613849415690/fEKWKP6V1N0mQXSkECr82qRpzA2JQGK7qpRX_Pcvkd2dROTBnuA5VnFqGYmKRnjiBWNf',
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
