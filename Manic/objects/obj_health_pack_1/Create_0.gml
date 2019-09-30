while(place_meeting(x, y - 4, obj_p_solid)){
	y ++;
}

is_dropped = false;

life = 0;
life_max = 60 * 20;

flicker = false;
flicker_time_max = 10;
flicker_time = flicker_time_max;