/// @description Insert description here
// You can write your code in this editor

_x_input = false;
_y_input = false;


depth = DEPTH_PLAYER
interact_key =  o_game.input_player_1.action.pressed;


slot = 0;


new_direction = 0;

state = e_player_state.move;
event_inherited();
friction_ = .25;

speed_target = 0;