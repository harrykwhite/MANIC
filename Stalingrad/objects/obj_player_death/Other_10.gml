draw_self();
var ucount = array_length_1d(global.upgrade_name);

for(var i = 0; i < ucount; i ++){
	if (scr_player_has_upgrade(i)){
		draw_sprite_ext(global.upgrade_sprite_corpse[i], 0, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
	}
}