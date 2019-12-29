if (update_time > 0){
	update_time--;
}else{
	if (!houseraid){
		if (collision_rectangle(x + innerspace, y + innerspace, x + sprite_width - innerspace, y + sprite_height - innerspace, obj_p_pawn, false, true)){
			fade = true;
		}else{
			fade = false;
		}
	}else{
		fade = false;
	}
	
	update_time = update_time_max;
}