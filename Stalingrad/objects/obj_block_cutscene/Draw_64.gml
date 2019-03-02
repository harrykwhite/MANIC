if (interact_active) && (interact_special == "moveto"){
	if (arrow_time < arrow_time_max){
		arrow_time ++;
	}
}else{
	if (arrow_time > 0){
		arrow_time --;
	}
}

if (arrow_time > 0){
	var xx = (x + (sprite_width / 2)) - camera_get_view_x(view_camera[0]); xx *= GUI_POS_X;
	var yy = (y + (sprite_height / 2)) - camera_get_view_y(view_camera[0]); yy *= GUI_POS_Y;
	
	if (moveto_dir == 0){
		xx += arrow_time * 2;
	}
	
	if (moveto_dir == 2){
		xx -= arrow_time * 2;
	}
	
	if (moveto_dir == 1){
		yy -= arrow_time * 2;
	}
	
	if (moveto_dir == 3){
		yy += arrow_time * 2;
	}
	
	draw_sprite_ext(spr_ui_arrow, 0, xx, yy, 1.75, 1.75, moveto_dir * 90, c_white, 0.7 * (arrow_time / arrow_time_max));
}