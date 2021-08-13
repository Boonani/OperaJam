/// @description warnings
if live_call() return live_result;
debug("HI");
part_system_depth(o_game.pt_charger_bubbles,DEPTH_ENEMY+1)
part_system_depth(o_game.pt_charger_bubbles_outline,DEPTH_ENEMY+2)


depth = DEPTH_ENEMY-10;

repeat(15){ 
	
var s_1 = random_range(SEC*.15,SEC*.25);
	
var spd = random_range(2.1,3.4);
var dir = random_range(0,360); 
var dir_inc = random_range(15,25);
var dir_wiggle = 0;
var fric = random_range(-.2,-.5);


	if hit_flash_timer <= SEC*.1{ 
		
		
		part_type_colour1(o_game.pt_charger_bubbles,c_white);
		part_type_colour1(o_game.pt_charger_bubbles_outline,c_red);	
	}else{
		part_type_colour1(o_game.pt_charger_bubbles,c_black);
		part_type_colour1(o_game.pt_charger_bubbles_outline,C_RED);

	}


part_type_speed(o_game.pt_charger_bubbles_outline, spd,spd, fric, 0);
part_type_gravity(o_game.pt_charger_bubbles_outline, 0,90);
part_type_direction(o_game.pt_charger_bubbles_outline, dir, dir, dir_inc,dir_wiggle);
part_type_life(o_game.pt_charger_bubbles_outline,s_1,s_1);	
	
	
part_type_scale(o_game.pt_charger_bubbles, 1, 1);

part_type_gravity(o_game.pt_charger_bubbles, 0,90);
part_type_speed(o_game.pt_charger_bubbles, spd,spd, fric, 0);

part_type_direction(o_game.pt_charger_bubbles, dir, dir, dir_inc, dir_wiggle);
part_type_life(o_game.pt_charger_bubbles,s_1,s_1);



part_particles_create(o_game.sys_charger_bubbles_outline,x,y-6,o_game.pt_charger_bubbles,1)

part_particles_create(o_game.sys_charger_bubbles,x,y-6,o_game.pt_charger_bubbles_outline,1)


}

var lerp_ = .2;

var player = instance_nearest(x,y,o_player);
var dir = point_direction(x,y,player.x,player.y);

var dis = 2;

var lenx = lengthdir_x(dis,dir);
var leny = lengthdir_y(dis,dir);

leftxtarget1 = lerp(leftxtarget1,x+lenx,lerp_);
leftytarget1 = lerp(leftytarget1,y-5+leny,lerp_);


leftxtarget2 = lerp(leftxtarget2,x-5+lenx,lerp_);
leftytarget2 = lerp(leftytarget2,y-6+leny,lerp_);


draw_sprite(s_bubble_eyes,0,leftxtarget1,leftytarget1);
draw_sprite(s_bubble_eyes,1,leftxtarget2,leftytarget2);


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
//
