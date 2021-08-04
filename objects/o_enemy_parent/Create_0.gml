/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();

enum e_state{ 
	hit,
	idle,
	warning,
	attack,
	
	size_
}
entity_parent();


state = e_state.idle;
sprite[e_state.idle] = noone;
sprite[e_state.hit] = noone;
