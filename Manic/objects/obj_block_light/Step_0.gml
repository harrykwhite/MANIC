if (time != -1){
	if (time > 0){
		time--;
	}else{
		instance_destroy();
	}
	
	time = max(time, 0);
}

if (fade_speed > 0){
	if (fade_alpha > 0){
		fade_alpha -= fade_speed;
	}else{
		instance_destroy();
	}
}