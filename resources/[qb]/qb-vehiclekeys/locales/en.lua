local Translations = {
    notify = {
        ydhk = 'Du har ikke nøgler til dette køretøj.',
        nonear = 'Der er ingen i nærheden at aflevere nøgler til',
        vlock = 'Køretøj låst!',
        vunlock = 'Køretøj ulåst!',
        vlockpick = 'Det lykkedes dig at åbne dørlåsen!',
        fvlockpick = 'Du finder ikke nøglerne og bliver frustreret.',
        vgkeys = 'Du afleverer nøglerne.',
        vgetkeys = 'Du får nøgler til køretøjet!',
        fpid = 'Fyld spiller-id´et og pladeargumenterne',
    },
    progress = {
        takekeys = 'Tager nøgler fra kroppen...',
        hskeys = 'Søger efter bilnøglerne...',
        acjack = 'Forsøg på bilhuggeri...',
    },
    info = {
        skeys = '~g~[H]~w~ - Søg efter nøgler',
        tlock = 'Skift køretøjslåse',
        palet = 'Køretøjstyveri i gang. Skriv: ',
    },
    addcom = {
        engine = 'Sluk/tænd mottoren',
        givekeys = 'Overdrag nøglerne til nogen. Hvis ingen ID, gives til nærmeste person eller alle i køretøjet.',
        givekeys_id = 'id',
        givekeys_id_help = 'Spiller-id',
        addkeys = 'Tilføjer nøgler til et køretøj for nogen.',
        addkeys_id = 'id',
        addkeys_id_help = 'Spiller-id',
        addkeys_plate = 'plade',
        addkeys_plate_help = 'Plade',
        rkeys = 'Fjern nøgler til et køretøj for nogen.',
        rkeys_id = 'id',
        rkeys_id_help = 'Spiller-id',
        rkeys_plate = 'plade',
        rkeys_plate_help = 'Plade',
    }

}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
