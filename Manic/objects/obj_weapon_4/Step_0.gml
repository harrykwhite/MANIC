if (!instance_exists(obj_player)){
	instance_destroy();
	return;
}

if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	image_index = 0;
	return;
}

var mdir = point_direction(global.player_position_x, global.player_position_y, scr_input_get_mouse_x(), scr_input_get_mouse_y());

if (scr_input_is_pressed(InputBinding.Attack)) && (global.player_stamina_active) && (!global.game_pause){
    var xpos = global.player_position_x + lengthdir_x(29, mdir);
    var ypos = global.player_position_y + lengthdir_y(29, mdir);
	
    if (attack_can){
		scr_camera_to_player();
        scr_sound_play(snd_weapon_swing_0, false, 0.8, 1.2);
        scr_mouse_control(MouseType.SmallCrosshair, 1.75, 20);
        scr_player_knockback_initiate(0.25, mdir);
        scr_player_stamina_drain(2);
		
        attack_active = true;
		
		var s = instance_create(xpos, ypos, obj_proj_3);
	    s.image_angle = mdir;
		s.image_xscale = 0.8;
		s.image_yscale = 0.8;
	    s.depth = depth + 1;
		s.owner_inst = obj_player.id;
		s.owner_offset_x = s.x - s.owner_inst.x;
		s.owner_offset_y = s.y - s.owner_inst.y;

		scr_weapon_melee_detect(false, global.player_position_x, global.player_position_y, image_angle, attack_damage, attack_strength, 30, obj_proj_3, obj_player.x, obj_player.y);
        
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

