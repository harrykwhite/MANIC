draw_self();

var upgrades = global.player_upgrades;
var usize = ds_list_size(upgrades);

if (usize > 0){
	for(var i = 0; i < usize; i ++){
		var upgrade = upgrades[| i];
		draw_sprite_ext(global.upgrade_sprite_corpse[upgrade], 0, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
	}
}