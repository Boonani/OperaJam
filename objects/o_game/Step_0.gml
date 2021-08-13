/// @description 
if live_call() return live_result;


if mouse_check_button_pressed(mb_left) {
	create_upgrade_random(MX,MY);
}   


	
#region camera
camera_set_view_pos(view_camera[0],camera_targetx,camera_targety);
Game_Player_Step_Event(o_game.input_player_1,0);
	
camera_targetx = lerp(camera_targetx,0,.2);
camera_targety = lerp(camera_targety,0,.2);
#endregion
	
	
enemy_spawner_step();
	