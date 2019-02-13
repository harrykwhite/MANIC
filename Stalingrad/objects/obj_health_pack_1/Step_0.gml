if (global.game_pause){
	image_speed = 0;
	exit;
}

image_speed = 0.035;

// Picking Up
if (place_meeting(x + 1, y + 1, global.player)){
    if (global.player_healthCurrent < global.player_healthMax){
		global.player.whiteflash_alpha = 0.7;
        scr_player_heal(3);
		scr_effect_screenshake(1);
		scr_sound_play(snd_object_health_pickup_0, false, 0.9, 1.1);
		
		repeat(8){
			part_particles_create(global.ps_bottom, x + random_range(-8, 8), y + random_range(-6, 6), global.pt_wood_1, 1);
		}
		
		part_type_direction(global.pt_heal_0, 0, 360, 0, 0);
		
		repeat(24){
			part_particles_create(global.ps_front, global.player.x + random_range(-10, 10), global.player.y + random_range(-13, 13), global.pt_heal_0, 1);
		}
		
		instance_destroy();
    }
}