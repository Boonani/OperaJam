/// @description warnings


if state = e_state.warning { 
	var scale = 1;
	var col = C_RED;
	
	var dis = 35;
	if warning_easing_timer <= warning_easing_time{ 
		scale = easings(e_ease.easeoutelastic,0,1,warning_easing_time,warning_easing_timer);
		dis = easings(e_ease.easeoutelastic,0,dis,warning_easing_time,warning_easing_timer);;
		
		warning_easing_timer++;
	}

	var offsetx = lengthdir_x(dis,attack_direction);
	var offsety = lengthdir_y(dis,attack_direction);
	
	if warning_easing_timer <= SEC*.2 { 
	
		if warning_easing_timer <= SEC*.15{ 
			col = c_white;
		}else{
			col = c_black;
		}
	
	}
		
	draw_sprite_ext(s_arrow,0,1+x+offsetx,y+offsety,scale,scale,attack_direction,c_black,1);
	draw_sprite_ext(s_arrow,0,-1+x+offsetx,y+offsety,scale,scale,attack_direction,c_black,1);
	draw_sprite_ext(s_arrow,0,x+offsetx,1+y+offsety,scale,scale,attack_direction,c_black,1);
	draw_sprite_ext(s_arrow,0,x+offsetx,-1+y+offsety,scale,scale,attack_direction,c_black,1);
	draw_sprite_ext(s_arrow,0,x+offsetx,y+offsety,scale,scale,attack_direction,col,1);

}

event_inherited();

draw_text(x,y+10,string(state));
