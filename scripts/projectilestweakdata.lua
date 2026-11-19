Hooks:PostHook(BlackMarketTweakData,"_init_projectiles","PERKDECKTEMPLATE_blackmarkettweakdata_init_projectiles",function(self,_tweak_data)
	self.projectiles.THROWABLE_NAME = {
		name_id = "bm_grenade_THROWABLE_NAME",
		desc_id = "bm_grenade_THROWABLE_NAME_desc",
		icon = "hud_THROWABLE_NAME",
		ability = true,
		custom = true,
		ignore_statistics = true,
		based_on = "damage_control",
		texture_bundle_folder = "YOURPERKDECKDLCNAME",
		max_amount = 1,
		base_cooldown = 10
	}
	table.insert(self._projectiles_index,"THROWABLE_NAME")
end)