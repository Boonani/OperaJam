/// @description Insert description here






if hit_flash_timer <= hit_flash_time {
xscale = easings(e_ease.easeoutback,1.5,-.5,hit_flash_time,hit_flash_timer);
yscale = xscale;
hit_flash_timer++;
}

if hit_flash_timer <= SEC*.06 {



shader_set(sh_fill_with_image_blend);
draw_sprite_ext(sprite_index,image_index,x,y+z_,xscale*image_xscale,yscale,angle,image_blend,image_alpha);
shader_reset();
	
}else{
draw_sprite_ext(sprite_index,image_index,x,y+z_,xscale*image_xscale,yscale,angle,image_blend,image_alpha);
	
	
}