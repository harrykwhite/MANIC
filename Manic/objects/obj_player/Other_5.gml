if (instance_exists(mylight)){
	instance_destroy(mylight);
}

if (instance_exists(flashlight)){
	instance_destroy(flashlight);
}

var flylength = array_length_1d(fly);
for(var i = 0; i < flylength; i ++){
	if (instance_exists(fly[i])){
		instance_destroy(fly[i]);
		fly[i] = noone;
	}
}