depth_offset = 0;
if (parent != -1){
	if (!instance_exists(parent)){
		angle += random_range(-15, 15);
		x = xstart + random_range(-3, 3);
		y = ystart + random_range(-2, 2);
		
		parent = -1;
	}else{
		depth_offset = -40;
	}
}

if (global.game_pause) || (global.cutscene_current != -1){
	exit;
}

// Pickup
if (instance_exists(obj_player)){
    if (distance_to_object(obj_player) < pickup_range){
        pickup = true;
		scr_ui_control_indicate("Collectable");
    }else{
        pickup = false;
    }
    
    if (pickup){
        if (keyboard_check_pressed(obj_controller_all.key_interact)){
			instance_destroy();
			
			scr_sound_play(snd_weapon_pickup_2, false, 0.8, 1.2);
			scr_player_stamina_drain(6);
			scr_effect_screenshake(1);
			global.level_collectable_current[global.level_current] ++;
			
			var amount = 3000;
			scr_points_display("COLLECTABLE +" + string(amount));
			global.game_score_collectables += amount;
		}
    }
}