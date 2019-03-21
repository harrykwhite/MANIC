event_inherited();
death = false;

hit = 10;
hit_time = 0;

spd = 0;
dir = 0;

flash = 0;

image_speed = 0;
if (random(3) < 1){
	image_index = random(image_number);
}

while(place_meeting(x, y - 2, obj_p_solid)){
	y ++;
}