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
        title = "The number one crypto exchange!",
        desc = "Buy, sell and transfer your cryptocurrencies",
        button = "Explore",
    },
    Market = {
        title = "Market Overview",
        name = "Name",
        symbol = "Symbol",
        price = "Price",
        dailyChange = "24H Change",
        dailyHigh = "24H High",
        dailyLow = "24H Low",
    },
    Transactions = {
        button = "👈 GO BACK",
        type = "Type",
        coin = "Coin",
        amount = "Amount",
        price = "Price",
        date = "Date",
        sender = "Sender",
        receiver = "Receiver",
        loading = "Loading...",
        guide = "Choose which transactions you wish to see",
        marketbtn = "Market",
        transfersbtn = "Transfers",
    },
    Wallet = {
        name = "Name",
        symbol = "Symbol",
        balance = "Balance",
        selected = "Selected Crypto",
        receiver = "Receiver:",
        amount = "Amount:",
        send = "Send 🚀",
        success = "Success🚀",
        askSelect = "Select a cryptocurrency",
    },
    Account = {
        welcome = "Welcome,",
        bank = "Bank balance",
        exchangeB = "Exchange balance",
        cryptoV = "Crypto value",
        dw = "Deposit Withdraw",
        deposit = "Deposit",
        withdraw = "Withdraw",
        current = "Current Address:",
        change = "Change",
    },
    Coinpage = {
        goback = "GO BACK",
        cexB = "CEX Balance:",
        buy = "Buy",
        sell = "sell",
        success = "Success✅",
        loading = "Loading...",
        wallet = "Wallet:",
        price = "Price:",
        dailyChange = "24H Change:",
        dailyHigh = "24H High:",
        dailyLow = "24H Low:",
    },
    Navbar = {
        home = "Home",
        market = "Market",
        wallet = "Wallet",
        account = "Account",
        transactions = "Transactions",
        exit = "Exit",
    },
}
