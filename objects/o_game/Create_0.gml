/// @description initialize the game

create_input();

player[0] = new playable_character(0);
player[1] = new playable_character(1);
player[2] = new playable_character(2);
player[3] = new playable_character(3);



controller = false;
grid = noone;


shoot_direction = 0;

weapon_socket = 0;


player[0].wep = new create_weapon(1, 96, SEC*.25);

enemy_list = ds_list_create();

window_set_size(1280,720);
