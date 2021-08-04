/// @description
if live_call() return live_result;

//debug(title, " " , desc, " " ,script_);

draw_set_halign(fa_center);
depth = -3000;

margin_top = 0;
margin_bot = 0;
margin_left = -6;
margin_right = 4;

title_width = string_width(title);
title_height = string_height(title);
desc_width = string_width(desc);
desc_height = string_height(desc);

var desc_yoffset = -20-desc_height;
var title_yoffset = -33-desc_height;

/*
	//top
	draw_line(x-desc_width/2+margin_left,y+desc_yoffset,x+desc_width/2+margin_right,y+desc_yoffset);
	//bottom
	draw_line(x-desc_width/2+margin_left,y+desc_yoffset+desc_height,x+desc_width/2+margin_right,y+desc_yoffset+desc_height);
	//left
	draw_line(x-desc_width/2+margin_left,y+desc_yoffset,x-desc_width/2+margin_left,y+desc_yoffset+desc_height);
	//right
	draw_line(x+desc_width/2+margin_right,y+desc_yoffset,x+desc_width/2+margin_right,y+desc_yoffset+desc_height);
*/

nine_slice(s_nine_slice_upgrade_title,x-desc_width/2+margin_left,y+desc_yoffset
,x+desc_width/2+margin_right,y+desc_yoffset+desc_height,1,c_white);

nine_slice_anim(s_nine_slice_upgrade_title,1,x-title_width/2+margin_left+1,y+title_yoffset
,x+title_width/2+margin_right,y+title_yoffset+title_height,1,c_white);

draw_sprite_ext(s_nine_slice_upgrade_edge_small,1,
x+title_width/2+margin_left+12,y+title_yoffset+5,1,1,0,c_white,1);

draw_sprite_ext(s_nine_slice_upgrade_edge_small,image_index,x-title_width/2+margin_left-1,y+title_yoffset+5,1,1,0,c_white,1);




switch desc_height  {

	case 15:
	//one line of text
	draw_sprite_ext(s_nine_slice_upgrade_edge_small,2,x-desc_width/2+margin_left-3,y+desc_yoffset+5,1,1,0,c_white,1);
	draw_sprite_ext(s_nine_slice_upgrade_edge_small,3,x+desc_width/2+margin_left+12,y+desc_yoffset+5,1,1,0,c_white,1);

	break;


	case 30:
	//2 lines
	
	draw_sprite_ext(s_nine_slice_upgrade_edge_medium,0,x-desc_width/2+margin_left-3,y+desc_yoffset+10,1,1,0,c_white,1);
	draw_sprite_ext(s_nine_slice_upgrade_edge_medium,0,x+desc_width/2+margin_left+13,y+desc_yoffset+20,-1,-1,0,c_white,1);
	break;
	
	default: //KEK
	
	break;
}


draw_set_color(C_RED);
draw_text(x,y+title_yoffset,title);
draw_set_color(c_white);
draw_text(x,y+desc_yoffset,desc);

draw_outline(sprite_index,image_index,x,y,1,1,0,c_white,1);
draw_sprite(sprite_index,image_index,x,y);

draw_sprite(s_nine_slice_pointer,image_index,x,y+desc_yoffset+desc_height-1);

var xsize = 16;
var ysize = 16;
var yoff = -32;

sprite_set_live(s_e_button,1);
if show_description { 
	
	
draw_sprite_ext(s_e_button,current_time*0.003,x,y+e_button_y_offset,1,1,0,c_white,1);


if e_button_timer <= SEC*.1 { 
	shader_set(sh_fill_with_image_blend);
	draw_sprite_ext(s_e_button,current_time*0.003,x,y+e_button_y_offset,1,1,0,c_white,1);
	shader_reset();
}

if e_button_timer <= SEC*.08 { 
	draw_sprite_ext(s_e_button,current_time*0.003,x,y+e_button_y_offset,1,1,0,c_black,1);
}

if e_button_timer <= SEC*.05 { 
	shader_set(sh_fill_with_image_blend);
	draw_sprite_ext(s_e_button,current_time*0.003,x,y+e_button_y_offset,1,1,0,c_white,1);
	shader_reset();
}




}