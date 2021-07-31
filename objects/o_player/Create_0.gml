/// @description Insert description here
// You can write your code in this editor

_x_input = false;
_y_input = false;


enum e_player_state { 
	move,
	cutscene,
	size_
}


slot = 0;


new_direction = 0;

state = e_player_state.move;
event_inherited();
friction_ = .25;