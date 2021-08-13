/// @description 
if live_call() return live_result;





if !instance_exists(o_player) exit;
nearest_player = instance_nearest(x,y,o_player);
var dis = point_distance(x,y,nearest_player.x,nearest_player.y);


if dis <= grab_range {
	
	if nearest_player.interact_key{ 
		script_(nearest_player.slot);
		instance_destroy();
	}
	

	show_description = true;
	
	
	if e_button_timer <= e_button_time { 
		e_button_y_offset = easings(e_ease.easeoutback,0,20,e_button_time,e_button_timer);
	}
	
	
	e_button_timer++;
	
}else{
	show_description = false;
	
	
	e_button_flag = false;
	e_button_timer = 0;
	e_button_time = SEC*.25;
	e_button_y_offset = 0;
}


if show_description { 

	
	
}