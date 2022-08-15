local Translations = {
    error = {
        ["cancled"] = "Annulleret",
        ["no_truck"] = "Du har ingen lastbil!",
        ["not_enough"] = "Ikke nok penge (%{value} påkrævet)",
        ["too_far"] = "Du er for langt væk fra afleveringsstedet",
        ["early_finish"] = "På grund af tidlig afslutning (Fuldført: %{completed} I alt: %{total}), vil din indbetaling ikke blive returneret.",
        ["never_clocked_on"] = "Du har aldrig klokket på!",
    },
    success = {
        ["clear_routes"] = "Ryddede brugeres ruter, de havde %{value} ruter gemt",
        ["pay_slip"] = "Du fik $%{total}, din lønseddel %{deposit} blev udbetalt til din bankkonto!",
    },
    info = {
        ["payslip_collect"] = "[E] - Lønseddel",
        ["payslip"] = "Lønseddel",
        ["not_enough"] = "Du har ikke penge nok til indbetalingen.. Indbetalingsomkostninger er $%{value}",
        ["deposit_paid"] = "Du har betalt $%{value} depositum!",
        ["no_deposit"] = "Du har ikke betalt noget depositum på dette køretøj..",
        ["truck_returned"] = "Lastbil returneret, afhent din lønseddel for at modtage din løn og depositum tilbage!",
        ["bags_left"] = "Der er stadig %{value} poser tilbage!",
        ["bags_still"] = "Der er stadig %{value} taske derovre!",
        ["all_bags"] = "Alle affaldssække er færdige, fortsæt til næste sted!",
        ["depot_issue"] = "Der var et problem på depotet, vend venligst tilbage med det samme!",
        ["done_working"] = "Du er færdig med at arbejde! Gå tilbage til depotet.",
        ["started"] = "Du er begyndt at arbejde, placering markeret på GPS!",
        ["grab_garbage"] = "[E] Grib en skraldepose",
        ["stand_grab_garbage"] = "Stå her for at få fat i en skraldepose.",
        ["dispose_garbage"] = "[E] Bortskaf affaldspose",
        ["progressbar"] = "Sætter posen i trashmaster ..",
        ["garbage_in_truck"] = "Sæt posen i din lastbil..",
        ["stand_here"] = "Stå her..",
        ["found_crypto"] = "Du fandt en kryptopind på gulvet",
        ["payout_deposit"] = "(+ $%{value} indbetaling)",
        ["store_truck"] = "[E] - Store skraldebil",
        ["get_truck"] = "[E] - Skraldebil",
    },
    warning = {},
}
Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
