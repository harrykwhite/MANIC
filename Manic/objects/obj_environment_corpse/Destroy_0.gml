var length = array_length_1d(fly);

for(var i = 0; i < length; i ++){
	if (instance_exists(fly[i])){
		instance_destroy(fly[i]);
	}
}