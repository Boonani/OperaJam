// Script assets have changed for v2.3.0 see
function weapon_parent() constructor {
	
	
	name = "";
	desc = "";
	sprite_weapon = s_weapon;
	sprite_muzzle = s_muzzle_flash;
	sprite_bullet = s_bullet;
	damage_base = 1;
	damage_additional = 0;
	damage_multiply = 1;
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
	
	
	undamaged_enemies_damage_mod = 1;
	
	accuracy = 1; 
	
	base_attack_time = SEC*.25;
	
	instance_destroy_timer = SEC*4;
	
	base_attack_timer = 0;
	damage_variance = 1;
	sound_fire = noone;
	left_attack_speed = 1;
	chaining = 0;
	chaining_damage_mod = 0;
	sine_intensity = 0;
	homing = 0;
	horizontal_attack_speed_multiplier = 1;
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
				direction_ -= min(abs(dd), 15) * sign(dd);
				}
			}
		}
	}
	return i;
}

function Game_Player_Step_Event(input_struct , player_slot){
if live_call(input_struct , player_slot) return live_result;


x_attack_press = input_struct.right.check - input_struct.left.check;
y_attack_press = input_struct.down.check -  input_struct.up.check;

var dir = point_direction(0,0,x_attack_press, y_attack_press);


if	input_struct.attack_right.pressed {
	player[player_slot].shoot_direction = 0;
}

if	input_struct.attack_up.pressed {
	player[player_slot].shoot_direction = 90;
}

if	input_struct.attack_left.pressed {
	player[player_slot].shoot_direction = 180;
}

if	input_struct.attack_down.pressed {
	player[player_slot].shoot_direction = 270;
}

	
 
if player[player_slot].wep != noone { 

	player[player_slot].wep.base_attack_timer--;
	
	
	
	if player[player_slot].wep.base_attack_timer <= 0 and player[player_slot].mana >= player[player_slot].mana_bullet_cost { 
	
	if	input_struct.attack_right.check ||
		input_struct.attack_left.check ||
		input_struct.attack_down.check || 
		input_struct.attack_up.check{
			
			//deduct cost to our mana
			player[player_slot].mana  -= player[player_slot].mana_bullet_cost;
			//create bullet
			player[player_slot].wep.base_attack_timer = player[player_slot].wep.base_attack_time;
			var dis = 24;
						
			var xoffset = lengthdir_x(dis,player[player_slot].shoot_direction);
			var yoffset = lengthdir_y(dis,player[player_slot].shoot_direction);
					
			with o_player { 
				create_player_bullet(x+xoffset,y+yoffset,o_bullet_player, player_slot);
					var xx = random_range(-1,1);
					var yy = random_range(-1,1);
					create_animation_effect(s_muzzle_flash,x+xoffset+xx,y+yoffset+yy,1,1,0,c_white,1);
			}
		}else{
			player[player_slot].shoot_direction = 0;	
		}
	}
}
step_input(input_struct);

player[player_slot].mana += player[player_slot].mana_regen;

player[player_slot].mana = clamp(player[player_slot].mana,0,player[player_slot].mana_max);

}