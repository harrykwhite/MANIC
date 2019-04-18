if (time < 2){
	time += realtime;
	room_speed = framespeed;
}else{
	room_speed = 60;
	instance_destroy();
}