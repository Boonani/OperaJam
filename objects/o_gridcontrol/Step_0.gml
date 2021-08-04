/// @description Insert description here
// You can write your code in this editor


if mouse_check_button_pressed(mb_left)
	{
		create(MX,MY,o_enemy_slime);
	}
/*
if mouse_check_button(mb_left)
	{
	var xx=floor( (mouse_x-global.grid_x)/global.gridsize) ;	
	var yy=floor( (mouse_y-global.grid_y)/global.gridsize) ;	
	
	xx=clamp(xx,0,global.grid_w)
	yy=clamp(yy,0,global.grid_h)
	
	global.grid[xx][yy]=1
	}