/// @description idle state


if live_call() return live_result;
attack_timer--;
if attack_timer <= 0  { //and o_game.rules.enemy_can_attack() { 
	

	scr_additional_idle_to_warning_code();
	//create_animation_effect(s_warning,x,y-25,.25,1,0,c_white,1);

	state = e_state.warning;
	warning_timer = warning_time;
	warning_easing_timer = 0;
	
}