/// @description 
if live_call() return live_result;

draw_set_colour(c_lime);
draw_rectangle(x-bbox_w/2,y-bbox_h/2,x+bbox_w/2,y+bbox_h/2,false)
draw_set_colour(c_white);


for(i=0;i<dot_len;i++)
	{
		if collision_active[i]=1{draw_set_colour(c_red)}
		draw_circle(x+collision_dot[i][0]*bbox_w/2,y+collision_dot[i][1]*bbox_h/2,1,false)	
		draw_set_colour(c_white)
	}
	
collision_active=[0,0,0,0]