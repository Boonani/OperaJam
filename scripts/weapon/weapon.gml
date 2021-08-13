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


	speed_variation = .6;
	speed_modifier = 0;
	ammo = 99;
	ammo_max = ammo;
	friction_ = 0;
	bounce = 0;
	range_base = 255;
	range_additional = 0;
	range_multiply = 1;
	
	
	undamaged_enemies_damage_mod = 1;
	
	accuracy = 0; 
	
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
	
	
	spawn_new_bullet = 0;
}


function create_weapon (dmg , range, attack_speed) : weapon_parent() constructor{ 
	
	self.damage_base = dmg;
	self.range_base = range;
	self.base_attack_time = attack_speed;
}


enum e_bullet_type { 

	default_bullet,
	friction_shotgun,
	
}


function create_enemy_bullet(_x, _y, dir, spd,  e_bullet_type_enum){
	if live_call(_x, _y, dir, spd,  e_bullet_type_enum) return live_result;
	
	var i = instance_create_depth(_x,_y,DEPTH_BULLET,o_bullet_enemy);
	i.damage = 1;
	
	//var speed_variation_ = random_range(-a.speed_variation  , a.speed_variation );
	i.speed_ = spd;
	
	i.direction_ = dir;
	i.angle = dir;
	i.image_angle = dir;
	i.instance_destroy_timer = SEC*2;
	i.target_array = [o_player];
	i.exclude_array = [o_enemy_parent];
	i.friction_ = .0;
	switch e_bullet_type_enum { 
	
		case e_bullet_type.default_bullet:
		
				i.range = 999; //max range	
				i.sprite_index = s_bullet;
		
		break;		
		case e_bullet_type.friction_shotgun:
				
				i.friction_ = .2;
		
		break;
	}
}

function create_player_bullet(_x, _y,  player_slot){
	if live_call() return live_result;
	var a = o_game.player[player_slot].wep;	


	

	
	var i = instance_create_depth(_x,_y,DEPTH_BULLET,o_bullet_player);
	i.damage = (a.damage_base + a.damage_additional ) * a.damage_multiply;
	i.range = (a.range_base + a.range_additional ) *  a.range_multiply;
	i.target_array = [o_enemy_parent];
	
	var speed_variation_ = random_range(-a.speed_variation  , a.speed_variation );
	
	
	i.speed_ = a.speed_  + speed_variation_;
	i.spawn_new_bullet = a.spawn_new_bullet;
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



var player_object = o_player;

with o_player { 
	
	if slot = player_slot { 
		 player_object = id;
	}
}


x_attack_press = input_struct.right.check - input_struct.left.check;
y_attack_press = input_struct.down.check -  input_struct.up.check;

var dir = point_direction(0,0,x_attack_press, y_attack_press);


if	input_struct.attack_right.check {
	player[player_slot].shoot_direction = 0;
}

if	input_struct.attack_up.check {
	player[player_slot].shoot_direction = 90;
}

if	input_struct.attack_left.check {
	player[player_slot].shoot_direction = 180;
}

if	input_struct.attack_down.check {
	player[player_slot].shoot_direction = 270;
}
	var dis = 24;
	
 
if player[player_slot].wep != noone { 

	player[player_slot].wep.base_attack_timer--;
	
	
	
	if player[player_slot].wep.base_attack_timer <= 0 and player[player_slot].mana >= player[player_slot].mana_bullet_cost * player[player_slot].wep.extra_bullet  { 
	
	if	input_struct.attack_right.check ||
		input_struct.attack_left.check ||
		input_struct.attack_down.check || 
		input_struct.attack_up.check{
			
			var left_attack_speed = 1;
			
			
			if instance_number(o_player) = 1 { 
				//only screenshake with 1 player on the screen other wise it's terrible	
				var dis = 2;
				var xlen = lengthdir_x(dis,player[player_slot].shoot_direction);
				var ylen = lengthdir_y(dis,player[player_slot].shoot_direction);
				
			//	o_game.camera_targetx += xlen;
			//	o_game.camera_targety += ylen;
				
			}
				
			
			if player[player_slot].shoot_direction > 90 and player[player_slot].shoot_direction < 270 {
					
				left_attack_speed =  player[player_slot].wep.left_attack_speed;
			}
	
			
			player[player_slot].wep.base_attack_timer = player[player_slot].wep.base_attack_time * left_attack_speed ;

			
			repeat(player[player_slot].wep.extra_bullet + 1){
			//deduct cost to our mana
			player[player_slot].mana  -= player[player_slot].mana_bullet_cost;
			//create bullet
			var weapon_spread = 30;
			var weapon_spread_change = random_range(-weapon_spread,weapon_spread);
				
				
			player[player_slot].shoot_direction +=  weapon_spread_change * player[player_slot].wep.accuracy;
			
	
			
			
		
						
			var xoffset = lengthdir_x(dis,player[player_slot].shoot_direction);
			var yoffset = lengthdir_y(dis,player[player_slot].shoot_direction);
					
				with player_object { 
					create_player_bullet(x+xoffset,y+yoffset, player_slot);
				
				}
		}
				var xoffset = lengthdir_x(dis,player[player_slot].shoot_direction);
				var yoffset = lengthdir_y(dis,player[player_slot].shoot_direction);

				var xx = random_range(-1,1);
				var yy = random_range(-1,1);
				
				create_animation_effect(s_muzzle_flash,player_object.x+xoffset+xx,player_object.y+yoffset+yy,1,1,0,c_white,1);
		}else{
			player[player_slot].shoot_direction = 0;	
		}
	}
}
step_input(input_struct);

player[player_slot].mana += player[player_slot].mana_regen;

player[player_slot].mana = clamp(player[player_slot].mana,0,player[player_slot].mana_max);

}