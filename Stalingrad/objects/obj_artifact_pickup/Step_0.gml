if (parent != -1) && (onscreen(x, y)){
	if (!instance_exists(parent)){
		angle = angle + random_range(-15, 15);
		x = x + random_range(-3, 3);
		y = y + random_range(-2, 2);
		
		depth_offset = 0;
		parent = -1;
	}else{
		depth_offset = -70;
	}
}

if (global.game_pause) || (global.cutscene_current != -1){
	exit;
}

// Pickup
if (instance_exists(global.player)){
    if (distance_to_object(global.player) < pickup_range){
        pickup = true;
		scr_ui_control_indicate("Artifact [E]");
    }else{
        pickup = false;
    }
    
    if (pickup){
        if (keyboard_check_pressed(ord("E"))){
			instance_destroy();
			
			scr_sound_play(snd_weapon_pickup_2, false, 0.8, 1.2);
			scr_player_stamina_drain(6);
			scr_effect_screenshake(1);
			global.level_artifact_current[global.level_current]++;
			
			obj_controller_ui.leveltext_alpha = 0;
			obj_controller_ui.leveltext_time = 60 * 3.5;
			obj_controller_ui.leveltext_other = true;
			obj_controller_ui.leveltext_text =
			string(global.level_artifact_current[global.level_current]) +
			" of " + string(global.level_artifact_number[global.level_current]) +
			" artifacts found.";
			
			var amount = 3000;
			scr_points_display("ARTIFACT +" + string(amount));
			global.game_score_artifacts += amount;
		}
    }
}