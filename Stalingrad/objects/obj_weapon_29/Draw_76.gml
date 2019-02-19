if (instance_exists(global.player)) && (use_current){
	scr_depth_controller(global.player.y + 1, scr_draw_attributes_weapon);
}else{
	scr_depth_controller(y - 13, scr_draw_attributes_weapon);
}