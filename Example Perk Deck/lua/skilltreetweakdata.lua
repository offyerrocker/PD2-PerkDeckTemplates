
local paid = true
--if you want this perk deck to be instantly unlocked, change the above "true" to "false" (no quotation marks)




Hooks:PostHook(SkillTreeTweakData,"init","NEWPERKDECK_initskilltree",function(self,data)
	local costs = {
		[1] = 200,
		[2] = 300,
		[3] = 400,
		[4] = 600,
		[5] = 1000,
		[6] = 1600,
		[7] = 2400,
		[8] = 3200,
		[9] = 4000
	}
	local function cost(n)
		return paid and costs[n] or 0
	end

	local deck2 = {
		cost = cost(2),
		desc_id = "menu_deckall_2_desc",
		name_id = "menu_deckall_2",
		upgrades = {
			"weapon_passive_headshot_damage_multiplier"
		},
		icon_xy = {
			1,
			0
		}
	}
	local deck4 = {
		cost = cost(4),
		desc_id = "menu_deckall_4_desc",
		name_id = "menu_deckall_4",
		upgrades = {
			"passive_player_xp_multiplier",
			"player_passive_suspicion_bonus",
			"player_passive_armor_movement_penalty_multiplier"
		},
		icon_xy = {
			3,
			0
		}
	}
	local deck6 = {
		cost = cost(6),
		desc_id = "menu_deckall_6_desc",
		name_id = "menu_deckall_6",
		upgrades = {
			"armor_kit",
			"player_pick_up_ammo_multiplier"
		},
		icon_xy = {
			5,
			0
		}
	}
	local deck8 = {
		cost = cost(8),
		desc_id = "menu_deckall_8_desc",
		name_id = "menu_deckall_8",
		upgrades = {
			"weapon_passive_damage_multiplier",
			"passive_doctor_bag_interaction_speed_multiplier"
		},
		icon_xy = {
			7,
			0
		}
	}

	table.insert(self.specializations,
		{
			name_id = "menu_deck_NEWDECK_title",
			desc_id = "menu_deck_NEWDECK_desc",
			{
				upgrades = {
					"NEWDECK_upgrade_1"
				},
				cost = cost(1),
				icon_xy = {0, 5},
				name_id = "menu_deck_NEWDECK_1",
				desc_id = "menu_deck_NEWDECK_1_desc"
			},
			deck2,
			{
				upgrades = {
					"NEWDECK_upgrade_3"
				},
				cost = cost(3),
				icon_xy = {0, 3},
				name_id = "menu_deck_NEWDECK_3",
				desc_id = "menu_deck_NEWDECK_3_desc"
			},
			deck4,
			{
				upgrades = {
					"NEWDECK_upgrade_5"
				},
				cost = cost(5),
				icon_xy = {2, 5},
				name_id = "menu_deck_NEWDECK_5",
				desc_id = "menu_deck_NEWDECK_5_desc"
			},
			deck6,
			{
				upgrades = {
					"NEWDECK_upgrade_7"
				},
				cost = cost(7),
				icon_xy = {1, 4},
				name_id = "menu_deck_NEWDECK_7",
				desc_id = "menu_deck_NEWDECK_7_desc"
			},
			deck8,
			{
				upgrades = {
					"NEWDECK_upgrade_9"
				},
				cost = cost(9),
				icon_xy = {6, 4},
				name_id = "menu_deck_NEWDECK_9",
				desc_id = "menu_deck_NEWDECK_9_desc"
			}
		}
	)
	
	_G.NEWDECK_decknumber = #self.specializations or 24

end)

Hooks:Add("LocalizationManagerPostInit", "NEWDECK_addlocalization", function( loc )
	local path = ModPath .. "loc/"
	
	for _, filename in pairs(file.GetFiles(path)) do
		local str = filename:match('^(.*).txt$')
		if str and Idstring(str) and Idstring(str):key() == SystemInfo:language():key() then
			loc:load_localization_file(path .. filename)
			return
		end
	end
	loc:load_localization_file(path .. "localization/english.txt")
	
	loc:add_localized_strings({
		["menu_deck" .. tostring(NEWDECK_decknumber)] = "NEW PERK DECK NAME"
	})
end)
