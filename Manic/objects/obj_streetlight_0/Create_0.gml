image_speed = 0;
mylight = instance_create_layer(x, y - 17, "Lights", obj_streetlight_0_light);
flicker = false;
flicker_time = random_range(5, 20);
drawlight = true;

if (room == rm_level_9_00) || (room == rm_level_9_01) || (room == rm_level_9_02){
	if (random(4) < 1){
		flicker = true;
	}
}