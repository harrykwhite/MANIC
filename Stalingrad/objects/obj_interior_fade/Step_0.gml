if (update_time > 0){
	update_time--;
}else{
	fade = false;
	if (collision_rectangle(x + innerspace, y + innerspace, (x + sprite_width) - innerspace, (y + sprite_height) - innerspace, obj_p_pawn, false, true)){
		fade = true;
	}
	update_time = update_time_max;
}