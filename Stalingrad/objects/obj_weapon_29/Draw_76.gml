if (instance_exists(global.player)) && (use_current){
	scr_render_me(global.player.y + 3);
}else{
	scr_render_me(y - 13);
}