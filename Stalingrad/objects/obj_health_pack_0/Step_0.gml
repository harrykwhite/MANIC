// Picking Up
if (place_meeting(x + 1, y + 1, obj_player)){
    if (global.player_healthCurrent < global.player_healthMax){
		obj_player.whiteflash_alpha = 0.7;
        scr_player_heal(1);
		scr_effect_screenshake(1);
		scr_sound_play(snd_object_health_pickup_0, false, 0.9, 1.1);
		
		repeat(5){
			part_particles_create(global.ps_bottom, x + random_range(-4, 4), y + random_range(-4, 4), global.pt_wood_1, 1);
		}
		
		part_type_direction(global.pt_heal_0, 0, 360, 0, 0);
		
		repeat(14){
			part_particles_create(global.ps_front, obj_player.x + random_range(-6, 6), obj_player.y + random_range(-13, 13), global.pt_heal_0, 1);
		}
		
		instance_destroy();
    }
}