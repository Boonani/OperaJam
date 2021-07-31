/// @description Insert description here
// You can write your code in this editor

if live_call() return live_result;




var percent = divide(o_game.player[slot].mana, o_game.player[slot].mana_max);

percent = clamp(percent,0,1);

var imax = 40;

var imax_and_percent =  floor(40*percent);
imax_and_percent = clamp(imax_and_percent,0,40);





for (var i = 0; i <= imax_and_percent; ++i){ 
	
draw_sprite(s_mana_bar,0,return_gui_x(x-11+i*.5),return_gui_y(y+11));

	
}



