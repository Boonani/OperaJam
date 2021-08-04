/// @description MOVE player state
if live_call() return live_result;



//_x_input = o_game.input_player_1.right.check - o_game.input_player_1.left.check;
//_y_input = o_game.input_player_1.down.check -  o_game.input_player_1.up.check;		

if o_game.input_player_1.right.pressed || o_game.input_player_1.left.released and o_game.input_player_1.right.check{ 
	
		_x_input = 1;
	
}

if o_game.input_player_1.left.pressed || o_game.input_player_1.right.released and o_game.input_player_1.left.check { 
	
		_x_input = -1;
	
}

if  !o_game.input_player_1.right.check and  !o_game.input_player_1.left.check{ 
	_x_input = 0;
}


if o_game.input_player_1.up.pressed  || o_game.input_player_1.down.released and o_game.input_player_1.up.check{ 
	
		_y_input = -1;
	
}

if o_game.input_player_1.down.pressed || o_game.input_player_1.up.released and o_game.input_player_1.down.check { 
	
		_y_input = 1;
	
}


if  !o_game.input_player_1.up.check and  !o_game.input_player_1.down.check{ 
	_y_input = 0;
}



var dir = point_direction(0,0,_x_input, _y_input);



if  o_game.input_player_1.right.check ||
	o_game.input_player_1.left.check ||
	o_game.input_player_1.down.check ||
	o_game.input_player_1.up.check
{ 
	speed_target = lerp(speed_target,1.2,.4);
	add_movement(dir, speed_target);
}else{
	speed_target = 0;	
}


interact_key =  o_game.input_player_1.action.pressed;



if  !o_game.input_player_1.right.check and 
	!o_game.input_player_1.down.check and
	!o_game.input_player_1.left.check and
	!o_game.input_player_1.up.check  { 
		
	new_direction = noone;

}







add_friction();