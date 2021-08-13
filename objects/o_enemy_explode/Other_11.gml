/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var nearest = instance_nearest(x,y,o_player);
attack_direction = point_direction(x,y,nearest.x,nearest.y);
	