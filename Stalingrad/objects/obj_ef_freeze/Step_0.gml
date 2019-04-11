room_speed = framespeed;

if (time < 2){
	time ++;
}else{
	room_speed = 60;
	instance_destroy();
}