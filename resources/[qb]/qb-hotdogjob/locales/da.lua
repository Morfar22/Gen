local Translations = {
    error = {
        no_money = 'Ikke penge nok',
        too_far = 'Du er for langt fra din pølsevogn',
        no_stand = 'Du har ikke en pølsevogn',
        cust_refused = 'Kunde nægtede!',
        no_stand_found = 'Din pølsevogn var ingen steder at se, du vil ikke modtage dit depositum tilbage!',
        no_more = 'Du har ikke %{value} mere om dette foran rådet',
        deposit_notreturned = 'Du havde ikke en pølsevogn',
        no_dogs = 'Du har ingen hotdogs',
    },
    succes = {
        deposit = 'Du har betalt et depositum på $%{deposit}!',
        deposit_returned = 'Din $%{deposit} indbetaling er blevet returneret!',
        sold_hotdogs = '%{value} x Hotdog(\'s) solgt for $%{value2}',
        made_hotdog = 'Du har lavet en %{value} hotdogs',
        made_luck_hotdog = 'Du lavede %{value} x %{value2} hotdogs',
    },
    info = {
        command = "Slet stand (kun administrator)",
        blip_name = 'Pølsevogn',
        start_working = '[E] Begynd at arbejde',
        start_work = 'Begynd at arbejde',
        stop_working = '[E] Stop med at arbejde',
        stop_work = 'Stop med at arbejde',
        grab_stall = '[~g~G~s~] Grib stall',
        drop_stall = '[~g~G~s~] Release Stall',
        grab = 'Grib stall',
        prepare = 'Forbered Hotdog',
        toggle_sell = 'Toggle salg',
        selling_prep = '[~g~E~s~] Hotdog forberede [Sale: ~g~Selling~w~]',
        not_selling = '[~g~E~s~] Hotdog forberede [Salg: ~r~Not Selling~w~]',
        sell_dogs = '[~g~7~s~] Sælg %{value} x HotDogs for $%{value2} / [~g~8~s~] Afvis',
        sell_dogs_target = 'Sælg %{value} x HotDogs for $%{value2}',
        admin_removed = "Pølsevogn fjernet",
        label_a = "Perfekt (A)",
        label_b = "Sjælden (B)",
        label_c = "Almindelig (C)"
    },
        keymapping = {
            gkey = 'Slip pølsevognen',        
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
