Hooks:PostHook(SkillTreeTweakData,"init","NEWPERKDECK_initskilltree",function(self,data)
	
	-- the convention for internal perk deck name/desc id naming is more like:
	-- "menu_deck#_title"
	-- where # is replaced by a number. for instance, the name_id for "Crew Chief" is "menu_deck1_title".
	-- this means that this naming convention (eg "menu_deck_NEWDECK_title") is actually unlikely to produce conflicts with payday 2's code,
	-- though it may conflict with other perk deck mods if you don't give your mod a unique enough name. 
	
	--category: current valid categories are:
	--"offensive"
	--"defensive"
	--"covert"
	--"supportive"
	--"versatile"
	--"stealth"
	
	--the category field can either be one of these, or a table containing any number of these categories.
	local perk_deck_data = {
		name_id = "menu_deck_NEWDECK_title",
		desc_id = "menu_deck_NEWDECK_desc",
		category = {
			"mod"
		},
		{
			upgrades = {
				"NEWDECK_upgrade_1"
			},
			cost = 200,
			icon_xy = {0, 5},
			name_id = "menu_deck_NEWDECK_1",
			desc_id = "menu_deck_NEWDECK_1_desc"
		},
		{
			name_id = "menu_deckall_2",
			desc_id = "menu_deckall_fixed_2_desc",
			cost = 300,
			upgrades = {
				"weapon_passive_headshot_damage_multiplier"
			},
			icon_xy = {
				1,
				0
			}
		},
		{
			name_id = "menu_deck_NEWDECK_3",
			desc_id = "menu_deck_NEWDECK_3_desc",
			cost = 400,
			upgrades = {
				"NEWDECK_upgrade_3"
			},
			icon_xy = {0, 3}
		},
		{
			name_id = "menu_deckall_4",
			desc_id = "menu_deckall_fixed_4_desc",
			cost = 600,
			upgrades = {
				"passive_player_xp_multiplier",
				"player_passive_suspicion_bonus",
				"player_passive_armor_movement_penalty_multiplier"
			},
			icon_xy = {
				3,
				0
			}
		},
		{
			name_id = "menu_deck_NEWDECK_5",
			desc_id = "menu_deck_NEWDECK_5_desc",
			cost = 1000,
			upgrades = {
				"NEWDECK_upgrade_5"
			},
			icon_xy = {2, 5}
		},
		{
			name_id = "menu_deckall_6",
			desc_id = "menu_deckall_fixed_6_desc",
			cost = 1600,
			upgrades = {
				"armor_kit",
				"player_pick_up_ammo_multiplier"
			},
			icon_xy = {
				5,
				0
			}
		},
		{
			name_id = "menu_deck_NEWDECK_7",
			desc_id = "menu_deck_NEWDECK_7_desc",
			cost = 2400,
			upgrades = {
				"NEWDECK_upgrade_7"
			},
			icon_xy = {1, 4}
		},
		{
			name_id = "menu_deckall_8",
			desc_id = "menu_deckall_fixed_8_desc",
			cost = 3200,
			upgrades = {
				"weapon_passive_damage_multiplier",
				"passive_doctor_bag_interaction_speed_multiplier"
			},
			icon_xy = {
				7,
				0
			}
		},
		{
			name_id = "menu_deck_NEWDECK_9",
			desc_id = "menu_deck_NEWDECK_9_desc",
			cost = 3200,
			upgrades = {
				"NEWDECK_upgrade_9",
				"player_passive_loot_drop_multiplier"
			},
			icon_xy = {6, 4}
		}
	}
	
	--the specializations table is where all perk decks are stored; we will insert our perk deck data here so that the game can add it and we can equip it
	table.insert(self.specializations,perk_deck_data)
	
	Hooks:Add("LocalizationManagerPostInit", "NEWDECK_addlocalization", function( loc )

	--due to how overkill has set up localization macros (selectively replacing certain substrings in a localization string),
	--we can't just copy the existing localization ids for the descriptions (the names are fine).
	
--		the 'generic' perkdeck cards ("menu_deckall_2_desc" etc) have a macro localization issue when referenced directly
--		so we need to fix it for our deck here and substitute the macro keys with the proper values

		
		local adjusted_description_2 = loc:text(
			"menu_deckall_2_desc",
			{
				["multiperk"] = "25%"
			}
		)
--		adjusted_description_2 = string.gsub(adjusted_description_2,"$","25%%")
		local adjusted_description_4 = loc:text(
			"menu_deckall_4_desc",
			{
				["multiperk"] = "+1",
				["multiperk2"] = "15%",
				["multiperk3"] = "45%"
			}
		)
--		adjusted_description_4 = string.gsub(adjusted_description_4,"$multiperk;","+1")
--		adjusted_description_4 = string.gsub(adjusted_description_4,"$multiperk2;","15%%")
--		adjusted_description_4 = string.gsub(adjusted_description_4,"$multiperk3;","45%%")
		local adjusted_description_6 = loc:text(
			"menu_deckall_6_desc",
			{
				["multiperk"] = "135%"
			}
		)
--		adjusted_description_6 = string.gsub(adjusted_description_6,"$multiperk;","135%%")
		local adjusted_description_8 = loc:text(
			"menu_deckall_8_desc",
			{
				["multiperk"] = "5%",
				["multiperk2"] = "20%"
			}
		)
--		adjusted_description_8 = string.gsub(adjusted_description_8,"$multiperk;","5%%")
--		adjusted_description_8 = string.gsub(adjusted_description_8,"$multiperk2;","20%%")
		
		loc:add_localized_strings({
			menu_deckall_fixed_2_desc = adjusted_description_2,
			menu_deckall_fixed_4_desc = adjusted_description_4,
			menu_deckall_fixed_6_desc = adjusted_description_6,
			menu_deckall_fixed_8_desc = adjusted_description_8 
		})
	end)
	
end)