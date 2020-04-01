if (place_meeting(x, y, obj_health_pack_0) || place_meeting(x, y, obj_health_pack_1)){
	return;
}

instance_create(x, y, large ? obj_health_pack_1 : obj_health_pack_0);