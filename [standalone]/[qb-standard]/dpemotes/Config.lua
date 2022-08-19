Config = {
-- Change the language of the menu here!.
-- Note fr and de are google translated, if you would like to help out with translation / just fix it for your server check below and change translations yourself
-- try en, fr, de or sv.
	MenuLanguage = 'en',	
-- Set this to true to enable some extra prints
	DebugDisplay = false,
-- Set this to false if you have something else on X, and then just use /e c to cancel emotes.
	EnableXtoCancel = true,
-- Set this to true if you want to disarm the player when they play an emote.
	DisarmPlayer= true,
-- Set this if you really wanna disable emotes in cars, as of 1.7.2 they only play the upper body part if in vehicle
    AllowedInCars = false,
-- You can disable the (F3) menu here / change the keybind.
	MenuKeybindEnabled = false,
	MenuKeybind = 170, -- Get the button number here https://docs.fivem.net/game-references/controls/
-- You can disable the Favorite emote keybinding here.
	FavKeybindEnabled = true,
	FavKeybind = 108, -- Get the button number here https://docs.fivem.net/game-references/controls/
-- You can change the header image for the f3 menu here
-- Use a 512 x 128 image!
-- NOte this might cause an issue of the image getting stuck on peoples screens
	CustomMenuEnabled = false,
	MenuImage = "https://cdn.discordapp.com/attachments/999792701140631735/1003397274094796860/LogoDiscordTransparent.png",
-- You can change the menu position here
	MenuPosition = "right", -- (left, right)
-- You can disable the Ragdoll keybinding here.
	RagdollEnabled = true,
	RagdollKeybind = 303, -- Get the button number here https://docs.fivem.net/game-references/controls/
-- You can disable the Facial Expressions menu here.
	ExpressionsEnabled = true,
-- You can disable the Walking Styles menu here.
	WalkingStylesEnabled = true,	
-- You can disable the Shared Emotes here.
    SharedEmotesEnabled = true,
    CheckForUpdates = false,
-- If you have the SQL imported enable this to turn on keybinding.
    SqlKeybinding = false,
}

Config.KeybindKeys = {
    ['num4'] = 108,
    ['num5'] = 110,
    ['num6'] = 109,
    ['num7'] = 117,
    ['num8'] = 111,
    ['num9'] = 118
}

Config.Languages = {
    ['en'] = {
        ['emotes'] = 'Animationer ~p~ +40 nye animationer',
        ['danceemotes'] = "🕺 Danseanimationer",
        ['propemotes'] = "📦 Elementanimationer",
        ['favoriteemotes'] = "🌟 favoritter",
        ['favoriteinfo'] = "Vælg en animation for at angive en favorit.",
        ['rfavorite'] = "Nulstil favoritter",
        ['prop2info'] = "❓ Elementanimationer kan findes i slutningen",
        ['set'] = "Sæt(",
        ['setboundemote'] = "sæt) som animationsgenvej?",
        ['newsetemote'] = "~w~ du kan bruge din nyligt tildelte animation ved at trykke ~g~F5~w~",
        ['cancelmote'] = "Annuller animation",
        ['cancelmoteinfo'] = "~r~X~y~ Annuller animation.",
        ['walkingstyles'] = "Gå-animationer",
        ['resetdef'] = "Nulstil til standard",
        ['normalreset'] = "Normal (Nulstil)",
        ['moods'] = "Ansigtsudtryk",
        ['infoupdate'] = "~r~Encodere",
        ['infoupdateav'] = "Info (opdatering tilgængelig)",
        ['infoupdateavtext'] = "",
        --Opdatering tilgængelig, du kan downloade den seneste version her. ~y~https://github.com/andristum/dpemotes~w~
        ['suggestions'] = "~p~Tak til dullpear_dev ❤️",
        ['suggestionsinfo'] = "Tak til ~p~ dullpear_dev ❤️",
        ['notvaliddance'] = "Ikke en gyldig dans.",
        ['notvalidemote'] = "Ikke en gyldig animation.",
        ['nocancel'] = "Der er ingen animation, der kan annulleres.",
        ['maleonly'] = "Denne animation er kun for drenge!",
        ['emotemenucmd'] = "Brug /emotemenu til menu.",
        ['shareemotes'] = "👫 Delte animationer",
        ['shareemotesinfo'] = "Inviter tæt kontakt",
        ['sharedanceemotes'] = "🕺 Delte danse",
        ['notvalidsharedemote'] = "Dette er ikke en gensidig animation.",
        ['sentrequestto'] = "Send anmodning med ~y~";
        ['nobodyclose'] = "Ingen lukker ~r~close~w~",
        ['doyouwanna'] = " ~y~Y~w~ at acceptere, ~r~L~w~ at afvise (~g~",
        ['refuseemote'] = "Animation nægtet.",
        ['makenearby'] = "Nærmeste spiller begyndte at spille",
        ['camera'] = "Tryk på ~y~G~w~ for at bruge kameraet.",
        ['makeitrain'] = "Tryk ~y~G~w~ / for at få det til at regne.",
        ['pee'] = "Hold ~y~G~w~ / for at tisse.",
        ['spraychamp'] = "Hold ~y~G~w~ for at pop champagne ",
        ['bound'] = "Tildel ",
        ['to'] = "til",
        ['currentlyboundemotes'] = " Justerede animationer:",
        ['notvalidkey'] = "Ikke en gyldig nøgle.",
        ['keybinds'] = "🔢 Keybinds",
        ['keybindsinfo'] = "Brug"
  },
}

-- Sen bir aptalsın Josh B
