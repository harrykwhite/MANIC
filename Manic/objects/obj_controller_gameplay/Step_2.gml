// Deactivate outside
if (deactivate_time > 0){
	deactivate_time --;
}else{
	scr_deactivate_outside();
	deactivate_time = deactivate_time_max;
}