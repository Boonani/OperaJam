// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information




function create_upgrade(_x, _y, _obj) {
	var instance = instance_create_layer(_x,_y,I,_obj);
	return instance;
}


enum e_upgrade { 
	horizontal_bullets,
	extra_bullets,
	strawberry,
	ricochet,
	undamaged_enemies,
	size_
	
}
function re_add_upgrades_list(){ 
	with o_game { 
	ds_list_add(upgrade_list, 
	e_upgrade.horizontal_bullets,
	e_upgrade.extra_bullets,
	e_upgrade.strawberry,
	e_upgrade.ricochet,
	e_upgrade.undamaged_enemies,
	);
	}
}
/*
function create_upgrade_custom(_x, _y, _obj) {
	var instance = instance_create_layer(_x,_y,I,_obj);
	return instance;
}*/

function create_upgrade_random(_x, _y) {
	
	var list = o_game.upgrade_list;
	ds_list_shuffle(o_game.upgrade_list);
	
	var upgrade_enum_ = ds_list_find_value(list, 0);
	
	if ds_list_empty(list){
			re_add_upgrades_list();
		upgrade_enum_ = ds_list_find_value(list, 0);
	}
	var new_upgrade_struct_ = upgrade_struct(upgrade_enum_);
	
	
	var upgrade_object = create(_x,_y,o_upgrade);
		upgrade_object.title = new_upgrade_struct_.title;
		upgrade_object.desc = new_upgrade_struct_.desc;
		upgrade_object.script_ = new_upgrade_struct_.script_;
		upgrade_object.sprite_index = new_upgrade_struct_.sprite_;
	
	return upgrade_object;
}




function upgrade(title,desc, sprite, script_) constructor{
	self.title = title;
	self.desc = desc;
	self.sprite_ = sprite;
	self.script_ = script_;
}


function upgrade_struct(upgrade_enum_){
	
var return_value = noone;

switch upgrade_enum_ { 

	case e_upgrade.horizontal_bullets : return_value = new upgrade("LEFT GLOVE", "+ATTACK SPEED WHILE\nSHOOTING LEFT", s_upgrade_horizontal_hat,

		function(slot) { 
			with o_game.player[slot].wep { 
						left_attack_speed += .5;
				}
			}
		);
		
	break;
	case e_upgrade.extra_bullets : return_value = new upgrade("RED BELT", "+1 BULLET PER SHOT,\n-20% ACCURACY", s_upgrade_karate_belt,

		function(slot) { 
				with o_game.player[slot].wep { 
						extra_bullet += 1;
						accuracy *= .8;
				}
			}
		);
	break;
	case e_upgrade.strawberry : return_value = new upgrade("STRAWBERRY", "+2 HP. IF HP IS FULL\nTHEN GET +1 MAX HP", s_upgrade_strawberry,

		function(slot) { 
				with o_game.player[slot] { 
						if o_game.player[slot].hp != o_game.player[slot].hp_max { 
							change_player_health(slot,2);
						}else{
							o_game.player[slot].hp_max += 1;
							change_player_health(slot,1);
					}
				}
			}
		);
	break;

	case e_upgrade.ricochet : return_value = new upgrade("BOOMERANG SHOT", "AFTER A BULLET HITS AN ENEMY,\nSPAWN A NEW BULLET TOWARDS THE NEAREST ENEMY", s_upgrade_boomerang,
		function(slot) { 	
				with o_game.player[slot] { 
						if o_game.player[slot].hp != o_game.player[slot].hp_max { 
							change_player_health(slot,2);
						}else{
							o_game.player[slot].hp_max += 1;
							change_player_health(slot,1);
					}
				}
			}
		);
	break;

	case e_upgrade.undamaged_enemies : return_value = new upgrade("FIRE ARROW", "BULLETS DEAL +100% DAMAGE\nON UNDAMAGED ENEMIES", s_upgrade_explode,
		function(slot) { 
				with o_game.player[slot].wep { 
							undamaged_enemies_damage_mod += 1;
				}
			}
		);
	break;
	}
	return return_value;
}