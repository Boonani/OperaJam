// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Game_Player_Step_Event(input_struct , player_slot){

if live_call(input_struct) return live_result;

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
			with o_player { 
				create_player_bullet(x,y,o_bullet_player, player_slot);
			}
			
		}else{
			shoot_direction = 0;	
		}
	}
}
step_input(input_struct);

player[player_slot].mana += player[player_slot].mana_regen;

player[player_slot].mana = clamp(player[player_slot].mana,0,player[player_slot].mana_max);



}