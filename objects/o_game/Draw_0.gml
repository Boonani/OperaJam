/// @description Draw Game UI (Do not use UI for HTML)

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
