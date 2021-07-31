// Script assets have changed for v2.3.0 see
function weapon_parent() constructor {
	
	if live_call() return live_result;
	
	
	name = "";
	desc = "";
	sprite_weapon = s_weapon;
	sprite_muzzle = s_muzzle_flash;
	sprite_bullet = s_bullet;
	damage_base = 1;
	damage_additional = 0;
	damage_multiply = 0;
	crit_percent = 0;
	crit_multiply = 1;
	color = C_RED;
	base_speed = 8.5;
		
	speed_ = 8;
	
	speed_modifier = 0;
	ammo = 99;
	ammo_max = ammo;
	friction_ = 0;
	bounce = 0;
	range_base = 255;
	range_additional = 0;
	range_multiply = 1;
	
	base_attack_time = SEC*.25;
	
	instance_destroy_timer = SEC*4;
	
	base_attack_timer = 0;
	damage_variance = 1;
	sound_fire = noone;
	
	chaining = 0;
	chaining_damage_mod = 0;
	sine_intensity = 0;
	homing = 0;
	
	extra_bullet = 0;
	extra_bullet_direction_variance = 0;
	extra_bullet_speed_speed_variance = 0;
}


function create_weapon (dmg , range, attack_speed) : weapon_parent() constructor{ 
	
	self.damage_base = dmg;
	self.range_base = range;
	self.base_attack_time = attack_speed;
}

function create_player_bullet(_x, _y, _obj, player_slot){
	if live_call(_x, _y, _obj, player_slot) return live_result;

	var a = o_game.player[player_slot].wep;	

	#macro DEPTH_BULLET -4000
	
	var i = instance_create_depth(_x,_y,DEPTH_BULLET,o_bullet_player);
	i.damage = (a.damage_base + a.damage_additional ) * a.damage_multiply;
	i.range = (a.range_base + a.range_additional ) *  a.range_multiply;
	i.speed_ = a.speed_;
	
	i.direction_ = o_game.player[player_slot].shoot_direction;
	i.angle = o_game.player[player_slot].shoot_direction;
	i.image_angle = o_game.player[player_slot].shoot_direction;
	i.friction_ = 0; 
	i.sprite_index = a.sprite_bullet;
	i.instance_destroy_timer = a.instance_destroy_timer;
	
	if instance_exists(o_player) {
	
		with i { 
			if o_player.speed_ > 0 { 
				//x_speed += 15;
				
			
			
			var sub = abs( o_player.direction_ - o_game.player[player_slot].shoot_direction);
			
			var pd = o_player.direction_;
			var dd = angle_difference(o_game.player[player_slot].shoot_direction, pd);
			
			debug(dd);
			if abs(dd) <= 100 {
				direction_ -= min(abs(dd), 20) * sign(dd);
			}
		//	debug("TEST");
		//	add_movement(o_player.direction_,o_player.speed_ + 	a.speed_);
			}
		}
	
	}
	
	sprite_set_live(a.sprite_bullet , 1);
	

	return i;
}