// Motion
if (move_speed > 0){
	move_speed -= move_speed_decline;
}else{
	
	if (scale > 0){
		scale -= 0.1;
	}else{
		instance_destroy();
	}
}

y -= move_speed;

// Num
if (num_current < num){
	num_current += num / 20;
}