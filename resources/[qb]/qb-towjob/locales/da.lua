local Translations = {
    error = {
        finish_work = "Afslut alt dit arbejde først",
        vehicle_not_correct = "Dette er ikke det rigtige køretøj",
        failed = "Du har fejlet",
        not_towing_vehicle = "Du skal være i dit trækkende køretøj",
        too_far_away = "Du er for langt væk",
        no_work_done = "Du har ikke udført noget arbejde endnu",
        no_deposit = "$%{value} indbetaling påkrævet",
    },
    success = {
        paid_with_cash = "$%{value} depositum betalt med kontanter",
        paid_with_bank = "$%{value} depositum betalt fra bank",
        refund_to_cash = "$%{value} depositum betalt med kontanter",
        you_earned = "Du tjente $%{value}",
    },
    menu = {
        header = "Tilgængelige lastbiler",
        close_menu = "⬅ Luk menu",
    },
    mission = {
        delivered_vehicle = "Du har leveret et køretøj",
        get_new_vehicle = "Et nyt køretøj kan afhentes",
        towing_vehicle = "Hejsning af køretøjet...",
        goto_depot = "Tag køretøjet til Hayes Depot",
        vehicle_towed = "Køretøj bugseret",
        untowing_vehicle = "Fjern køretøjet",
        vehicle_takenoff = "Køretøj taget af",
    },
    info = {
        tow = "Placer en bil på bagsiden af dit lad",
        toggle_npc = "Skift Npc-job",
        skick = "Forsøg på misbrug",
    },
    label = {
        payslip = "Lønseddel",
        vehicle = "Køretøj",
        npcz = "NPCZone",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
