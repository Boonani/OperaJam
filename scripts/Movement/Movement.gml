// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function add_movement( dir,		amount	){

	if live_call(dir , amount) return live_result;
	
	x_speed = lengthdir_x(speed_, direction_);
	y_speed = lengthdir_y(speed_, direction_);
	
	var _x_acceleration = lengthdir_x(amount, dir);
	var _y_acceleration = lengthdir_y(amount, dir);

	x_speed += _x_acceleration;
	y_speed += _y_acceleration;

	speed_ = point_distance(0, 0,	  x_speed,y_speed);
	direction_ = point_direction(0, 0,x_speed,y_speed);
	speed_ = min(speed_, max_speed);	

}


function add_friction() {
		speed_ = approach(speed_, 0, friction_);
}


function move(bounce) {
		
	if live_call(bounce) return live_result;
	if speed_ = 0 exit;
	
	// tile_meeting_precise(x,y,"Collision"){ 
	
	// Apply friction when sliding on walls
	//if place_meeting(x+lengthdir_x(speed_, direction_), y+lengthdir_y(speed_, direction_), collision_object_) and !_bounce and collision_object_ != noone{
	//	speed_ = approach(speed_, 0, friction_/2);
	//}
	x_speed = lengthdir_x(speed_, direction_);
	y_speed = lengthdir_y(speed_, direction_);



if object_get_parent(object_index) = o_bullet_parent{

		x+= x_speed;
		var xcollide = check_collision_x()
		y+= y_speed;
		var ycollide = check_collision_y()


	if xcollide || ycollide { 
		instance_destroy();	
	}
		
	exit;	
}
	

	


switch object_index{
	case o_player:	
	if speed_ <= 0 exit; // No need to check for collisions

		//player_collision();
		var bbox_side;
		//we are right or else left
		
		// Make sure to update speed and direction
		speed_ = point_distance(0, 0, x_speed, y_speed);
		direction_ = point_direction(0, 0, x_speed, y_speed);


		
		x+=x_speed;
		check_collision_x()
		y+=y_speed;
		check_collision_y()



		exit;
		break;

}
	
}

