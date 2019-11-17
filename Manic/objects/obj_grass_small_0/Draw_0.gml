if (render_time > 0){
	render_time --;
}else{
	render = onscreen(x + (sprite_width / 2), y + (sprite_height / 2), -22);
	render_time = render_time_max;
}

if (render){
	draw_self();
}