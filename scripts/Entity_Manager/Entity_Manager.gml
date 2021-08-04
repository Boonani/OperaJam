// Script assets have changed for v2.3.0 see

enum e_player_state { 
	move,
	cutscene,
	size_
}

//players, enemies, anything that interacts with bullets
function entity_parent() {
	invincibile_ = false;

	mana  = 10;
	mana_max = mana;
	mana_regen = .2;
	mana_bullet_cost = 2;

	warning_easing_timer = 0;
	warning_easing_time = SEC;

	hit_flash_time = SEC*.55;
	hit_flash_timer = 0;
	
	warning_time = SEC*1.5;
	was_hit_by_hitbox_array = [];
	
	self.hp = 2;
	self.hp_max = 2;
	base_damage = 1;
	hitbox = s_tile;
	
	x_input = 0;
	y_input = 0;
	
	x_last_press = false;
	y_last_press = false;
	
	max_speed = 2;
	lerp_speed = .4;
	direction_ = 0;
	
	x_speed = 0;
	y_speed = 0;
	friction_ = .1;
	speed_ = 0;


	

}


//inherit the entity parent and add additional variables for enemies
function entity_enemy(hp) {
	entity_parent();
	
	attack_direction = 0;
	initialize_attack_timer = 0;
	attack_timer = 0;
	scr_additional_idle_to_warning_code = function(){ 
		
	}
	self.hp = hp;
	self.max_hp = self.hp;
	finished_attacking = false;
	
	scr_attack_timer = function(){
		
		return	random_range(SEC*3,SEC*5); //interval in betwen attacks
	}
	
	max_speed = 5;//maximum speed enemies can move


}


//at the attack state, allows us to switch back to idle
function can_end_attack() {  
	if finished_attacking = true{
		attack_timer = scr_attack_timer();
		state = e_state.idle;	
	}
}



//are we pressing keys
function check_input( input_struct) { 
	x_last_press = input_struct.right.check - input_struct.left.check;
	y_last_press = input_struct.down.check -  input_struct.up.check;
	

	
	direction_ = point_direction(0,0, x_last_press,y_last_press);
	
	if x_last_press = 0 and y_last_press = 0{ 
			speed_ = 0;// lerp(speed_,0,.9);
		}else{
			max_speed = 1.1;
			lerp_speed = .9;
			add_movement( direction_ , lerp_speed);	
	}
}


//all player data is handled in  o_game 
function playable_character(hp) : entity_parent(hp) constructor{
	
	self.max_hp = hp;
	self.hp = hp;
	shoot_direction = 0;
}


function change_player_health(player_slot, health_change){ 
	o_game.player[player_slot].hp += health_change;
	o_game.player[player_slot].hp = clamp(o_game.player[player_slot].hp,0,o_game.player[player_slot].hp_max);
}
