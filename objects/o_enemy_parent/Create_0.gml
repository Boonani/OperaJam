/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

enum e_state{ 
	idle,
	hit,
	size_
}
state = e_state.idle;

sprite[e_state.idle] = noone;
sprite[e_state.hit] = noone;