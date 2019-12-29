var comp_count = array_length_1d(global.companion);

for(var c = 1; c < comp_count; c ++){
	var cinst = instance_nearest(x, y, global.companion[c]);
	
	if (cinst != noone){
		if (distance_to_object(cinst) < 60){
			target = cinst;
			break;
		}
	}
}