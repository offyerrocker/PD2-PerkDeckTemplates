Hooks:PostHook(UpgradesTweakData,"_init_pd2_values","NEWDECK_init_pd2_values",function(self)
--	self.byp_multikill_buff_dodge_chance = 0.4
end)
Hooks:PostHook(UpgradesTweakData,"_weapon_definitions","NEWDECK_upgradestweak__weapon_definitions",function(self)
--	self.values.weapon.byp_head_mult = {1.5}
end)

Hooks:PostHook(UpgradesTweakData,"_player_definitions","NEWDECK_init_player_definitions",function(self)
	self.values.player.UPGRADE_VALUE_1 = {12345}
	self.values.player.UPGRADE_VALUE_3 = {33}
	self.values.player.UPGRADE_VALUE_5 = {55}
	self.values.player.UPGRADE_VALUE_7 = {77}
	self.values.player.UPGRADE_VALUE_9 = {99}
	
	self.definitions.NEWDECK_upgrade_1 = {
		name_id = "NEWDECK_upgrade_id_1", --name_id field doesn't matter
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "UPGRADE_VALUE_1",
			category = "player"
		}
	}
	self.definitions.NEWDECK_upgrade_3 = {
		name_id = "NEWDECK_upgrade_id_3",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "UPGRADE_VALUE_3",
			category = "player"
		}
	}
	self.definitions.NEWDECK_upgrade_5 = {
		name_id = "NEWDECK_upgrade_id_5",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "UPGRADE_VALUE_5",
			category = "player"
		}
	}
	self.definitions.NEWDECK_upgrade_7 = {
		name_id = "NEWDECK_upgrade_id_7",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "UPGRADE_VALUE_7",
			category = "player"
		}
	}
	self.definitions.NEWDECK_upgrade_9 = {
		name_id = "NEWDECK_upgrade_id_9",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "UPGRADE_VALUE_9",
			category = "player"
		}
	}
end)