local Translations = {
    error = {
        license_already = 'Spilleren har allerede en licens',
        annulleret = 'Annulleret...',
        maxium = 'Du har allerede det maksimale antal menupunkter!',
        exist = 'Element findes allerede!',
        error_food = 'Du har ikke en %s',
        sweet = 'Mad er alt for sød',
        sved = 'begynder at svede',
    },

    success = {
        uncuffed = 'Du er blevet uncuffed',
        submit = 'Send',

        available = 'Du gjorde %s tilgængelig i restauranten!',
        remove = 'Du fjernede %s for menuen!',
    },

    info = {
        mr = 'Hr.',
    },

    menu = {
        cutting_header = "Begynd at skære %s",
        cutting_info = "Skær %s til %s",
    },

    progressbar = {
        hand_wash = 'Vasker hænder...',
        cutting_board = "Skærer %s...",
    },

    target = {
        chairs_sitdown = "Sæt dig ned",
        table_open = "Åben tabel",
        change_picture = "Skift billede %{id}",
        reset_picture = "Nulstil alle billeder",
        cash_register = "Åbn kasseapparat",
        stash_open = "Åbn Stash",
        soda_menu = "Snup en sodavand!",
        wine_menu = "Snup en flaske vin!",
        coffee_menu = "Snup kaffe!",
        beer_menu = "Snup en øl!",
        manager_menu = "Administrer forretning",
        cut_vegetables = "Skærebræt",
        hand_wash = "Vask hænder",
        dj_booth = "Afspil musik",
    },

    header = {
        maleri = 'Skift maleri (512x512)',
        new_item = 'Opret nyt element',
        newmenu_item = 'Opret et nyt menupunkt!',
        manage_menu = 'Administrer menupunkter',
        newfood_item = 'Opret en ny madvare!',
        newdrink_item = 'Opret en ny drikkevare!',
        createdrink = 'Opret ny drink',
        create_main = 'Opret hovedret',
        create_side = 'Opret tilbehør',
        create_dessert = 'Opret dessertelement',
        manage_food = 'Administrer madvarer!',
        manage_main = 'Administrer hovedret',
        manage_side = 'Administrer tilbehør',
        manage_desserts = 'Administrer desserter',
        manage_drinks = 'Administrer drikkevarer',

        alter_recipe = 'Ændre opskrift',
        new_recipe = 'Ny opskrift',
        create_new_recipe = 'Ændre opskrift',
        remove_menu = 'Fjern fra menu',

        make_active = 'Gør aktiv',

        ingredienser = 'Ingredienstype %s',

        boss = 'Boss Menu',
        closemenu = 'Luk menu',
        goback = 'Gå tilbage',

    },

    subtext = {
        opskrifter = 'Tilføj opskrifter og mere!',
        hire = 'Ansæt, fyr og administrer medarbejdere!',
        main_text = 'Opretter et nyt hovedkursus',
        side_text = 'Opretter et nyt tilbehør',
        dessert_text = 'Opretter et nyt dessertelement',
        alter_recipes = 'Ændre opskrifter, gentag følelser og mere!',

        recipe_text = 'Ændre %s opskrift',
        remove_text = 'Fjern %s fra menuen!!',

        active_item = 'Gør %s Aktiv for at blive gjort!',
        note = 'Note (ikke påkrævet)',

        station = '(Vælg station)',
        prep = '(prep)',
    },

    input = {
        painting = 'Indsæt et .png-link (512 x 512)',
        cap_name = 'Navn',
        cap_description = 'Beskrivelse',
        img_size = 'Billede (100x100 pixels)',

        emotemenu = '(Emote fra /emotemenu)',
       
        using = '🔵| I øjeblikket i brug',
        notusing = '🔴| I øjeblikket IKKE i brug!',
    },

    logs = {
        play_song = "%{name} begyndte at spille %{song} på %{zone} dj-standen.",
        play_song_unauth = "%{name} forsøgte at spille %{song} på %{zone} dj-standen. Men er ikke autoriseret!",
        stop_song = "%{name} har stoppet musikken ved %{zone} dj-standen.",
        stop_song_unauth = "%{name} forsøgte at stoppe musikken ved %{zone} dj-standen. Men er ikke autoriseret!",
        pause_song = "%{name} har sat musik på pause ved %{zone} dj-standen.",
        pause_song_unauth = "%{name} forsøgte at sætte musik på pause ved %{zone} dj-standen. Men er ikke autoriseret!",
        resume_song = "%{name} har genoptaget musikken på %{zone} dj-standen.",
        resume_song_unauth = "%{name} forsøgte at genoptage sangen på %{zone} dj-standen. Men er ikke autoriseret!",
        change_volume = "%{name} har ændret sangens lydstyrke til %{volume} ved %{zone} dj-standen.",
        change_volume_unauth = "%{name} forsøgte at ændre sangens lydstyrke til %{volume} ved %{zone} dj-standen. Men er ikke autoriseret!",
        dui_update = "%{name} har ændret DUI-billedet ved %{id} til %{url} ved %{zone}.",
        dui_update_unauth = "%{name} forsøgte at ændre DUI-billedet ved %{id} til %{url} ved %{zone}. Men er ikke autoriseret!",
        dui_reset = "%{name} har nulstillet alle DUI-billeder i %{zone}.",
        dui_reset_unauth = "%{name} forsøgte at nulstille alle DUI-billeder i %{zone}. Men er ikke autoriseret!",
        create_item = "%{navn} har oprettet et element til %{zone}.\nVare: %{item}\nBillede: %{image}\nBeskrivelse: %{desc}\nType: %{type}",
        create_item_unauth = "%{name} har forsøgt at oprette et element til %{zone}. Men er ikke autoriseret! \nVare: %{item}\nBillede: %{image}\nBeskrivelse: %{desc}\nType: %{ type}",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})