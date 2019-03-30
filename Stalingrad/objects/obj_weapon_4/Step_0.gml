if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	image_index = 0;
	exit;
}

var mdir = point_direction(x, y, mouse_x, mouse_y);

if (mouse_check_button_pressed(mb_left)) && (global.player_stamina_active) && (!global.game_pause){
    var xpos = x + lengthdir_x(29, mdir);
    var ypos = y + lengthdir_y(29, mdir);
	
    if (attack_can){
		scr_camera_to_player();
        scr_sound_play(snd_weapon_swing_0, false, 0.8, 1.2);
        scr_mouse_control(MouseType.SmallCrosshair, 1.75, 20);
        scr_player_knockback_initiate(0.25, mdir);
        scr_player_stamina_drain(2);
		scr_ui_alpha_reset();
        attack_active = true;
		
		s = instance_create(xpos, ypos, obj_proj_3);
	    s.image_angle = mdir;
	    s.image_xscale = 0.8;
		s.image_yscale = 0.8;
		s.depth = depth + 1;

		scr_weapon_melee_detect(false, x, y, image_angle, attack_damage, attack_strength, 30, obj_proj_3);
        
        attack_time = 13;
        attack_can = false;
    }
}

if (attack_active){
    if (attack_offset < 6){
        attack_offset += 2;
    }else{
        attack_active = false;
    }
}else{
    if (attack_offset > 0){
        attack_offset -= 2;
    }
}

attack_offset = clamp(attack_offset, 0, 10);

// Timer
if (!attack_can){
	attack_time = max(attack_time, 0.1);
}

if (attack_time > 0){
    attack_time--;
	
	if (attack_time < 1){
		attack_can = true;
		attack_time = 0;
	}
}

