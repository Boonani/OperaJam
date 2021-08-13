/// @description Draw Game UI (Do not use UI for HTML)


if live_call() return live_result;




for ( var i =0; i < ds_list_size(enemy_spawner_list); i++){ 
	
	draw_text(20,20+i*20,string(  i));
	
}



with o_player { 

	var percent = divide(o_game.player[slot].mana, o_game.player[slot].mana_max);
	percent = clamp(percent,0,1);
	var imax = 40;
	var imax_and_percent =  floor(40*percent);
	imax_and_percent = clamp(imax_and_percent,0,40);
	
	var xx = (x-11);
	var yy = (y+11);


	for (var i = 0; i <= imax_and_percent; ++i){ 
	
		draw_sprite(s_mana_bar,0,xx+i*.5,yy);
	
	}
}

draw_set_halign(fa_center);

game_time = SEC*10;
time_text_y_offset = approach(time_text_y_offset, 0,1);
var yy = 20+time_text_y_offset;

switch game_state { 
	
	case e_gamestate.fight_state:

	if instance_exists(o_enemy_parent){ 
	game_timer--;
		draw_set_color(c_white);
	}else{
			draw_set_color(c_gray);	
	}
	
	if game_timer > 0{ 
		//game restart
		
	}else{
		game_timer = game_time;
	}



	draw_text(room_width/2-5,yy,"TIME ");
	draw_set_halign(fa_left);

	draw_text(room_width/2+20-5,yy,string_format(game_timer/SEC,0,1));

	var percent = game_timer/game_time;
	var add_ = (room_width/4) * percent;
	var yy = 35;

	for ( var i =0; i <= 2; i++){ 
	var off = i*.5;
	draw_line(room_width/2-add_-off,yy+off,room_width/2+add_-off,yy+off);
	}
	draw_set_color(c_white);
	draw_set_halign(fa_center);

	break;
	case e_gamestate.relax_state:
	draw_text(room_width/2,yy,"NO ENEMY HERE");
	game_timer = game_time;
	break;	
}

draw_set_halign(fa_center);



