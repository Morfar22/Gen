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
	CustomMenuEnabled = true,
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
        ['emotes'] = 'Animations ~p~ +40 New Animations',
        ['danceemotes'] = "🕺 Dance Animations",
        ['propemotes'] = "📦 Item Animations",
        ['favoriteemotes'] = "🌟 Favorites",
        ['favoriteinfo'] = "Choose an animation to set a favourite.",
        ['rfavorite'] = "Reset Favorites",
        ['prop2info'] = "❓ Item Animations can be found at the end",
        ['set'] = "Set(",
        ['setboundemote'] = "set) as animation shortcut?",
        ['newsetemote'] = "~w~ you can use your newly assigned animation by pressing ~g~F5~w~",
        ['cancelmote'] = "Cancel Animation",
        ['cancelmoteinfo'] = "~r~X~y~ Cancel animation.",
        ['walkingstyles'] = "Walking Animations",
        ['resetdef'] = "Reset to default",
        ['normalreset'] = "Normal (Reset)",
        ['moods'] = "Facial Expressions",
        ['infoupdate'] = "~r~Encoders",
        ['infoupdateav'] = "Info (Update Available)",
        ['infoupdateavtext'] = "",
        --Update available, you can download the latest version here. ~y~https://github.com/andristum/dpemotes~w~
        ['suggestions'] = "~p~Thanks to dullpear_dev ❤️",
        ['suggestionsinfo'] = "Thanks to ~p~ dullpear_dev ❤️",
        ['notvaliddance'] = "Not a valid dance.",
        ['notvalidemote'] = "Not a valid animation.",
        ['nocancel'] = "There is no animation that can be canceled.",
        ['maleonly'] = "This animation is for boys only!",
        ['emotemenucmd'] = "Use /emotemenu for menu.",
        ['shareemotes'] = "👫 Shared Animations",
        ['shareemotesinfo'] = "Invite close contact",
        ['sharedanceemotes'] = "🕺 Shared Dances",
        ['notvalidsharedemote'] = "This is not a mutual animation.",
        ['sentrequestto'] = "Send request with ~y~";
        ['nobodyclose'] = "Nobody close ~r~close~w~ ",
        ['doyouwanna'] = " ~y~Y~w~ to accept, ~r~L~w~ to reject (~g~",
        ['refuseemote'] = "Animation Denied.",
        ['makenearby'] = "Nearest player started playing",
        ['camera'] = "Press ~y~G~w~ to use camera.",
        ['makeitrain'] = "Press ~y~G~w~ / to make it rain.",
        ['pee'] = "Hold ~y~G~w~ / to pee.",
        ['spraychamp'] = "Hold ~y~G~w~ to pop champagne ",
        ['bound'] = "Assign ",
        ['to'] = "to",
        ['currentlyboundemotes'] = " Adjusted Animations:",
        ['notvalidkey'] = "Not a valid key.",
        ['keybinds'] = "🔢 Keybinds",
        ['keybindsinfo'] = "Use"
  },
}

-- Sen bir aptalsın Josh B
