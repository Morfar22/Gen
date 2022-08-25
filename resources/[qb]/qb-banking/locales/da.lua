local Translations = {
    error = {
        not_give = "Kunne ikke give element til det angivne id.",
        givecash = "Brug /givecash [ID] [BELØB]",
        wrong_id = "Forkert ID.",
        dead = "Du er død LOL.",
        too_far_away = "Du er for langt væk lmfao.",
        not_enough = "Du har ikke dette beløb.",
        invalid_amount = "Ugyldigt givet beløb"
    },
    success = {
        debit_card = "Du har med succes bestilt et betalingskort.",
        cash_deposit = "Du har foretaget en kontant indbetaling på $%{value}.",
        cash_withdrawal = "Du har foretaget en kontanthævning på $%{value}.",
        updated_pin = "Du har opdateret din debetkortpinkode.",
        savings_deposit = "Du har foretaget en opsparingsindbetaling på $%{value}.",
        savings_withdrawal = "Du har foretaget en opsparingshævning på $%{value}.",
        opened_savings = "Du har åbnet en opsparingskonto.",
        give_cash = "Gav $%{cash} til ID %{id}",
        receive_cash = "Mottaget $%{cash} fra ID %{id}"
    },
    info = {
        bank_blip = "Bank",
        access_bank_target = "Adgang til bank",
        access_bank_key = "[E] - Adgangsbank",
        current_to_savings = "Overfør løbende konto til opsparing",
        savings_to_current = "Overfør besparelser til løbende konto",
        deposit = "Indsæt $%{amount} på nuværende konto",
        withdraw = "Tryk $%{amount} fra den aktuelle konto",
    },
    command = {
        givecash = "Giv penge til spilleren."
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})