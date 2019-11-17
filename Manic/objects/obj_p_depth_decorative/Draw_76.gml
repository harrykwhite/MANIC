if (render_time > 0){
	render_time --;
}else{
	render = onscreen(x, y, -18);
	render_time = render_time_max;
}

if (render){
	scr_render_me(6000, true);
}