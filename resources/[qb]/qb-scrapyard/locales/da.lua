local Translations = {
    error = {
        smash_own = "Du kan ikke smadre et køretøj, der ejer det.",
        cannot_scrap = "Dette køretøj kan ikke skrottes.",
        not_driver = "Du er ikke chaufføren",
        demolish_vehicle = "Du har ikke tilladelse til at rive køretøjer ned nu",
        annulleret = "Annulleret",
    },
    text = {
        scrapyard = 'Skrotplads',
        disassemble_vehicle = '~g~E~w~ - Adskil køretøj',
        email_list = "~g~E~w~ - E-mail liste over køretøjer",
        demolish_vehicle = "Demolish Vehicle",
    },
    email = {
        sender = "Turner's Auto Wrecking",
        subject = "Køretøjsliste",
        besked = "Du kan kun nedrive et antal køretøjer.<br />Du kan beholde alt, hvad du nedbryder for dig selv, så længe du ikke generer mig.<br /><br /><strong>Køretøjsliste:</strong> <br />",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})