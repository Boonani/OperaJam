/// @description Insert description here
// You can write your code in this editor
if live_call() return live_result;


if  delay_timer > 0 and delay_timer > delay_time*.5 { 

if round(current_time*0.01)  % 2 == 1  { 
	
var col = c_white;	
}else{
	col = C_RED;
}
shader_set(sh_fill_with_image_blend);

draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,0,col,image_alpha);
draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,image_angle,C_RED,1);
shader_reset();

}else{

draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,0,C_RED,1);
draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,image_angle,C_RED,1);

}

