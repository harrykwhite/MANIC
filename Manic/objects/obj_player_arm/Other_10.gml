var iscutscene = (global.cutscene_current != -1);
	
if (global.cutscene_current == 57){
	if (global.weapon_slot[0] == PlayerWeapon.Revolver){
		iscutscene = false;
	}
}

if (!iscutscene){
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha * obj_player.i_time_alpha);
	scr_draw_attributes_player_arm();
}