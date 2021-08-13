// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information





function init_particles(){
			sys_charger_bubbles = part_system_create();
			var s_1 = SEC*.1;
			var s_2 = SEC*.15;
			//particle
			pt_charger_bubbles  = part_type_create();
			part_type_sprite(pt_charger_bubbles, s_bubble_particle , true, true, 0);
			part_type_scale(pt_charger_bubbles, 1, 1);
			part_type_color1(pt_charger_bubbles, C_BLACK);
			
			part_type_speed(pt_charger_bubbles, 0.1, 0.4, 0, 0);
			part_type_direction(pt_charger_bubbles, 90, 90, 0, 0);
			part_type_life(pt_charger_bubbles,s_1,s_2);
			
			
			
			var s_1 = SEC*.1;
			var s_2 = SEC*.15;
			//particle
			pt_death  = part_type_create();
			part_type_sprite(pt_death, s_bubble_particle , true, true, 0);
			part_type_scale(pt_death, 1, 1);
			part_type_color1(pt_death, c_white);
			
			part_type_speed(pt_death, 0.1, 0.4, 0, 0);
			part_type_direction(pt_death, 90, 90, 0, 0);
			part_type_life(pt_death,s_1,s_2);
			
			
			
			
			

			sys_charger_bubbles_outline = part_system_create();
			var s_1 = SEC*.1;
			var s_2 = SEC*.15;
			//particle
			pt_charger_bubbles_outline  = part_type_create();
			part_type_sprite(pt_charger_bubbles_outline, s_bubble_particle_outline , true, true, 0);
			
			part_type_scale(pt_charger_bubbles_outline, 1, 1);
			part_type_color1(pt_charger_bubbles_outline, C_RED);
			
			part_type_speed(pt_charger_bubbles_outline, 0.1, 0.4, 0, 0);
			part_type_direction(pt_charger_bubbles_outline, 90, 90, 0, 0);
			part_type_life(pt_charger_bubbles_outline,s_1,s_2);
			
			
			
			
			
			sys_charger_eyes = part_system_create();
			var s_1 = SEC*.1;
			var s_2 = SEC*.15;
			//particle
			pt_charger_eyes  = part_type_create();
			part_type_sprite(pt_charger_eyes, s_bubble_eyes, true, true, 0);
			
			part_type_scale(pt_charger_eyes, 1, 1);
			part_type_color1(pt_charger_eyes, C_RED);
			
			part_type_speed(pt_charger_eyes, 0.1, 0.4, 0, 0);
			part_type_direction(pt_charger_eyes, 90, 90, 0, 0);
			part_type_life(pt_charger_eyes,s_1,s_2);
}



function destroy_particles(){
	
	
	part_type_destroy(pt_death);

	part_system_destroy(sys_charger_eyes);
	part_type_destroy(pt_charger_eyes);



	part_system_destroy(sys_charger_bubbles_outline);
	part_type_destroy(pt_charger_bubbles_outline);

	
	part_system_destroy(sys_charger_bubbles);
	part_type_destroy(pt_charger_bubbles);
	
}

function particle_enemy_death(xx,yy){ 
	repeat(45){ 
var s_1 = random_range(SEC*.15,SEC*.25);
	
var spd = random_range(4.1,6.4);
var dir = random_range(0,360); 
var dir_inc = random_range(15,25);
var dir_wiggle = 0;
var fric = random_range(-.2,-.5);

part_type_colour1(o_game.pt_death,c_white);



part_type_speed(o_game.pt_death, spd,spd, fric, 0);
part_type_gravity(o_game.pt_death, 0,90);
part_type_direction(o_game.pt_death, dir, dir, dir_inc,dir_wiggle);
part_type_life(o_game.pt_death,s_1,s_1);	
	
	


part_particles_create(o_game.sys_charger_bubbles_outline,xx,yy,o_game.pt_death,1)


}
	
}