/// @description warning



if warning_timer <= 0 { 
	
	
	add_movement(attack_direction,6);
	
	finished_attacking = false;
	state = e_state.attack;
	
}

warning_timer--;