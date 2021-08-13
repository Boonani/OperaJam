// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function reset_game(){
	
tutorial_spawner = new spawner_parent(o_enemy_charger,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);

ds_list_clear(enemy_spawner_list);

ds_list_add(enemy_spawner_list,tutorial_spawner);

	
re_add_upgrades_list();
}