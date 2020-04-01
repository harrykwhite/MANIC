var comp_count = array_length_1d(global.companion);
var comp_found = false;

for(var c = 0; c < comp_count; c ++){
	var cinst = instance_nearest(x, y, global.companion[c]);
	
	if (cinst != noone){
		if (distance_to_object(cinst) < 54){
			if (companion_find_time > 0){
				companion_find_time --;
			}else{
				target = cinst;
			}
			
			comp_found = true;
			break;
		}
	}
}

if (!comp_found){
	if (companion_find_break > 0){
		companion_find_break --;
	}else{
		if (companion_find_time < companion_find_time_max){
			companion_find_time ++;
		}
	}
}else{
	companion_find_break = companion_find_break_max;
}