/// @description Insert description here
// You can write your code in this editor
if live_call() return live_result;




if spawn_next_enemy = noone { 
	
	delay_timer = 0;
	timer = 0;
	time = SEC;
	image_xscale = 0;
}else{

	if timer <= time { 
		image_xscale = easings(e_ease.easeoutexpo,0,1,time,timer);
		image_angle = easings(e_ease.easeoutexpo,0,360,time,timer);
	}else{
		
		if delay_timer <= delay_time { 
			image_xscale = easings(e_ease.easeoutelastic,.9,.1,delay_time,delay_timer);

		}else{
			create(x,y,spawn_next_enemy);
			spawn_next_enemy = noone;
			particle_enemy_death(x,y);
			//delay_timer = 0;
			//timer = 0;
				
		}
		delay_timer++;
	}
	
	timer++;
}
image_yscale = image_xscale;