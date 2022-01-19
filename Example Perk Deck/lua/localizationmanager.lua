
Hooks:Add("LocalizationManagerPostInit", "PerkDeckTemplate_OnLocalizationPostInit", function(localizationmgr)
	if BeardLib then 
		--if beardlib is installed, then we don't need to load localization,
		--since beardlib's localization module can handle localization for you, so we do nothing here.
		
		--in this example, the mod is set up to handle it. take a look at the included main.xml
		return
	else
		local path = ModPath .. "loc/english.txt"
		localizationmgr:load_localization_file( path )
		--[[
		--if you wanted to load strings directly via lua for some reason, you could use this code:
		
			localizationmgr:add_localized_strings({
				menu_deck_NEWDECK_title = "The Best Perk Deck Ever",
				menu_deck_NEWDECK_1 = "Never Gonna Give You Up",
				menu_deck_NEWDECK_1_desc = "You and your team gain ##+100%## knowledge of ##the rules##.\n\nYou are ##90%## less likely to be given up.",
				menu_deck_NEWDECK_3 = "Never Gonna Let You Down",
				menu_deck_NEWDECK_3_desc = "You are ##75%## less likely to be let down.",
				menu_deck_NEWDECK_5 = "Never Gonna Run Around",
				menu_deck_NEWDECK_5_desc = "You are ##15% less likely to be ##hurt## by someone ##running around## or ##deserting you.##",
				menu_deck_NEWDECK_7 = "Never Gonna Make You Cry",
				menu_deck_NEWDECK_7_desc = "Your team can no longer ##make you cry##.",
				menu_deck_NEWDECK_9 = "Never Gonna Say Goodbye",
				menu_deck_NEWDECK_9_desc = "You are ##45%## less likely to be ##hurt## by someone ##saying goodbye## or someone ##telling a lie##.\n\nYou also gain an additional ##45%## chance for someone to ##desert you.##"
			})
		
		--]]
	end
end)