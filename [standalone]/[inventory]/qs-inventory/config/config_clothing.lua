
--░█████╗░██╗░░░░░░█████╗░████████╗██╗░░██╗██╗███╗░░██╗░██████╗░
--██╔══██╗██║░░░░░██╔══██╗╚══██╔══╝██║░░██║██║████╗░██║██╔════╝░
--██║░░╚═╝██║░░░░░██║░░██║░░░██║░░░███████║██║██╔██╗██║██║░░██╗░
--██║░░██╗██║░░░░░██║░░██║░░░██║░░░██╔══██║██║██║╚████║██║░░╚██╗
--╚█████╔╝███████╗╚█████╔╝░░░██║░░░██║░░██║██║██║░╚███║╚██████╔╝
--░╚════╝░╚══════╝░╚════╝░░░░╚═╝░░░╚═╝░░╚═╝╚═╝╚═╝░░╚══╝░╚═════╝░

Config.Drawables = { --Modify here the values of the clothes and the gender.
    ["Hat"] = {
        Prop = 0,
        Emote = {
            On = {Dict = "mp_masks@standard_car@ds@", Anim = "put_on_mask", Move = 51, Dur = 600},
            Off = {Dict = "missheist_agency2ahelmet", Anim = "take_off_helmet_stand", Move = 51, Dur = 1200}
        }
    },
	["Mask"] = {
		Drawable = 1,
		Table = {Standalone = true, Male = 0, Female = 0 },
		Emote = {Dict = "mp_masks@standard_car@ds@", Anim = "put_on_mask", Move = 51, Dur = 800}
	},
	["Glasses"] = {
		Prop = 1,
		Emote = {
			On = {Dict = "clothingspecs", Anim = "take_off", Move = 51, Dur = 1400},
			Off = {Dict = "clothingspecs", Anim = "take_off", Move = 51, Dur = 1400}
		}
	},
	["Top"] = {
		Drawable = 11,
		Table = Variations.Jackets,
		Emote = {Dict = "missmic4", Anim = "michael_tux_fidget", Move = 51, Dur = 1500}
	},
    ["Shirt"] = { -- Working
		Drawable = 11,
		Table = { Standalone = true, Male = 252, Female = 74,
        Extra = { 
            {Drawable = 8, Id = 15, Tex = 0, Name = "Extra Undershirt"},
            {Drawable = 3, Id = 15, Tex = 0, Name = "Extra Gloves"},
            {Drawable = 10, Id = 0, Tex = 0, Name = "Extra Decals"},
            }
        },
		Emote = {Dict = "clothingtie", Anim = "try_tie_negative_a", Move = 51, Dur = 1200}
	},
	["Vest"] = {
		Drawable = 9,
		Table = {Standalone = true, Male = 0, Female = 0 },
		Emote = {Dict = "clothingtie", Anim = "try_tie_negative_a", Move = 51, Dur = 1200}
	},
	["Pants"] = {
		Drawable = 4,
		Table = {Standalone = true, Male = 61, Female = 14},
		Emote = {Dict = "re@construction", Anim = "out_of_breath", Move = 51, Dur = 1300}
	},
	["Shoes"] = {
		Drawable = 6,
		Table = {Standalone = true, Male = 34, Female = 35},
		Emote = {Dict = "random@domestic", Anim = "pickup_low", Move = 0, Dur = 1200}
	},
	["Bagoff"] = {
		Drawable = 5,
		Table = {Standalone = true, Male = 0, Female = 0},
		Emote = {Dict = "clothingtie", Anim = "try_tie_negative_a", Move = 51, Dur = 1200}
	},
	["Gloves"] = {
		Drawable = 3,
		Table = Variations.Gloves,
		Remember = true,
		Emote = {Dict = "nmt_3_rcm-10", Anim = "cs_nigel_dual-10", Move = 51, Dur = 1200}
	},
	["Watch"] = {
		Prop = 6,
		Emote = {
			On = {Dict = "nmt_3_rcm-10", Anim = "cs_nigel_dual-10", Move = 51, Dur = 1200},
			Off = {Dict = "nmt_3_rcm-10", Anim = "cs_nigel_dual-10", Move = 51, Dur = 1200}
		}
	},
}

Config.Clothing = { --Don't touch this.
    ["hat"] = {
        Action = function() ToggleProps("Hat") end,
    },

    ["mask"] = {
		Action = function() ToggleClothing("Mask") end,
	},

    ["glasses"] = {
		Action = function() ToggleProps("Glasses") end,
	},

    ["top"] = {
		Action = function() ToggleClothing("Top") end,
	},

    ["shirt"] = {
		Action = function() ToggleClothing("Shirt") end,
	},

    ["vest"] = {
		Action = function() ToggleClothing("Vest") end,
	},

    ["pants"] = {
		Action = function() ToggleClothing("Pants", true) end,
	},

    ["shoes"] = {
		Action = function() ToggleClothing("Shoes") end,
	},

    ["bag"] = {
		Action = function() ToggleClothing("Bagoff") end,
		Rotation = 5.0
	},

    ["gloves"] = {
		Action = function() ToggleClothing("Gloves") end,
	},

	["watch"] = {
		Action = function() ToggleProps("Watch") end,
		Rotation = 5.0
	},
}

Extras = {
	["Shirt"] = {
		Drawable = 11,
		Table = Config.Drawables["Shirt"].Table,
		Emote = {Dict = "clothingtie", Anim = "try_tie_negative_a", Move = 51, Dur = 1200}
	},
	["Pants"] = {
		Drawable = Config.Drawables["Pants"].Drawable,
		Table = Config.Drawables["Pants"].Table,
		Emote = {Dict = "re@construction", Anim = "out_of_breath", Move = 51, Dur = 1300}
	},
}

Props = {
	["Hat"] = {
		Prop = 0,
		Emote = {
			On = {Dict = "mp_masks@standard_car@ds@", Anim = "put_on_mask", Move = 51, Dur = 600},
			Off = {Dict = "missheist_agency2ahelmet", Anim = "take_off_helmet_stand", Move = 51, Dur = 1200}
		}
	},
	["Glasses"] = {
		Prop = 1,
		Emote = {
			On = {Dict = "clothingspecs", Anim = "take_off", Move = 51, Dur = 1400},
			Off = {Dict = "clothingspecs", Anim = "take_off", Move = 51, Dur = 1400}
		}
	},
	["Watch"] = {
		Prop = 6,
		Emote = {
			On = {Dict = "nmt_3_rcm-10", Anim = "cs_nigel_dual-10", Move = 51, Dur = 1200},
			Off = {Dict = "nmt_3_rcm-10", Anim = "cs_nigel_dual-10", Move = 51, Dur = 1200}
		}
	},
}

if not Config.ClothingAsItems then
	for k,v in pairs(Config.Clothing) do
		RegisterCommand(k, v.Action)
	end
end