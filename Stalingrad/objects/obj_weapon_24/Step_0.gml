if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	image_index = 0;
	exit;
}

var mdir = point_direction(x, y, mouse_x, mouse_y);

if (mouse_check_button_pressed(mb_left)) && (global.player_stamina_active) && (!global.game_pause){
    var xpos = x + lengthdir_x(59, mdir);
    var ypos = y + lengthdir_y(59, mdir);
	
    if (attack_can){
		scr_camera_to_player();
        scr_sound_play(snd_weapon_swing_0, false, 0.8, 1.2);
        scr_mouse_control(MouseType.SmallCircle, 3, 20);
        scr_player_knockback_initiate(1, mdir);
        scr_player_stamina_drain(5);
		scr_ui_alpha_reset();
        attack_active = true;
        attack_range_current = random_range(-attack_range, attack_range);
		
		s = instance_create(xpos, ypos, obj_proj_3);
	    s.image_angle = mdir + attack_range_current;
	    s.depth = depth + 1;
	    
		scr_weapon_melee_detect(false, x, y, s.image_angle, attack_damage, attack_strength, 53, obj_proj_3);
        
        attack_time = 10;
        attack_can = false;
    }
}

if (attack_active){
    if (attack_offset < 7.5){
        attack_offset += 2.5;
    }else{
        attack_active = false;
    }
}else{
    if (attack_offset > 0){
        attack_offset -= 2.5;
    }
}

attack_offset = clamp(attack_offset, 0, 7.5);

// Throwing Weapon
var mdir = point_direction(x, y, mouse_x, mouse_y);

if (global.player_stamina_active){
    if (mouse_check_button_pressed(mb_right)){
		
		if (!collision_line(x, y, x + lengthdir_x(28, mdir), y + lengthdir_y(28, mdir), obj_p_solid, false, true)){
		    scr_effect_screenshake(1);
			scr_player_stamina_drain(20);
			scr_sound_play(snd_weapon_swing_0, false, 0.8, 1.2);
		
		    throw = instance_create(x, y, obj_weapondrop);
		    throw.index = index;
		    throw.spd = 9;
		    throw.damage = throw_damage;
		    throw.dir = mdir;
		    throw.image_angle = throw.dir;
		    throw.ammo = global.weapon_slotammo[global.weapon_slotcurrent];

		    instance_destroy();
		    global.weapon_slot[global.weapon_slotcurrent] = -1;
		}
    }
}

// Timer
if (attack_can == false){
	attack_time = max(attack_time, 0.1);
}

if (attack_time > 0){
    attack_time--;
	
	if (attack_time < 1){
		attack_can = true;
		attack_time = 0;
	}
}