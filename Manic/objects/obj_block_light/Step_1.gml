var light_count = array_length_1d(mylight);

for(var i = 0; i < light_count; i ++){
	if (mylight[i] == noone){
		mylight[i] = instance_create(x, y, obj_light);
		mylight[i].Light_Type = "Point Light";
		mylight[i].Light_Range = size[i];
	}
	
	if (instance_exists(mylight[i])){
		mylight[i].x = x;
		mylight[i].y = y;
		mylight[i].Light_Intensity = 1.25;
	}
}