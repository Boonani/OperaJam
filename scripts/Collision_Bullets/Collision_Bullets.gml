// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///@arg hitbox 
function hurtbox_entity_can_be_hit_by(argument0) {
	var _hitbox = argument0;
	var _is_target = is_target(object_index, _hitbox.targets_);



	//returns false if we're invincibile or if we're in the target list 


	return !invincibile_ && _is_target;



}

function is_target(_value, _array) {

	var _array_length = array_length(_array);
	
	for (var _index = 0; _index<_array_length; _index++){
		if _value == _array[_index] return true;
		//checks to see if the target is an ancestor
		if object_is_ancestor(_value, _array[_index]) return true;
	}

	return false;
}