
local paid = true
--if you want this perk deck to be instantly unlocked, change the above "true" to "false" (no quotation marks)




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
--this is a simple function that looks up the cost for a given perk card tier given the above costs table
--however, if the paid var is false, then the cost is instead returned as 0 (unlocked instantly)
local function cost(n)
	return paid and costs[n] or 0
end


Hooks:PostHook(SkillTreeTweakData,"init","NEWPERKDECK_initskilltree",function(self,data)
	
	--(re)define the "generic" cards that all perk decks share
	--due to how overkill has set up localization macros (selectively replacing certain substrings in a localization string),
	--we can't just copy the existing localization ids for the descriptions (the names are fine).
	--luckily, i have a fix for that at the bottom of the file

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
	
	-- the convention for internal perk deck name/desc id naming is more like:
	-- "menu_deck#_title"
	-- where # is replaced by a number. for instance, the name_id for "Crew Chief" is "menu_deck1_title".
	-- this means that this naming convention (eg "menu_deck_NEWDECK_title") is actually unlikely to produce conflicts with payday 2's code,
	-- though it may conflict with other perk deck mods if you don't give your mod a unique enough name. 
	local perk_deck_data = {
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

	table.insert(self.specializations,perk_deck_data)
		
	local NEWDECK_decknumber = #self.specializations or 23
	
	Hooks:Add("LocalizationManagerPostInit", "NEWDECK_addlocalization", function( loc )
		if NEWDECK_decknumber then 
			--used for the name of the perk deck as it appears on other players,
			--since the perk deck index is synced, and the index will vary with custom perk decks
			loc:add_localized_strings({
				["menu_st_spec_" .. tostring(NEWDECK_decknumber)] = loc:text(perk_deck_data.name_id)
			})
		end
		
--		the 'generic' perkdeck cards ("menu_deckall_2_desc" etc) have a macro localization issue when referenced directly
--		so we need to fix it for our deck here and substitute the macro keys with the proper values
--		if a mod has edited the values, that will be a problem, however

		local adjusted_description_2 = loc:text("menu_deckall_2_desc")
		adjusted_description_2 = string.gsub(adjusted_description_2,"$multiperk;","25%%")
		local adjusted_description_4 = loc:text("menu_deckall_4_desc")
		adjusted_description_4 = string.gsub(adjusted_description_4,"$multiperk;","+1")
		adjusted_description_4 = string.gsub(adjusted_description_4,"$multiperk2;","15%%")
		adjusted_description_4 = string.gsub(adjusted_description_4,"$multiperk3;","45%%")
		local adjusted_description_6 = loc:text("menu_deckall_6_desc")
		adjusted_description_6 = string.gsub(adjusted_description_6,"$multiperk;","135%%")
		local adjusted_description_8 = loc:text("menu_deckall_8_desc")
		adjusted_description_8 = string.gsub(adjusted_description_8,"$multiperk;","5%%")
		adjusted_description_8 = string.gsub(adjusted_description_8,"$multiperk2;","20%%")
		
		loc:add_localized_strings({
			menu_deck_NEWDECK_2_desc = adjusted_description_2,
			menu_deck_NEWDECK_4_desc = adjusted_description_4,
			menu_deck_NEWDECK_6_desc = adjusted_description_6,
			menu_deck_NEWDECK_8_desc = adjusted_description_8 
		})
	end)

	
end)