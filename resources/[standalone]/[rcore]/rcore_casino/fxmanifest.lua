fx_version 'adamant'
games { 'gta5' }

dependencies {
    '/server:4752',
    '/onesync',
    '/gameBuild:2060',
    --'rcore_casino_map'
}

version '1.0.1'

client_scripts {
    -- Rage UI
    'client/ui/RageUI.lua',
    'client/ui/Menu.lua',
    'client/ui/MenuController.lua',
    'client/ui/components/*.lua',
    'client/ui/elements/*.lua',
    'client/ui/items/*.lua',

    "config.lua",
    "reporter.lua",
    "client/framework/*.lua",
    "const.lua",
    "coords.lua",
    "client/main/utils.lua",
    "client/main/casino.lua",
    "client/interior/announcer.lua",
    "client/interior/cashier.lua",
    "client/interior/seat.lua",
    "client/games/slots.lua",
    "client/interior/pricespinner.lua",
    "client/games/insidetrack.lua",
    "client/games/luckywheel.lua",
    "client/interior/drinkingbar.lua",
    "client/interior/peds.lua",
    "client/main/sceneped.lua",
    "client/ui/TimerBar.lua",
    "client/main/mugshot.lua",
    "client/main/casinocontrol.lua",
    "client/games/roulette.lua",
    "client/games/poker.lua",
    "client/games/blackjack.lua",
    "client/interior/clothing.lua",
    "client/interior/office.lua",
    "client/interior/doorsystem.lua",
    'client/ui/MenuHandler.lua',

    "client/utils/*.lua",
    "client/job/*.lua"
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "config.lua",
    "config_server.lua",
    "reporter.lua",
    "const.lua",
    "server/framework/*.lua",
    "server/utils.lua",
    "server/games/slots.lua",
    "server/games/insidetrack.lua",
    "server/main/casino.lua",
    "server/main/cache.lua",
    "server/games/luckywheel.lua",
    "server/main/sceneped.lua",
    "server/interior/drinkingbar.lua",
    "server/games/roulette.lua",
    "server/games/poker.lua",
    "server/games/blackjack.lua",
    "server/main/society.lua",
    "server/main/casinocontrol.lua",
    "server/main/log.lua",
    "server/utils/*.lua",
}

shared_scripts {
    "shared/*.lua",
    "translation.lua",
}

escrow_ignore {
    "config.lua",
    "translation.lua",
    "config_server.lua",
    "const.lua",
    "reporter.lua",
    "client/main/casino.lua",
    "server/main/casino.lua",
    "server/main/society.lua",
    "shared/objectLoader.lua",
    'client/ui/MenuHandler.lua',
    "client/job/bossmenu.lua",
    "stream/**/*.ytd",
    "stream/**/*.ytf",
    "client/interior/cashier.lua",
    "server/main/cache.lua",
    "server/utils/*.lua"
}

ui_page 'client/html/index.html'

files {
    'client/html/index.html',
    'client/html/keys/*',
    'client/html/css/*',
    'client/html/scripts/*',
    'client/interior/peddata.txt',
    'client/interior/peddata_gabz.txt',
}

lua54 "yes"

dependency '/assetpacks'