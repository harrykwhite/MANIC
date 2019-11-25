if (render_time > 0){
	render_time --;
}else{
	render = onscreen(x + (sprite_width / 2), y + (sprite_height / 2), -24);
	render_time = render_time_max;
}

if (render){
	scr_render_me(y + 24, true);
}