local Translations = {
    error = {
        fingerprints = 'Du har efterladt et fingeraftryk på glasset',
        minimum_police = 'Minimum af %{value} politi påkrævet',
        wrong_weapon = 'Dit våben er ikke stærkt nok..',
        to_much = 'Du har for meget i lommen'
    },
    success = {},
    info = {
        progressbar = 'Knuder vitrineskabet',
    },
    general = {
        target_label = 'Knus vitrinen',
        drawtextui_grab = '[E] Smash vitrineskabet',
        drawtextui_broken = 'Skærmkabinettet er i stykker'
    }
}

Lang = Locale:new({phrases = Translations})
