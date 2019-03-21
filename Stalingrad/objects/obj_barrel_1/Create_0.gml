event_inherited();
death = false;
burn_sound = noone;

hit = 10;
hit_time = 0;

spd = 0;
dir = 0;

flash = 0;
mylight = instance_create(x, y - 5, obj_barrel_1_light);

image_speed = 0;

while(place_meeting(x, y - 2, obj_p_solid)){
	y ++;
}