image_speed = 0.5;
flicker = false;
show_light = true;
start_intensity = 0;
start_intensity_set = false;

if (random(100) < 2){
	flicker = true;
}

mylight = instance_create(x, y, obj_light);
mylight.Light_Type = "Point Light";