event_inherited();
death = false;

hit = 1;
hit_time = 0;

basex = x;
basey = y;

spd = 0;
dir = 0;

explode = false;
scale = 1;

flash = 0;

image_speed = 0;
if (random(3) < 1){
	image_index = random(image_number);
}

while(place_meeting(x, y - 5, obj_p_solid)){
	y ++;
}

basey = y;