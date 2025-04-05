local localization_path = ModPath .. "l10n/english.json"
Hooks:Add("LocalizationManagerPostInit","perkdecktemplate_LocalizationManagerPostInit",function(loc_mgr)
	loc_mgr:load_localization_file(localization_path)
end)