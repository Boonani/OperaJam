/// @description Insert description here
if live_call() return live_result;


hit_flash_time = SEC*.55;




if hit_flash_timer <= hit_flash_time {

xscale = easings(e_ease.easeoutback,1.5,-.5,hit_flash_time,hit_flash_timer);
yscale = xscale;
	
hit_flash_timer++;
}

if hit_flash_timer <= SEC*.06 {



gpu_set_fog(true,c_white,0,1);
draw_sprite_ext(sprite_index,image_index,x,y+z_,xscale*image_xscale,yscale,angle,image_blend,image_alpha);

gpu_set_fog(false,c_white,0,1);
	
}else{
draw_sprite_ext(sprite_index,image_index,x,y+z_,xscale*image_xscale,yscale,angle,image_blend,image_alpha);
	
	
}