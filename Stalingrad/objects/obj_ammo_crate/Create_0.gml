event_inherited();
death = false;

hit = 8;
hit_time = 0;

basex = x;
basey = y;

spd = 0;
dir = 0;

flash = 0;

image_speed = 0;

while(place_meeting(x, y - 5, obj_p_solid)){
	y ++;
}

basey = y;