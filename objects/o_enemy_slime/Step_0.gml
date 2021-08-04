/// @description
event_inherited();

if speed_ > 3 and state = e_state.idle{
	
	sprite[e_state.idle] = s_slime_hit;
}else{
	sprite[e_state.idle] = s_slime_idle;
}