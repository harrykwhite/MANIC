image_speed = 0;
image_index = 0;
flicker = false;
flicker_time = random_range(180, 420);
show_light = true;
start_intensity = 0.9;

if (random(100) < 2){
	flicker = true;
}

mylight = instance_create_layer(x, y, "Lights", obj_light);
mylight.Light_Type = "Point Light";