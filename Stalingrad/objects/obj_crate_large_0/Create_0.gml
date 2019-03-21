event_inherited(); 
image_speed = 0;
if (random(3) < 1){
	image_index = random(image_number);
}

while(place_meeting(x, y - 5, obj_p_solid)){
	y ++;
}