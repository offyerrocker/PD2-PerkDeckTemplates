local localization_path = ModPath .. "localization/english.json"
Hooks:Add("LocalizationManagerPostInit","QuickChat_LocalizationManagerPostInit",function(localizationmanager)
	if not BeardLib then 
		localizationmanager:load_localization_file(localization_path)
	end
end)