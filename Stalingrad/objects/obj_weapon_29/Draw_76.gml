if (instance_exists(obj_player)) && (use_current){
	scr_render_me(obj_player.y + 3);
}else{
	scr_render_me(y - 13);
}