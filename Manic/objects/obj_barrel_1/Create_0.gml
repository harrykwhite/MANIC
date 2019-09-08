event_inherited();
death = false;

burn_sound = noone;
burn_sound_paused = false;

hit = 5;
hit_time = 0;

basex = x;
basey = y;

spd = 0;
dir = 0;

flash = 0;
mylight = instance_create_layer(x, y - 3, "Lights", obj_barrel_1_light);

while(place_meeting(x, y + 2, obj_p_solid)){
	y ++;
}

basey = y;