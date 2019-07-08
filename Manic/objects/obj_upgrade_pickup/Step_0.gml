// Light
if (!instance_exists(mylight)){
	mylight = instance_create_layer(x, y, "Lights", obj_upgrade_pickup_light);
}

mylight.x = x;
mylight.y = y;
mylight.light[| eLight.X] = mylight.x;
mylight.light[| eLight.Y] = mylight.y;

if (index == PlayerUpgrade.HeadLight){
	mylight.light[| eLight.Range] = 120;
}

// Particles
if (!global.game_pause){
	if (random(15) < 1){
		part_particles_create(global.ps_front, x + random_range(-4, 4), y + random_range(-4, 4), global.pt_glow_0, 1);
	}
}

// Pickup
if (instance_exists(obj_player)){
    if (pickup){
        instance_destroy();
		
		scr_sound_play(snd_weapon_pickup_2, false, 0.8, 1.2);
		scr_player_stamina_drain(6);
		scr_effect_screenshake(1);
		scr_upgrade_add(index);	
		
		if (global.game_is_playthrough) || (room == rm_prologue_00){
			scr_save_game();
		}
		
		if (index == PlayerUpgrade.Chestplate){
			global.player_health_max = 12;
			global.player_health_current = global.player_health_max;
		}
		
		scr_header_display_text(global.upgrade_name[index], global.upgrade_description[index], 60 * 7);
    }
}