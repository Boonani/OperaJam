// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_input(){

	function input_actions(main_key) constructor{
		
		
		pressed_any_key_movement = false;
		pressed_any_key_attack = false;
		self.main_key = main_key;
		check = false;
		pressed = false;
		released = false;
		step_event = function(){					
			self.check = keyboard_check(main_key); 
			self.pressed = keyboard_check_pressed(main_key); 
			self.released = keyboard_check_released(main_key); 
			
			
			
		}
	}

	input_player_1 = { 
		up : new input_actions(ord("W")),
		down : new input_actions(ord("S")),
		left : new input_actions(ord("A")),
		right : new input_actions(ord("D")),
		
		attack_up : new input_actions(vk_up),
		attack_down : new input_actions(vk_down),
		attack_left : new input_actions(vk_left),
		attack_right : new input_actions(vk_right),
		
		
		pause : new input_actions(vk_escape),
		action : new input_actions(ord("X")),
		back : new input_actions(ord("Z")),
	}
	
	input_player_2 = { 
		up : new input_actions(vk_up),
		down : new input_actions(vk_down),
		left : new input_actions(vk_left),
		right : new input_actions(vk_right),
		pause : new input_actions(vk_escape),
		action : new input_actions(ord("X")),
		back : new input_actions(ord("Z")),
	}

}

function step_input(struct){
	
	struct.up.step_event();
	struct.down.step_event();
	struct.left.step_event();
	struct.right.step_event(); 
	struct.pause.step_event(); 
	struct.action.step_event();
	struct.back.step_event();
	
	
	struct.attack_up.step_event();
	struct.attack_down.step_event();
	struct.attack_left.step_event();
	struct.attack_right.step_event();
	
	
	struct.pressed_any_key_movement = struct.up.check + struct.down.check + struct.left.check + struct.right.check ;
	struct.pressed_any_key_movement = clamp(struct.pressed_any_key_movement,0,1);
	
	
	struct.pressed_any_key_attack = struct.attack_up.check + struct.attack_down.check + struct.attack_left.check + struct.attack_right.check;
	struct.pressed_any_key_attack = clamp(struct.pressed_any_key_attack,0,1);
	
	
}