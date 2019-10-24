instance_destroy(obj_player_light);
instance_destroy(obj_player_flashlight);

if (instance_exists(hitbox)){
	instance_destroy(hitbox);
}

var wobj;

if (global.weapon_slot[global.weapon_slotcurrent] != -1){
	wobj = global.weapon_object[global.weapon_slot[global.weapon_slotcurrent]];
}else{
	wobj = global.weapon_object[global.weapon_default];
}

if (instance_exists(wobj)){
	instance_destroy(wobj);
}