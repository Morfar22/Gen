local Translations = {
    error = {
        already_driving_bus = 'Du kører allerede en bus',
        not_in_bus = 'Du er ikke i en bus',
        one_bus_active = 'Du kan kun have én aktiv bus ad gangen',
        drop_off_passengers = 'Sæt passagererne af, før du holder op med at arbejde'
    },
    success = {
        dropped_off = 'Person was dropped off',
    },
    info = {
        bus = 'Standard Bus',
        goto_busstop = 'Kør til busstoppestedet',
        busstop_text = '[E] Busstoppested',
        bus_plate = 'BUS', -- Kan være 3 eller 4 tegn lang (bruger tilfældige 4 cifre)
        bus_depot = 'Busdepot',
        bus_stop_work = '[E] Stop med at arbejde',
        bus_job_vehicles = '[E] Jobbiler'
    },
    menu = {
        bus_header = 'Buskøretøjer',
        bus_close = '⬅ Luk menu'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})