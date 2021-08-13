/// @description initialize the game


#macro DEPTH_EFFECTS -3

#macro DEPTH_PLAYER -2;
#macro DEPTH_BULLET -2
#macro DEPTH_ENEMY -1
#macro SPAWNER_COUNT 14


create(0,0,o_draw_enemy_warnings);

time_text_y_offset = 0;

depth = -3000;

game_time = SEC*10;
game_timer = game_time;
game_timer = 0;
game_state = e_gamestate.fight_state;


upgrade_list = ds_list_create();
enemy_spawner_list = ds_list_create();

enemy_spawner_controller();

camera_targetx = 0;
camera_targety = 0;

display_set_gui_size(640,360);
var _font_string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ.abcdefghijklmnopqrstuvwxyz1234567890<>,!¡':-+%*?¿()/@=";

globalvar font_boon;
font_boon = font_add_sprite_ext(s_font_boon, _font_string, true, 1);//死ぁあぃいぅうぇえぉおかがきぎくぐけこごしじすせぜそぞただだちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼェエォオカガキギクグケゲコゴサザシジスズソゾタダテデッツヅテデトドナニヌネノハバパヒビピフブプヘベペホボポマミムメモャュユョヨラリルレロワヌンヴカケブ
draw_set_halign(fa_center);

draw_set_font(font_boon);
create_input();

upgrade_struct();
init_particles();


reset_game();

player[0] = new playable_character(2);
player[1] = new playable_character(2);
player[2] = new playable_character(2);
player[3] = new playable_character(2);


rules = { 	
	bullet_limit : 5,
	enemy_can_attack : function() { 
		
	var i = 0;
	
		with o_bullet_parent{ 
			if !object_is_ancestor(object_index,o_bullet_player){
			i++;
			}
		}
		

	var active_enemies = 0;	
		with o_enemy_parent {
			if state = e_state.attack || attack_timer <= SEC*.5 { 
				active_enemies++;	
			}
		}
		
		if i <= o_game.rules.bullet_limit || active_enemies >= 3 { 
			return false;	
		}else{
			return true;	
		}
	}
}
start_room = true;
controller = false;
grid	   = noone;

shoot_direction = 0;
weapon_socket = 0;

player[0].wep = new create_weapon(1, 72, SEC*.25);

enemy_list = ds_list_create();

window_set_size(1280,720);
