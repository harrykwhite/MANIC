image_speed = 0.5;
flicker = false;

if (random(100) < 2){
	flicker = true;
}

mylight = instance_create(x, y, obj_light);
mylight.Light_Type = "Point Light";