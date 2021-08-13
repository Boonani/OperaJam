/// @description Insert description here

event_inherited();

instance_destroy_timer--;
var dis = point_distance(xstart,ystart,x,y);

if dis > range || instance_destroy_timer <= 0{ 
	instance_destroy();
}