if (instance_exists(mylight)){
	instance_destroy(mylight);
}

if (instance_exists(flashlight)){
	instance_destroy(flashlight);
}

if (instance_exists(hitbox)){
	instance_destroy(hitbox);
}

var wobj = noone;

if (global.weapon_slot[global.weapon_slotcurrent] != -1){
	wobj = global.weapon_object[global.weapon_slot[global.weapon_slotcurrent]];
}else{
	if (global.weapon_default != -1){
		wobj = global.weapon_object[global.weapon_default];
	}
}

if (instance_exists(wobj)){
	instance_destroy(wobj);
}