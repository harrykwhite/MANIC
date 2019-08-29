image_speed = 0;
if (random(3) < 1){
	image_index = random(image_number);
}

while(place_meeting(x, y - 3, obj_p_solid)){
	y ++;
}