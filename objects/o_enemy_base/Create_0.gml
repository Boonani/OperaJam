/// @description Insert description here
event_inherited();

entity_enemy(10);

friction_ = .05;



depth = DEPTH_ENEMY;

sprite[e_state.hit] = s_charger_hit;
sprite[e_state.idle] = s_charger_idle;
sprite[e_state.warning] = s_charger_idle;
sprite[e_state.attack] = s_charger_idle;


scr_additional_idle_to_warning_code = function(){ 
	
}
