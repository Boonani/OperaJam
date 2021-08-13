/// @description warning
if live_call() return live_result;



if warning_timer <= 0 { 
	

	finished_attacking = false;
	state = e_state.attack;
	
}

warning_timer--;