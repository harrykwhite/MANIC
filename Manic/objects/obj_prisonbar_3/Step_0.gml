if (global.game_pause){
	return;
}

// Flash
flash -= 0.15;
flash = clamp(flash, 0, 1);

// Hit Control
if (hit <= 0){
	death = true;
}

if (hit_time > 0){
	hit_time--;
}

// Object Death
if (death){
	scr_sound_play(snd_object_box_break_0, false, 0.8, 1.2);
	scr_effect_screenshake(2);
	scr_effect_freeze(13);
	
	var brk = instance_create(x, y, obj_break); brk.shake = 3; brk.sprite_index = spr_prisonbar_3_break;
	
	with(obj_controller_gameplay){
		scr_map_clear();
		scr_map_fill();
	}
	
    instance_destroy();
}