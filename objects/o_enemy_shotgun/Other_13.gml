/// @description attack
if live_call() return live_result;


finished_attacking = true;

var spd = 5;
create_enemy_bullet(x,y,attack_direction,spd,e_bullet_type.default_bullet);
create_enemy_bullet(x,y,attack_direction-bullet_angle_offset,spd,e_bullet_type.default_bullet);
create_enemy_bullet(x,y,attack_direction+bullet_angle_offset,spd,e_bullet_type.default_bullet);
//create_player_bullet()
//attack_direction
//bullet_angle_offset





can_end_attack();

	