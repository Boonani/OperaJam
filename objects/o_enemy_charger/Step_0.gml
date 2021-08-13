/// @description
event_inherited();

if direction_ < 90 and direction_ < 270 { 

	image_xscale = -1;

	
}


if speed_ > 3 and state = e_state.idle{
	
	sprite[e_state.idle] = s_charger_hit;
}else{
	sprite[e_state.idle] = s_charger_idle;
}