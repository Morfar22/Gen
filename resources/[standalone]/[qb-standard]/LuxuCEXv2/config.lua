Config = {}

Config.QBCore = true --  FRAMEWORK_SELECTOR:  true = QBCore || false = ESX

Config.OpenCommand = "cex" -- Name of the "open" command e.g. /cex will open the crypto exchange
Config.openAnimation = true -- Set to true if you want to play tablet animation when you open the crypto exchange

Config.EnableOpenCommand = true -- Set to false if you don't want players to open the exchange with chat/console commands | Default: true


--  EXPORTS example usage to open the CEX
-- exports['LuxuCEXv2_back']['openCEX']()


Config.NFT_MARKETPLACE_AVATAR = false -- enable ( set to true) this if you have LuxuNftMarketplace on your server! You can get it at https=//luxu.gg | Default= false

Config.Debug = false

Config.banned = false -- If your country has binance banned set this to true | Default: false


Config.Translate = {
    Home = {
        title = "Kryptoudveksling nummer et!",
        desc = "Køb, sælg og overfør dine kryptovalutaer",
        knap = "Udforsk",
    },
    Market = {
        title = "Markedsoversigt",
        navn = "Navn",
        symbol = "Symbol",
        pris = "Pris",
        dailyChange = "24H Change",
        dailyHigh = "24H høj",
        dailyLow = "24H lav",
    },
    Transactions = {
        knap = "👈 GÅ TILBAGE",
        type = "Type",
        coin = "mønt",
        amount = "Beløb",
        pris = "Pris",
        dato = "Dato",
        afsender = "Afsender",
        modtager = "Modtager",
        loading = "Indlæser...",
        guide = "Vælg hvilke transaktioner du ønsker at se",
        marketbtn = "Marked",
        transfersbtn = "Overførsler",
    },
    Wallet = {
        name = "Navn",
        symbol = "Symbol",
        balance = "Balance",
        selected = "Valgt krypto",
        receiver = "Modtager:",
        amount = "Beløb:",
        send = "Send 🚀",
        succes = "Succes🚀",
        askSelect = "Vælg en kryptovaluta",
    },
    Account = {
        welcome = "Velkommen,",
        bank = "Banksaldo",
        exchangeB = "Valutalsaldo",
        cryptoV = "Kryptoværdi",
        dw = "Indbetalingsudbetaling",
        depositum = "Indbetaling",
        withdraw = "Tilbagetrækning",
        current = "Nuværende adresse:",
        change = "Skift",
    },
    Coinpage = {
        goback = "GÅ TILBAGE",
        cexB = "CEX-saldo:",
        buy = "Køb",
        sell = "sælge",
        succes = "Succes✅",
        loading = "Indlæser...",
        tegnebog = "Wallet:",
        price = "Pris:",
        dailyChange = "24H Change:",
        dailyHigh = "24H høj:",
        dailyLow = "24H Lav:",
    },
    Navbar = {
        home = "Hjem",
        market = "Marked",
        wallet = "pung",
        konto = "Konto",
        transactions = "Transaktioner",
        exit = "Afslut",
    },
}
