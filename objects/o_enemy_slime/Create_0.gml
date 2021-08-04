/// @description Insert description here
event_inherited();

entity_enemy(10);

friction_ = .05;

#macro DEPTH_ENEMY -4000

depth = DEPTH_ENEMY;

sprite[e_state.hit] = s_slime_hit;
sprite[e_state.idle] = s_slime_idle;
sprite[e_state.warning] = s_slime_idle;
sprite[e_state.attack] = s_slime_idle;


scr_additional_idle_to_warning_code = function(){ 
	
}
