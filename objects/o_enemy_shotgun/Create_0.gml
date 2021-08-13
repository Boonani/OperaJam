/// @description Insert description here
event_inherited();

entity_enemy(10);

depth = DEPTH_ENEMY;

sprite[e_state.hit] = s_shotgun_enemy;
sprite[e_state.idle] = s_shotgun_enemy;
sprite[e_state.warning] = s_shotgun_enemy;
sprite[e_state.attack] = s_shotgun_enemy;

amount_of_bullets = 3;
bullet_angle_offset = 25;

warning_easing_timer = SEC*.5;
bullet_angle_offset = 25;
attack_direction = 0;


scr_additional_idle_to_warning_code = function(){ 
	
		var player = instance_nearest(x,y,o_player);
		attack_direction = point_direction(x,y,player.x,player.y);
}
