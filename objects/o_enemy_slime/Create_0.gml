/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

entity_enemy(5);

#macro DEPTH_ENEMY -4000

depth = DEPTH_ENEMY;

sprite[e_state.idle] = s_slime_idle;
sprite[e_state.hit] = s_slime_hit;

