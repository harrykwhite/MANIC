if (light_brightness < 1){
	light_brightness += 0.025;
}else if (light_brightness > 1){
	light_brightness -= 0.025;
}

if (flash_time > 0){
	flash_time --;
}