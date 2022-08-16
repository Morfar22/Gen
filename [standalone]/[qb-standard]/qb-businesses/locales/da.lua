local Translations = {
    error = {
        cancelled = 'Annuleret...',
        maxium = 'Du kan ikke have flere retter på menuen!',
        exist = 'Varen findes allerede!',
        error_food = 'Du har ikke nogen %s',
        sweet = 'Maden er virkelig sød!',
        sweat = 'Du begynder at svede...',
    },

    success = {
        submit = 'Indsend',
        available = 'Du gjorde %s tilgængelig i Restauranten!',
        removed = 'Du Fjernede %s fra menuen!',
    },

    progressbar = {
        hand_wash = 'Vasker Hænder...',
    },

    target = {
        chairs_sitdown = "Sid Ned",
        table_open = "Kig på Bordet",
        change_picture = "Skift menukort",
        stash_open = "Åben Depot",
        soda_menu = "Tag en soda!",
        wine_menu = "Tag en flaske vin!",
        coffee_menu = "Tag noget Kaffe!",
        beer_menu = "Tag en øl!",
        manager_menu = "Rediger Virksomhed",
        cut_vegetables = "Skære Bræt!",
        hand_wash = "Vask Hænder",
    },

    header = {
        painting = 'Skift billede (512x512)',
        new_item = 'Lav en ny vare!',
        newmenu_item = 'Lav en ny menuvare!',
        manage_menu = 'Rediger menuvare!',
        newfood_item = 'Lav en ny madvare!',
        newdrink_item = 'Lav en ny drikkevare!',
        createdrink = 'Lave en ny drikkevare',
        create_main = 'Lave en ny hovedret',
        create_side = 'Lave en ny forret!',
        create_dessert = 'Lav en ny Desert!',
        manage_food = 'Rediger madvare!',
        manage_main = 'Rediger hovedretter',
        manage_side = 'Rediger forretter!',
        manage_dessert = 'Rediger Desserter',
        manage_drinks = 'Rediger Drikkevare',

        alter_recipe = 'Skift Opskrift!',
        remove_menu = 'Fjern fra menuen!',

        make_active = 'Tilføj til menuen!',

        boss = 'Arbejds Menuen',
        closemenu = '❌| Luk Menuen',
        goback = '⬅ | Gå tilbage',

    },

    subtext = {
        recipes = 'Tilføj opskrifter og mere!',
        hire = 'Ansæt, fyre og styre medarbejdere!',
        main_text = 'Lav en ny hovedret!',
        side_text = 'Lav en ny forret!',
        dessert_text = 'Lav en ny Dessert!',
        alter_recipes = 'Udskift opskrifter, tilføj til menuen og mere!',

        recipe_text = 'Udskift %s opskrift',
        remove_text = 'Fjern %s fra menuen!!',

        active_item = 'Gør %s klar til at blive lavet!',
        note = 'Note (Ikke Påkrævet)',

        station = '(Vælg Station)',
        prep = '(Forbered)',
    },

    input = {
        painting = 'Indsæt et .png link (512 x 512)',
        cap_name = 'Navn',
        cap_description = 'Beskrivelse',
        img_size = 'Billede (100x100 pixels)',

        emotemenu = '(Emote fra /emotemenu)',
        
        using = '🔵| I brug',
        notusing = '🔴| IKKE I brug',
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})