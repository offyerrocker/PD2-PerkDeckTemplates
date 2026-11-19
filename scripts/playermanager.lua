function PlayerManager:_attempt_THROWABLE_NAME()

	log("Hi! I see you've pressed the throwable button.")
	
	-- skip execution 
	if self._coroutine_mgr:is_running("example_coroutine") then
		log("example_coroutine is already running")
		return false
	end
	
	
	-- you can pass any data you want to the coroutine (any number of arguments, any data type)
	-- in this case, we'll use this as the duration of the throwable;
	local example_data = 10
	
	self:add_coroutine("example_coroutine", PlayerAction.ExampleThrowableCoroutine, example_data)
	
	return true
end