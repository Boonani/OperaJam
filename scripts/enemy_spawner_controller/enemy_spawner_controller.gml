// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_spawner_controller(){


	enum e_gamestate{ 
	
		fight_state,
		relax_state,
	}

	game_state = e_gamestate.fight_state;
	//each index corresponds to each different spawner in the main game room
	//add an enemy object to j1 spawns an enemy to the top left room,
	//add an enemy object to j14 adds an enemy to bottom right
	function spawner_parent(j0,j1,j2,j3,j4,j5,j6,j7, j8, j9, j10, j11, j12, j13, j14) constructor{
		self.j0		= j0;
		self.j1		= j1;
		self.j2		= j2;
		self.j3		= j3;
		self.j4		= j4;
		self.j5		= j5;
		self.j6		= j6;
		self.j7		= j7;
		self.j8		= j8;
		self.j9		= j9;
		self.j10	= j10;
		self.j11	= j11;
		self.j12	= j12;
		self.j13	= j13;
		self.j14	= j14;
		
		
	}


	 tutorial_spawner = new spawner_parent(o_enemy_charger,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);



	ds_list_add(enemy_spawner_list,tutorial_spawner);
	
	

//	enemy_contoller = { 
///		enemy_array : enemy_spawner_list[| 0],
	//}

}

function restock_enemy_spawn_list() {
	
		charger_1 = new spawner_parent(o_enemy_charger,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);
		bullet_1 = new spawner_parent(o_enemy_shotgun,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);
		charger_3 = new spawner_parent(o_enemy_charger,o_enemy_charger,o_enemy_charger,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);
		bullet_2 = new spawner_parent(o_enemy_shotgun,o_enemy_shotgun,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);
		charger_and_bullet_mix = new spawner_parent(o_enemy_shotgun,o_enemy_charger,o_enemy_charger,o_enemy_charger,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);
		boss_fight = new spawner_parent(o_enemy_shotgun,o_enemy_charger,o_enemy_charger,o_enemy_charger,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);




		ds_list_add(enemy_spawner_list,
		charger_1,
		bullet_1,
		charger_3,
		bullet_2,
		charger_and_bullet_mix
		
		);
}


function add_enemy_into_list(){ 


	var array = [-1,-1,-1,
				 -1,-1,-1,
				 -1,-1,-1,
				 -1,-1,-1,
				 -1,-1,-1
				 ];
				 
	for(var i=0; i<argument_count; i++) {
		
		var found = false;
	
		
		
	}
	

	var j0, j1, j2,j3,j4,j5,j6,j7,j8,j9,j10,j11,j12,j13,j14;
	j0		= -1;
	j1		= -1;
	j2		= -1;
	j3		= -1;
	j4		= -1;
	j5		= -1;
	j6		= -1;
	j7		= -1;
	j8		= -1;
	j9		= -1;
	j10		= -1;
	j11		= -1;
	j12		= -1;
	j13		= -1;
	j14		= -1;
	
			

	
	
}

		
function add_enemy(spawner_differinciator, enemy_object_index) {
	
	with o_enemy_warning {
		
		if number = irandom(SPAWNER_COUNT) and spawn_next_enemy = noone  and !is_undefined(enemy_object_index){ 
				spawn_next_enemy = enemy_object_index;
	
			if object_get_parent(enemy_object_index) = o_enemy_parent{ 
				
				
			}else{
		//		debug("ERROR NOT AN OBJECT INDEX AT ", spawner_differinciator, " ENEMY INDEX: " , enemy_object_index );
			}
		}
	}
}

#endregion


	
#region enemy spawner

function enemy_spawner_step(){ 
if live_call() return live_result;
var can_spawn_enemies = true;

with o_enemy_warning { 
	if spawn_next_enemy != noone { 
		can_spawn_enemies = false;	
	}
}


if !instance_exists(o_enemy_parent) and can_spawn_enemies{ 

	//-1 = no enemy detected
	var list = enemy_spawner_list[| 0];
		ds_list_delete(enemy_spawner_list,0);


	if ds_list_empty( enemy_spawner_list) {
	
		
		restock_enemy_spawn_list();
		
		
	}


	var enemy_number = 0;
	var enemy_object_index = list.j0;
	
	if enemy_object_index != -1 { 
		debug(enemy_object_index);
		add_enemy(enemy_number, enemy_object_index);
	}
	
	enemy_number++;
	var enemy_object_index = list.j1;
	if enemy_object_index != -1 { 
		add_enemy(enemy_number, enemy_object_index);
	}
	enemy_number++;
	var enemy_object_index = list.j2;
	if enemy_object_index != -1 { 
		add_enemy(enemy_number, enemy_object_index);
	}	
	enemy_number++;
	
	var enemy_object_index = list.j3;
	if enemy_object_index != -1 { 
		add_enemy(enemy_number, enemy_object_index);
	}	
	enemy_number++;
	
	var enemy_object_index = list.j4;
	if enemy_object_index != -1 { 
		add_enemy(enemy_number, enemy_object_index);
	}	
	enemy_number++;
	
	var enemy_object_index = list.j5;
	if enemy_object_index != -1 { 
		add_enemy(enemy_number, enemy_object_index);
	}	
	enemy_number++;
	
		var enemy_object_index = list.j6;
	if enemy_object_index != -1 { 
		add_enemy(enemy_number, enemy_object_index);
	}	
	enemy_number++;
	
		var enemy_object_index = list.j7;
	if enemy_object_index != -1 { 
		add_enemy(enemy_number, enemy_object_index);
	}	
	enemy_number++;
	
	var enemy_object_index = list.j8;
	if enemy_object_index != -1 { 
		add_enemy(enemy_number, enemy_object_index);
	}	
	enemy_number++;
	
	var enemy_object_index = list.j9;
	if enemy_object_index != -1 { 
		add_enemy(enemy_number, enemy_object_index);
	}	
	enemy_number++;
	
			var enemy_object_index = list.j10;
	if enemy_object_index != -1 { 
		add_enemy(enemy_number, enemy_object_index);
	}	
	enemy_number++;
	
		var enemy_object_index = list.j11;
	if enemy_object_index != -1 { 
		add_enemy(enemy_number, enemy_object_index);
	}	
	enemy_number++;
	
	var enemy_object_index = list.j12;
	if enemy_object_index != -1 { 
		add_enemy(enemy_number, enemy_object_index);
	}	
	enemy_number++;
	
	var enemy_object_index = list.j13;
	if enemy_object_index != -1 { 
		add_enemy(enemy_number, enemy_object_index);
	}	
	enemy_number++;
	var enemy_object_index = list.j14;
	if enemy_object_index != -1 { 
		add_enemy(enemy_number, enemy_object_index);
	}		

}
	
}
#endregion
