x += (x_to - x) * spd;
y += (y_to - y) * spd;

if (can_touch_player){
	if (place_meeting(x + 1, y + 1, obj_player)){
		if (image_alpha > 0){
			image_alpha -= 0.05;
		}else{
			scr_upgrade_add(PlayerUpgrade.Chestplate);
		
			scr_sound_play(snd_weapon_pickup_collectable, false, 0.8, 1.2);
			scr_effect_screenshake(1);
		
			if (global.game_is_playthrough){
				scr_save_game();
			}
		
			global.player_health_max = 12;
			global.player_health_current = global.player_health_max;
		
			scr_header_display_text(global.upgrade_name[PlayerUpgrade.Chestplate], global.upgrade_description[PlayerUpgrade.Chestplate], 60 * 7);
			instance_destroy();
		}
	}
}

if (yoffset_time < 180){
	yoffset_time += 2;
}else{
	yoffset_time = 0;
}

if (flash > 0){
	flash --;
}