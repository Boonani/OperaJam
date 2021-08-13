/// @description Insert description here
// You can write your code in this editor
if live_call() return live_result;




if is_target(o_enemy_parent, other.target_array) {

	if is_target(id, other.exclude_array) { 
	
	
		exit;
	}

	instance_destroy(other);

	var s = create_hitbox(other.sprite_index, x, y, 0, 6, [object_index], other.damage,  5, 10);
	s.player_slot = other.player_slot;
	s.spawn_new_bullet = other.spawn_new_bullet-1;

}