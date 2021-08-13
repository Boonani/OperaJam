/// @description Insert description here
// You can write your code in this editor
if live_call() return live_result;

if hurtbox_entity_can_be_hit_by(other){
	hit_flash_timer	= 0;
	
	hp -= other.damage;

		if other.player_slot != noone and other.spawn_new_bullet > 0  { 
			
			
			
			
			var s = create_player_bullet(x, y,  other.player_slot);
			
			if instance_number(o_enemy_parent) > 1 { 
			var enemy_ = instance_nearest_nth(x,y,o_enemy_parent,2);
			var dir = point_direction(x,y,enemy_.x,enemy_.y);
			}else{
				dir = random(360);	
			}
			s.direction_ = dir;
			s.angle = dir;
			s.image_angle = dir;
			s.exclude_array = [id];
			s.target_array = [o_enemy_parent];
			s.spawn_new_bullet = other.spawn_new_bullet;
	
				var xx = random_range(-1,1);
				var yy = random_range(-1,1);
				
				create_animation_effect(s_muzzle_flash,x+xx,y+yy,1,1,0,c_white,1);
	
			
		}
		
	if hp <= 0 { 		
		
		instance_destroy();
	}
}