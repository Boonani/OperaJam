/// @description Insert description here
// You can write your code in this editor

with o_enemy_charger {


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
	
	
	
}



with o_enemy_shotgun { 
	
	
	if state = e_state.warning { 
		var scale = 1;
		var col = C_RED;
		var dis = 15;
		warning_easing_time = SEC*.3;
		if warning_easing_timer <= warning_easing_time{ 
			scale = easings(e_ease.easeoutexpo,0,1,warning_easing_time,warning_easing_timer);
			dis = easings(e_ease.easeoutexpo,0,dis,warning_easing_time,warning_easing_timer);
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

		draw_outline(s_rectangle_warning,0,x+offsetx,y+offsety,scale,scale,attack_direction,C_RED,1);
		draw_outline(s_rectangle_warning,0,x+offsetx,y+offsety,scale,scale,attack_direction-bullet_angle_offset,C_RED,1);
		draw_outline(s_rectangle_warning,0,x+offsetx,y+offsety,scale,scale,attack_direction+bullet_angle_offset,C_RED,1);
	
	
		draw_sprite_ext(s_rectangle_warning,0,x+offsetx,y+offsety,scale,scale,attack_direction,C_BLACK,1);
		draw_sprite_ext(s_rectangle_warning,0,x+offsetx,y+offsety,scale,scale,attack_direction-bullet_angle_offset,C_BLACK,1);
		draw_sprite_ext(s_rectangle_warning,0,x+offsetx,y+offsety,scale,scale,attack_direction+bullet_angle_offset,C_BLACK,1);

	}
	
}
