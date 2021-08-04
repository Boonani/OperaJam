/// @description Insert description here
	
if hurtbox_entity_can_be_hit_by(other){
	hit_flash_timer	= 0;
	
	hp -= other.damage;

	if hp <= 0 { 
		instance_destroy();
	}
}