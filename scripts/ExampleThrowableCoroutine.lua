PlayerAction.ExampleThrowableCoroutine = {
	Priority = 1,
	Function = function(example_data)
		log("ExampleThrowableCoroutine started. In 10 seconds, you should get a log message. Here's the data passed to your coroutine from PlayerManager:_attempt_THROWABLE_NAME():",example_data)
		
		local timer = TimerManager:game()
		local on_enemy_killed_key = "example_throwable_event_onenemykilled" -- unique string identifier for this callback, so we can remove it later
		
		local end_t = timer:time() + example_data
		
		managers.player:register_message(Message.OnEnemyKilled, on_enemy_killed_key, function(weapon_unit, variant, enemy_unit)
			-- this code will execute when the player gets a kill
			log("You got a kill while the ability was active! Gold star!",weapon_unit,variant,enemy_unit)
		end)
		
		while true do
			local dt = coroutine.yield()
			local now = timer:time()
			
			if now >= end_t then
				-- completed the 10 second duration, so exit the loop
				log("Timer expired.")
				break
			end
		end
		
		-- cleanup! tell the game to no longer execute our on-kill callback, since the ability has ended
		managers.player:unregister_message(Message.OnEnemyKilled, on_enemy_killed_key)
		
		log("ExampleThrowableCoroutine ended! Congrats, that means there were no errors!")
	end
}