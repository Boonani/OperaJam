/// @description initialize the game


display_set_gui_size(640,360);
var _font_string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ.abcdefghijklmnopqrstuvwxyz1234567890<>,!¡':-+%*?¿()/@=";

globalvar font_boon;
font_boon = font_add_sprite_ext(s_font_boon, _font_string, true, 1);//死ぁあぃいぅうぇえぉおかがきぎくぐけこごしじすせぜそぞただだちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼェエォオカガキギクグケゲコゴサザシジスズソゾタダテデッツヅテデトドナニヌネノハバパヒビピフブプヘベペホボポマミムメモャュユョヨラリルレロワヌンヴカケブ
draw_set_halign(fa_center);

draw_set_font(font_boon);
create_input();
upgrade_list = ds_list_create();
upgrade_struct();


re_add_upgrades_list();

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
