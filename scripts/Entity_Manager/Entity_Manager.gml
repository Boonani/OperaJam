// Script assets have changed for v2.3.0 see

function entity_parent() constructor {
	
	invincibile_ = false;

	mana  = 10;
	mana_max = mana;
	mana_regen = .2;
	mana_bullet_cost = 2;



	hit_flash_time = SEC*.06;
	hit_flash_timer = 0;
	
	
	was_hit_by_hitbox_array = [];
	
	self.hp = 1;
	self.hp_max = self.hp;
	base_damage = 0;
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
	
	step_event = function() {
		
	}
}

function entity_enemy(hp) : entity_parent(hp) constructor{

	self.hp = hp;
	self.max_hp = self.hp;
}


function check_input( input_struct) { 

	if live_call(input_struct) return live_result;

	x_last_press = input_struct.right.check - input_struct.left.check;
	y_last_press = input_struct.down.check -  input_struct.up.check;
	
	/*
	if input_struct.right.pressed { 
		x_last_press = input_struct.right.pressed;
	}
	if input_struct.left.pressed{  
		x_last_press = -input_struct.left.pressed;
	}
	if input_struct.up.pressed{ 
		y_last_press = -input_struct.up.pressed;
	}
	if input_struct.down.pressed {  
		y_last_press = input_struct.down.pressed;
	}
	*/
	
	direction_ = point_direction(0,0, x_last_press,y_last_press);
	
	if x_last_press = 0 and y_last_press = 0{ 
			speed_ = 0;// lerp(speed_,0,.9);
		}else{
			max_speed = 1.1;
			lerp_speed = .9;
			add_movement( direction_ , lerp_speed);	
	}
}



function playable_character(hp) : entity_parent() constructor{
	self.max_hp = hp;
	self.hp = hp;
	shoot_direction = 0;
}


function initialize_enemy(hp, sprite) : entity_parent() constructor{
	self.hp = hp;
	self.sprite = sprite;
}