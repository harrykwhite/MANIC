var light_count = array_length_1d(mylight);

for(var i = 0; i < light_count; i++){
	if (mylight[i] != noone) && (instance_exists(mylight[i])){
		instance_destroy(mylight[i]);
	}
}