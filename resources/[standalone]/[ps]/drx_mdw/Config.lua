Config = {
    EnablePrint = true, -- If the resource should print what version you're on or not. (If you dont want to look at the print for some reason)
    PID = '', -- Your tebex payment id, used for error logging & easier support

    CoreObject = exports['qb-core']:GetCoreObject(),

    Database = {
        Tables = {
            Players = 'players',
            Vehicles = 'player_vehicles',
            Houses = 'player_houses'
        },
        Columns = {
            Identifier = 'citizenid',
            Charinfo = 'charinfo'
        }
    },

    Discord = {
        Open = { -- When a person opens the MDW
            Enable = false,
            Webhook = ''
        },
        Incident = {
            Create = {
                Enable = false,
                Webhook = ''
            },
            Save = {
                Enable = false,
                Webhook = ''
            },
            Delete = {
                Enable = false,
                Webhook = ''
            }
        },
        Report = {
            Create = {
                Enable = false,
                Webhook = ''
            },
            Save = {
                Enable = false,
                Webhook = ''
            },
            Delete = {
                Enable = false,
                Webhook = ''
            }
        },
        Evidence = {
            Create = {
                Enable = false,
                Webhook = ''
            },
            Save = {
                Enable = false,
                Webhook = ''
            },
            Delete = {
                Enable = false,
                Webhook = ''
            }
        },
        Staff = {
            Hire = {
                Enable = false,
                Webhook = ''
            },
            Fire = {
                Enable = false,
                Webhook = ''
            },
            Save = {
                Enable = false,
                Webhook = ''
            }
        },
        Config = {
            Message = {
                Enable = false,
                Webhook = ''
            }
        }
    },

    -- Basic
    Command = 'mdw', -- Command used to open the mdw
    Animation = true, -- Animation and tablet when opening it
    Button = 187, -- E / To turn the opacity true/false (Key codes can be found at: https://css-tricks.com/snippets/javascript/javascript-keycodes/)
    Opacity = 0.35, -- Percentage it'll show (0-1)
    
    -- If person is hired & online
    HiredJob = 'police', -- Job to assign
    HiredGrade = 0, -- Grade to assign

    -- If person is fired & online
    FiredJob = 'unemployed', -- Job to assign
    FiredGrade = 0, -- Grade to assign

    -- Citizens legislations vector3(-551.18, -201.73, 38.23)
    Citizen = {
        Key = 38, -- Open key
        Text = '[E] - Open database system', -- Display text shown if you're near a point
        Locations = { -- Coordinates where it's possible to open
            {-551.18, -201.73, 38.23},
            {285.71, -613.38, 43.38}
        },
    },

    -----------------------------
    -- // NUI CONFIGURABLES // --
    LoadingTimer = 100, -- Loading effect in ms + how long it takes to fetch the information
    EnableDuty = true,
    TimeFormat = '%d-%m-%Y %H:%M:%S', -- '%Y-%m-%d %H:%M:%S' for other countries format
    SelectedPage = 0, -- Selected page when you open it (Number value of the page)
    SelectedSubPage = 0, -- If etc "[8] STAFF" is selected, which sub page to be selected
    Pages = {
        [0] = {Page = 'HJEM'},
        [1] = {Page = 'PROFILER'},
        [2] = {Page = 'HÆNDELSER'},
        [3] = {Page = 'REPORTS'},
        [4] = {Page = 'BEVISER'},
        [5] = {Page = 'VEHICLES'},
        [6] = {Page = 'DISPATCH'},
        [7] = {Page = 'STRAFFE'},
        [8] = {Page = 'STAFF',
            Subs = {
                [0] = {Page = 'ANSATTE'},
                [1] = {Page = 'POLITISKOLEN'},
                [2] = {Page = 'DISCIPLINÆR DATABASE'},
                [3] = {Page = '10 KODER / CMDS'}
            }},
        [9] = {Page = 'LOVGIVNING'}
    },

    -- Cashboard Page
    SaveChat = true, -- Save the chat messages on resource stop
    SaveAnnouncements = true, -- Clear the announcements on each resource stop
    -- Cashboard Page

    -- Profiles page
    Fingerprint = true, -- If fingerprint should be showed or not
    AvailableTags = { -- Available tags to add (id always has to be unique | label)
        {id = 1, label = 'Vær opmærksom'},
        {id = 2, label = 'Farlig'},
        {id = 3, label = 'Eftersøgt'},
        {id = 4, label = 'kode 5'},
        {id = 5, label = 'bærer våben'}
    },
    -- Profiles page

    -- Incidents page
    IncidentTags = { -- Available tags to add (id always has to be unique | Label)
        {id = 1, label = 'Incident tag 1'},
        {id = 2, label = 'Incident tag 2'},
        {id = 3, label = 'Incident tag 3'},
        {id = 4, label = 'Incident tag 4'},
        {id = 5, label = 'Incident tag 5'},
        {id = 6, label = 'Incident tag 6'},
        {id = 7, label = 'Incident tag 7'},
        {id = 8, label = 'Incident tag 8'},
        {id = 9, label = 'Incident tag 9'}
    },
    -- Incidents page

    -- Report page
    Report = {
        Categories = {'Investigative rapport', 'Standard rapport', 'FIB rapport', 'SWAT rapport'}, -- Available categories to select
        Tags = {
            {id = 1, label = 'Vagos', color = 'yellow'},
            {id = 2, label = 'Ballas', color = 'purple'},
            {id = 3, label = 'Families', color = 'green'},
            {id = 4, label = 'Suspecious', color = 'orange'},
            {id = 5, label = 'Suspecious Boxes', color = 'orange'},
            {id = 6, label = 'Weird??', color = 'red'}
        }
    },
    -- Report page

    -- Evidence page
    Evidence = {
        Types = {'Murder Case', 'Other'}, -- Available categories to select
        Tags = { -- Available tags to add (id always has to be unique | label)
            {id = 1, label = 'Vagos'},
            {id = 2, label = 'Ballas'},
            {id = 3, label = 'Families'}
        }
    },
    -- Evidence page

     -- Vehicles page
     Vehicles = {
        States = {
            {id = 0, label = 'Ude'},
            {id = 1, label = 'Parkeret'},
            {id = 2, label = 'Depot'}
        },
        Tags = {
            {id = 1, label = 'Example 1'},
            {id = 2, label = 'Example 2'},
            {id = 3, label = 'Example 3'},
            {id = 4, label = 'Example 4'},
            {id = 5, label = 'Example 5'},
        }
    },
    -- Vehicles page

    -- Dispatch page
    DispatchHeaders = {

        -- Change text to what you'd like to be displayed in the nui
        -- Do not change value
        -- Change if the item can be sorted or not (by clicking on it in the nui)
        -- Fixed width on each table in the nui (If you want it to be automated based on content size, then remove the width (Example below))
        -- If a divider should be shown, turn true, false ore remove it

        -- (EXAMPLE) VERY IMPORTANT THAT "text" AND "value" ALWAYS EXISTS! REST CAN BE REMOVED IF YOU WANT THAT
        -- {text = 'Call ID', value = 'callid',},

        {text = 'Call ID',        value = 'callid',   sortable = true,  width = 100, divider = true},
        {text = 'Type',           value = 'type',     sortable = true,  width = 100, divider = true},
        {text = 'Caller',         value = 'caller',   sortable = false, width = 100, divider = true},
        {text = 'Details',        value = 'details',  sortable = false, width = 385, divider = true},
        {text = 'Location',       value = 'location', sortable = false, width = 200, divider = true},
        {text = 'Date',           value = 'date',     sortable = true,  width = 130, divider = true},
        {text = 'Units Attached', value = 'unit',     sortable = true,  width = 150, divider = true},
        {text = 'Actions',        value = 'actions',  sortable = false, width = 120, divider = true}
    },
    -- Dispatch page

    -- Charges page
    Charges = { -- Charges (id always has to be unique | Label | Fine | Jail Time | Points | Color(rgb, rgba, colorcode#) | Description)
    { id = 1, Label = 'MORD', Fine = 150000, Jail = 300, Points = 3, Color = 'red', Desc = 'The unlawful killing of a human being.' },
    { id = 2, Label = 'MORD PÅ BETJENT', Fine = 250000, Jail = 500, Points = 3, Color = 'red', Desc = 'The crime of killing a law enforcement officer.' },
    { id = 3, Label = 'UFRIVILIG MAND DRAB', Fine = 50000, Jail = 60, Points = 2, Color = 'red', Desc = 'The crime of killing another human being unlawfully but unintentionally.' },
    { id = 4, Label = 'VEHICULAR MANSLAUGHTER', Fine = 50000, Jail = 45, Points = 1, Color = 'red', Desc = 'The crime of killing another person, either intentionally or negligently, as the result of one’s driving.' },
    { id = 5, Label = 'MORDFORSØG PÅ BETJENT', Fine = 100000, Jail = 60, Points = 2, Color = 'red', Desc = 'An attempt to kill any officer or employee of the United States or of any agency in any branch of the United States Government.' },
    { id = 6, Label = 'MORDFORSØG', Fine = 50000, Jail = 45, Points = 2, Color = 'red', Desc = 'Is the failed or aborted attempt to murder another person.' },
    { id = 7, Label = 'MEDVIRKENDE TIL DRABSFORSØG', Fine = 50000, Jail = 45, Points = 2, Color = 'red', Desc = 'Whereby the perpetrator helps or assists a murderer before or after the commission of the murder.' },
    { id = 8, Label = 'OVERFALD MED DØDELIG VÅBEN PÅ BETEJENT', Fine = 50000, Jail = 55, Points = 2, Color = 'red', Desc = 'When an attacker accompanies a physical attack with a physical object, not a gun, capable of inflicting serious bodily injury or death on a government employee.' },
    { id = 9, Label = 'OVERFALD MED DØDELIG VÅBEN', Fine = 25000, Jail = 45, Points = 1, Color = 'red', Desc = 'When an attacker accompanies a physical attack with a physical object, not a gun, capable of inflicting serious bodily injury or death.' },
    { id = 10, Label = 'OVERFALD PÅ BETJENT', Fine = 25000, Jail = 30, Points = 2, Color = 'red', Desc = 'To make a physical attack on a government employee.' },
    { id = 11, Label = 'KIDNAPNING AF EN BETJENT', Fine = 150000, Jail = 240, Points = 3, Color = 'red', Desc = 'The action of abducting a government employee and holding them captive.' },
    { id = 12, Label = 'KIDNAPNING/GIDSEL TAGNING', Fine = 50000, Jail = 120, Points = 2, Color = 'red', Desc = 'The action of abducting someone and holding them captive.' },
    { id = 13, Label = 'TERROR TRUSSLER', Fine = 50000, Jail = 200, Points = 2, Color = 'red', Desc = 'Threaten to commit a crime that would reasonably result in death, terror, serious injury, or serious physical property damage.' },
    { id = 14, Label = 'ARMERET RØVERI', Fine = 50000, Jail = 120, Points = 2, Color = 'red', Desc = 'When someone uses a weapon for violence or the threat of violence to take property from another person.' },
    { id = 15, Label = 'RØVERI', Fine = 50000, Jail = 100, Points = 2, Color = 'red', Desc = 'When someone uses violence or the threat of violence to take property from another person.' },
    { id = 16, Label = 'BANK RØVERI', Fine = 150000, Jail = 240, Points = 3, Color = 'red', Desc = 'The act of robbing a financial institution.' },
    { id = 17, Label = 'BUTIKS RØVERI', Fine = 75000, Jail = 120, Points = 2, Color = 'red', Desc = 'The act of robbing a place of business.' },
    { id = 18, Label = 'HUS RØVERI', Fine = 25000, Jail = 80, Points = 2, Color = 'red', Desc = 'The act of robbing from someones personal dwelling.' },
    { id = 19, Label = 'BESIDELSE AF SORTE PENGE', Fine = 50000, Jail = 60, Points = 1, Color = 'red', Desc = 'Posessing money that has serial numbers that are marked/reported stolen.' },
    { id = 20, Label = 'OVERSKRIDELSE AF FARTGRÆNSEN 40%', Fine = 25000, Jail = 40, Points = 1, Color = 'red', Desc = 'Vehicle is clocked at over 100 MPH over the speed limit.' },
    { id = 21, Label = 'Narkotikafremstilling/DYRKNING', Fine = 25000, Jail = 60, Points = 1, Color = 'red', Desc = 'A type of drug crime involving the growing of plants that are classified as controlled substances. ... Grow, produce, or possess plants with naturally occurring substances that are used in the production of illegal drugs and controlled substances.' },
    { id = 22, Label = 'BESIDELSE AF KLASSE 1 STOFFER', Fine = 25000, Jail = 30, Points = 1, Color = 'red', Desc = 'Drugs with no currently accepted medical use and a high potential for abuse. Some examples of Schedule I drugs are: heroin, lysergic acid diethylamide (LSD), 3,4-methylenedioxymethamphetamine (ecstasy), methaqualone, and peyote.' },
    { id = 23, Label = 'BESIDELSE AF KLASSE 2 STOFFER', Fine = 25000, Jail = 40, Points = 1, Color = 'red', Desc = 'Drugs with a high potential for abuse, with use potentially leading to severe psychological or physical dependence. These drugs are also considered dangerous.' },
    { id = 24, Label = 'HENBLIK PÅ AT SÆLGE/DISTRIBUERER STOFFER', Fine = 25000, Jail = 60, Points = 1, Color = 'red', Desc = 'Intended to sell, deliver, or transfer possession of a controlled substance to another person. Possession with the intent to distribute is a serious offense that is usually charged as a felony.' },
    { id = 25, Label = 'SMUGLING AF STOFFER', Fine = 75000, Jail = 120, Points = 2, Color = 'red', Desc = 'Trade involving the cultivation, manufacture, distribution and sale of substances which are subject to drug prohibition laws.' },
    { id = 26, Label = 'GEMTE KLASSE 1/2 VÅBEN', Fine = 50000, Jail = 120, Points = 2, Color = 'red', Desc = 'A bunch of hidden illegal guns or weapons that have been hidden or stored away.' },
    { id = 27, Label = 'VÅBEN SMUGLING KLASSE 1/2', Fine = 50000, Jail = 120, Points = 2, Color = 'red', Desc = '(Firearms, Gunnery, Ordnance & Artillery) the smuggling of guns and ammunition or other weapons.' },
    { id = 28, Label = 'BESIDELSE AF KLASSE 2/3 VÅBEN', Fine = 40000, Jail = 40, Points = 2, Color = 'red', Desc = ' pertains to machine guns, short or "sawed-off" shotguns and rifles, and so-called "destructive devices" (including grenades, mortars, rocket launchers, large projectiles, and other heavy ordnance).' },
    { id = 29, Label = 'BESIDELSE AF KLASSE 1 VÅBEN', Fine = 20000, Jail = 25, Points = 1, Color = 'red', Desc = 'Title I firearms are ordinary rifles, pistols, revolvers & shotguns. Title I firearms can be owned by citizens and can be built by citizens. Ownership Requirements: must have a firearm licence.' },
    { id = 30, Label = 'FLAGRER MED ET VÅBEN', Fine = 20000, Jail = 30, Points = 1, Color = 'red', Desc = 'Showing the weapon, or exhibiting it to another person in a threatening manner.' },
    { id = 31, Label = 'ULOVLIG AFFYRING AF ET VÅBEN', Fine = 40000, Jail = 60, Points = 1, Color = 'red', Desc = 'Any person who knowingly or recklessly discharges a firearm into any dwelling or any other building or occupied structure, or into any motor vehicle occupied by any person, or into any street with or without a permit commits the offense of illegal discharge of a firearm.' },
    { id = 32, Label = 'IKKE FØLGER EN DOMMERS ODRE OG/ELLER LYVER', Fine = 15000, Jail = 120, Points = 1, Color = 'red', Desc = 'The offense of willfully telling an untruth in a court after having taken an oath or affirmation.' },
    { id = 33, Label = 'FALSK EFTERLIGTNING AF EN STATSANSAT', Fine = 15000, Jail = 200, Points = 1, Color = 'red', Desc = 'Whoever falsely assumes or pretends to be an officer or employee acting under the authority of the United States or any department, agency or officer thereof, and acts as such, or in such pretended character demands or obtains any money, paper, document, or thing of value, shall be fined under this title or imprisoned.' },
    { id = 34, Label = 'BESTIKKELSE AF EN STATSANSAT', Fine = 55000, Jail = 120, Points = 1, Color = 'red', Desc = 'The giving or offering of a bribe.' },
    { id = 35, Label = 'HJÆLPER EN EFTERSØGT MED AT SKJULE SIG', Fine = 55000, Jail = 120, Points = 1, Color = 'red', Desc = 'Knowingly helping someone hide to avoid arrest or criminal prosecution.' },
    { id = 36, Label = 'FLUGTE FRA FORVAREGET', Fine = 55000, Jail = 180, Points = 1, Color = 'red', Desc = 'Voluntary departure from custody which requires that the escapee have knowledge that his/her actions would result in his/her leaving physical confinement without permission.' },
    { id = 37, Label = 'KORRUPTION', Fine = 55000, Jail = 120, Points = 1, Color = 'red', Desc = 'typically involve bribery, gratuities, contract extortion, bid rigging, collusion, conflicts of interest, product substitution, items/services invoiced without delivery, diversion of goods, and corporate and individual conspiracies at various levels of U.S. government operations.' },
    { id = 38, Label = 'CONSPIRACY', Fine = 55000, Jail = 120, Points = 1, Color = 'red', Desc = 'The act of conspiring with others to achieve a criminal act.' },
    

    { id = 39, Label = 'VOLD', Fine = 7500, Jail = 20, Points = 1, Color = 'orange', Desc = 'To make a physical attack.' },
    { id = 40, Label = 'OVERTRÆDELSE AF PROBATION', Fine = 7500, Jail = 30, Points = 1, Color = 'orange', Desc = 'A technical violation of probation or parole is misbehavior by an offender under supervision that is not by itself a criminal offense and generally does not result in arrest (e.g., failing to report for a scheduled office visit, missing a curfew, lack of employment or attendance at school, testing positive for drug or alcohol use, or contacting a victim or co-defendant). Serious technical violations (e.g., escape or repeated failure to report, violent crime) or a pattern of misbehavior, however, while on probation or parole can result in re-imprisonment. With no refund for any fines' },
    { id = 41, Label = 'TRUSLER OM AT GØRE ANDRE SKADE', Fine = 2500, Jail = 10, Points = 1, Color = 'orange', Desc = 'Threat to make a physical attack.' },
    { id = 42, Label = 'KRIMINELLE TRUSLER', Fine = 2500, Jail = 30, Points = 1, Color = 'orange', Desc = 'Makings threats to break a law.' },
    { id = 43, Label = 'STALKING', Fine = 2500, Jail = 30, Points = 1, Color = 'orange', Desc = 'The act of following someone or something very closely and watching its every move.' },
    { id = 44, Label = 'PROSTITUTION', Fine = 2500, Jail = 30, Points = 1, Color = 'orange', Desc = 'Involves engaging, agreeing, or offering to engage in sexual conduct with another person in return for a fee.' },
    { id = 45, Label = 'KRIMINELLE TRUSLER', Fine = 2500, Jail = 30, Points = 1, Color = 'orange', Desc = 'Makings threats to break a law.' },
    { id = 46, Label = 'OFFENTLIG BERUSET', Fine = 2500, Jail = 30, Points = 1, Color = 'orange', Desc = 'Proven that a person is visibly drunk or under the influence of drugs in public.' },
    { id = 47, Label = 'bLOTTELSE', Fine = 2500, Jail = 20, Points = 1, Color = 'orange', Desc = 'The act of outraging public decency by being naked in a public place.' },
    { id = 48, Label = 'UORDENLIG OPFØRSEL', Fine = 2500, Jail = 20, Points = 1, Color = 'orange', Desc = 'Includes, but is not limited to, the use of profanity, loud or boisterous remarks, inappropriate speech, inappropriate suggestive conduct or body movements or comments that could be interpreted by the hearer as being derogatory in nature.' },
    { id = 49, Label = 'DYREMISHANDLING', Fine = 25000, Jail = 45, Points = 2, Color = 'orange', Desc = 'Involves gratuitously inflicting harm, injuring, or killing an animal. The cruelty can be intentional, such as kicking, burning, stabbing, beating, or shooting; or it can involve neglect, such as depriving an animal of water, shelter, food, and necessary medical treatment.' },
    { id = 51, Label = 'KØRT MENS FULD', Fine = 10000, Jail = 30, Points = 1, Color = 'orange', Desc = 'The offense of operating a motor vehicle while intoxicated by drugs or especially alcohol.' },
    { id = 52, Label = 'BIL TYVERI', Fine = 15000, Jail = 30, Points = 1, Color = 'orange', Desc = 'In posession of a stolen vehicle.' },
    { id = 53, Label = 'FLUGT FRA POLITIET', Fine = 15000, Jail = 20, Points = 1, Color = 'orange', Desc = 'Taking law enforcement on a pursuit while intentionally evading.' },
    { id = 54, Label = 'HIT AND RUN', Fine = 10000, Jail = 20, Points = 1, Color = 'orange', Desc = 'Involving a driver who does not stop after causing an accident.' },
    { id = 55, Label = 'KØRSEL UDEN KØREKORT', Fine = 10000, Jail = 20, Points = 1, Color = 'orange', Desc = 'Driver does not have a drivers license to operate a vehicle.' },
    { id = 56, Label = 'KØRSEL UDEN MEDBRAGT KØREKORT', Fine = 10000, Jail = 20, Points = 1, Color = 'orange', Desc = 'Driver does not have a drivers license to operate a vehicle.' },
    { id = 57, Label = 'FOR HØJ HASTIGHED 60%', Fine = 7500, Jail = 10, Points = 1, Color = 'orange', Desc = 'Clocked vehicle speed at over 20 MPH the posted speed limit.' },
    { id = 58, Label = 'TIL FARE FOR ANDRE', Fine = 15000, Jail = 30, Points = 1, Color = 'orange', Desc = 'Whereby a person behaves in a reckless manner which creates a substantial risk of a serious physical injury to another individual.' },
    { id = 59, Label = 'IKKE GADE LOVLIG BIL', Fine = 2500, Jail = 10, Points = 1, Color = 'orange', Desc = 'Illegal modifications.' },
    { id = 60, Label = 'NÆGTER AT VISE ID', Fine = 2500, Jail = 40, Points = 1, Color = 'orange', Desc = 'What the name says.' },
    { id = 61, Label = 'GADE RÆS', Fine = 5500, Jail = 20, Points = 1, Color = 'orange', Desc = 'The act of racing another vehicle on the road. ' },
    { id = 62, Label = 'ORGANISERING AF EN ULOVLIG BEGIVENHED', Fine = 5000, Jail = 25, Points = 1, Color = 'orange', Desc = 'Organizing an event with result of which it becomes and continues to be unlawful for the Company and or personnel.' },
    { id = 63, Label = 'MODSTÅR ARRESTERING', Fine = 2500, Jail = 20, Points = 1, Color = 'orange', Desc = 'Failure to obey orders during an active attempt to arrest.' },
    { id = 64, Label = 'TRESPASSING', Fine = 2500, Jail = 40, Points = 1, Color = 'orange', Desc = 'Enter the owners land or property without permission.' },

    { id = 65, Label = 'FOR HØJ HASTIGHED', Fine = 2500, Jail = 0, Points = 0, Color = 'green', Desc = 'Clocked vehicle speed at over 5 MPH the posted speed limit.' },
    { id = 66, Label = 'BALLADE', Fine = 15000, Jail = 30, Points = 0, Color = 'green', Desc = 'Similar to disorderly conduct, but less severe.' },
    { id = 67, Label = 'IKKE-VEJVÆRDIG KØRETØJ', Fine = 2500, Jail = 0, Points = 0, Color = 'green', Desc = 'Vehicle is too damaged or missing required equiptment to operate legally.' },
    { id = 68, Label = 'HINDRER TRAFIK', Fine = 1000, Jail = 0, Points = 0, Color = 'green', Desc = 'To walk, stand, sit, lie, or place an object in such a manner as to block passage by another person or a driver of a vehicle.' },
    { id = 69, Label = 'TRAFIK BØDE', Fine = 0, Jail = 0, Points = 0, Color = 'green', Desc = 'Any traffic infraction that results in ticket written.' },
    { id = 70, Label = 'BØDE', Fine = 0, Jail = 0, Points = 0, Color = 'green', Desc = 'Any fee that results in ticket written.' },
},
    -- Charges page

    -- Staff page
    -- Staff page

    -- Staff Employees
        -- Change text to what you'd like to be displayed in the nui
        -- Do not change value
        -- Change if the item can be sorted or not (by clicking on it in the nui)
        -- If a divider should be shown, turn true, false ore remove it

        -- (EXAMPLE) VERY IMPORTANT THAT "text" AND "value" ALWAYS EXISTS! REST CAN BE REMOVED IF YOU WANT THAT
        -- {text = 'Call ID', value = 'callid',},
    StaffEmployees = {
        {text = 'Call Sign',        value = 'callsign',         sortable = true,  divider = true},
        {text = 'Navn',             value = 'name',             sortable = false, divider = true},
        {text = 'Rang',             value = 'rank',             sortable = false, divider = true},
        {text = 'Telefon nr.',     value = 'phone',            sortable = false, divider = true},
        {text = 'APU',              value = 'apu',              sortable = false, divider = true},
        {text = 'AIR',              value = 'air',              sortable = false, divider = true},
        {text = 'MC',               value = 'mc',               sortable = false, divider = true},
        {text = 'K9',               value = 'k9',               sortable = false, divider = true},
        {text = 'Strikes',          value = 'strikes',          sortable = false, divider = true},
        {text = 'Responsibilities', value = 'responsibilities', sortable = false, divider = true},
        {text = 'FTO',              value = 'fto',              sortable = false, divider = true},
        {text = 'Actions',          value = 'action',           sortable = false, divider = true}
    },
    -- Staff Employees

    -- Staff academy sheet
    -- Change text to what you'd like to be displayed in the nui
        -- Do not change value
        -- Change if the item can be sorted or not (by clicking on it in the nui)
        -- If a divider should be shown, turn true, false ore remove it

        -- (EXAMPLE) VERY IMPORTANT THAT "text" AND "value" ALWAYS EXISTS! REST CAN BE REMOVED IF YOU WANT THAT
        -- {text = 'Call ID', value = 'callid',},
    AcademySheet = {
        {text = 'Call Sign',        value = 'callsign', sortable = false, divider = true},
        {text = 'Name',             value = 'name',     sortable = false, divider = true},
        {text = 'Driving',          value = 'driving',  sortable = false, divider = true},
        {text = 'Shooting Training',value = 'shooting', sortable = false, divider = true},
        {text = 'Report Writing',   value = 'report',   sortable = false, divider = true},
        {text = 'MDW Access',       value = 'mdw',      sortable = false, divider = true},
        {text = 'Rights',           value = 'rights',   sortable = false, divider = true},
        {text = 'Intro course',     value = 'intro',    sortable = false, divider = true},
        {text = 'Theory Test',      value = 'theory',   sortable = false, divider = true},
        {text = 'Practical Test',   value = 'practical',sortable = false, divider = true},
        {text = 'Actions',          value = 'action',   sortable = false, divider = true}
    },
    -- Staff academy sheet

    -- Staff disciplinary database
    -- Change text to what you'd like to be displayed in the nui
        -- Do not change value
        -- Change if the item can be sorted or not (by clicking on it in the nui)
        -- If a divider should be shown, turn true, false ore remove it

        -- (EXAMPLE) VERY IMPORTANT THAT "text" AND "value" ALWAYS EXISTS! REST CAN BE REMOVED IF YOU WANT THAT
        -- {text = 'Call ID', value = 'callid',},
    Disciplinary = {
        {text = 'Call Sign',            value = 'callsign',     sortable = false, divider = true},
        {text = 'Name',                 value = 'name',         sortable = false, divider = true},
        {text = 'Department',           value = 'department',   sortable = false, divider = true},
        {text = 'Rank',                 value = 'rank',         sortable = false, divider = true},
        {text = 'Punishment',           value = 'punishment',   sortable = false, divider = true},
        {text = 'Date',                 value = 'date',         sortable = false, divider = true},
        {text = 'Given By',             value = 'givenby',      sortable = false, divider = true},
        {text = 'Reason for punishment',value = 'rfp',          sortable = false, divider = true},
        {text = 'Actions',              value = 'action',       sortable = false, divider = true}
    },
    -- Staff disciplinary database

    -- Staff 10 codes
    TenCodes = {
        {text = 'Code',         value = 'code', sortable = false, divider = true},
        {text = 'Description',  value = 'desc', sortable = false, divider = true},
    },
    TenCodesData = {
        {code = '10-0', desc = 'Something'},
        {code = '10-1', desc = 'Something'},
        {code = '10-2', desc = 'Something'},
        {code = '10-3', desc = 'Something'},
        {code = '10-4', desc = 'Something'},
    },

    CMDS = {
        {text = 'Command',      value = 'cmd', sortable = false, divider = true},
        {text = 'Description',  value = 'desc', sortable = false, divider = true},
    },
    CMDSData = {
        {cmd = '/cuff',   desc = 'Cuff player'},
        {cmd = '/sc',     desc = 'Cuff player, but in a dirty way'},
        {cmd = '/jail',   desc = 'Jail player'},
        {cmd = '/unjail', desc = 'Unjail player'},
        {cmd = '/mdw',    desc = 'Open the MDW'},
    },
    -- Staff 10 codes


    -- Legislation page
    Legislations = {
        Tags = {
            {id = 1, label = 'Example 1'},
            {id = 2, label = 'Example 2'},
            {id = 3, label = 'Example 3'},
            {id = 4, label = 'Example 4'},
            {id = 5, label = 'Example 5'},
        }
    },
    -- Legislation page

    -- Configuration page
    Message = { -- This will be shown if there's no message in the database
        Title = 'NO MESSAGE',
        Text = 'Theres currently no message to display, so how about you actually do some work around here?'
    },
    Announcement = {
        Tags = {
            {id = 1, label = 'Example 1'},
            {id = 2, label = 'Example 2'},
            {id = 3, label = 'Example 3'},
            {id = 4, label = 'Example 4'},
            {id = 5, label = 'Example 5'},
        }
    },
    -- Configuration page

    -- Staff roles
    PoliceRoles = { -- Assignable roles, that gives access to certain functions.
        {id = 0, access = false, role = 'Full Access'}, -- Only edit the "role"

        {id = 1, access = false, role = 'Edit Profiles'},

        {id = 2, access = false, role = 'Edit Incidents'},
        {id = 3, access = false, role = 'Create Incidents'},
        {id = 4, access = false, role = 'Delete Incidents'},
        
        {id = 5, access = false, role = 'Edit Reports'},
        {id = 6, access = false, role = 'Create Reports'},
        {id = 7, access = false, role = 'Delete Reports'},

        {id = 8, access = false, role = 'Edit Evidence'},
        {id = 9, access = false, role = 'Create Evidence'},
        {id = 10, access = false, role = 'Delete Evidence'},

        {id = 11, access = false, role = 'Edit Vehicles'},

        {id = 12, access = false, role = 'Staff Employees'},
        {id = 13, access = false, role = 'Academy Sheet'},
        {id = 14, access = false, role = 'Disciplinary Database'},

        {id = 15, access = false, role = 'Legislation'} -- Required if you want to add/delete/edit legislations, full access doesn't have access to this for roleplay reasons!
    }

    -- // NUI CONFIGURABLES // --
    -----------------------------
}

Notifications = {
    ERROR404 = {'something happend, contact the server owner', 'error'}, -- Something happend that shouldnt

    -- Officer notifications
    FiredTarget = {'Target fired and placed as unemployed', 'success'},
    HiredTarget = {'Target hired and placed as police', 'success'},
    FiredNoResult = {'Citizenid could not be found in the database', 'error'},
    SaveStaff = {'Staff profile was saved', 'success'},
    UnitExists = {'A unit with that name already exists', 'error'},

    -- Police notifications
    ProfileSaved = {'Profile was saved', 'success'},
    TargetFired = {'You were fired from the police', 'error'},
    TargetHired = {'You were hired to the police', 'success'},

    -- Basic notifications
    OnDuty = {'You are now on duty', 'success'},
    OffDuty = {'You are now off duty', 'success'},
    TargetOffline = {'Action can not be done, while the target is offline', 'error'},
}