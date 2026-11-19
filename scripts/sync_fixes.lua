-- last updated 18 Nov 2026
--networking fixes (to not crash other players)
-- this script is only necessary if you have a custom throwable!
-- if your perk deck does not have one, you don't need to include this in your perk deck mod files

Hooks:OverrideFunction(PlayerManager,"update_grenades_to_peer",function(self, peer)
	local peer_id = managers.network:session():local_peer():id()

	if self._global.synced_grenades[peer_id] then
		local grenade = self._global.synced_grenades[peer_id].grenade
		local tweak = tweak_data.blackmarket.projectiles[grenade]
		if tweak.based_on then 
			grenade = tweak.based_on
		end
		local amount = self._global.synced_grenades[peer_id].amount

		peer:send_queued_sync("sync_grenades", grenade, Application:digest_value(amount, false), 0)
	end
end)

Hooks:OverrideFunction(PlayerManager,"update_grenades_amount_to_peers",function(self, grenade, amount, register_peer_id)
	local peer_id = managers.network:session():local_peer():id()
	
	-- modded section below
	local tweak = tweak_data.blackmarket.projectiles[grenade]
	if tweak.based_on then 
		grenade = tweak.based_on
	end
	-- end modded section
		
	managers.network:session():send_to_peers_synched("sync_grenades", grenade, amount, register_peer_id or 0)
	self:set_synced_grenades(peer_id, grenade, amount, register_peer_id)
end)

--fixes the synced (spoofed) grenade data being used for the actual data- specifically, cooldown
Hooks:OverrideFunction(PlayerManager,"add_grenade_amount",function(self, amount, sync)
	local peer_id = managers.network:session():local_peer():id()
	local grenade = managers.blackmarket:equipped_grenade() --self._global.synced_grenades[peer_id].grenade
	local tweak = tweak_data.blackmarket.projectiles[grenade]
	local max_amount = self:get_max_grenades_by_peer_id(peer_id)
	local icon = tweak.icon
	local previous_amount = self._global.synced_grenades[peer_id].amount

	if amount > 0 and tweak.base_cooldown then
		managers.hud:animate_grenade_flash(HUDManager.PLAYER_PANEL)
	end

	amount = math.min(Application:digest_value(previous_amount, false) + amount, max_amount)

	if amount < max_amount and tweak.base_cooldown then
		self:replenish_grenades(tweak.base_cooldown)
	end

	managers.hud:set_teammate_grenades_amount(HUDManager.PLAYER_PANEL, {
		icon = icon,
		amount = amount
	})
	self:update_grenades_amount_to_peers(grenade, amount, sync and peer_id)
	
	if self:got_max_grenades() and self._coroutine_mgr:is_running("regain_throwable_from_ammo") then
		self:remove_coroutine("regain_throwable_from_ammo")
	end
	
	return amount
end)