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
var xpos = global.player_position_x + lengthdir_x(34, mdir);
var ypos = global.player_position_y + lengthdir_y(34, mdir);

if (scr_input_is_pressed(InputBinding.Attack)) && (global.player_stamina_active) && (!global.game_pause){
    if (attack_can){
		scr_camera_to_player();
        scr_effect_screenshake(1);
		
        scr_mouse_control(MouseType.SmallCircle, 2.5, 25);
        scr_sound_play(snd_weapon_swing_0, false, 0.8, 1.2);
        scr_player_knockback_initiate(0.5, mdir);
        scr_player_stamina_drain(5);
        angle_offset = -angle_offset;
		
	    var s = instance_create(xpos, ypos, obj_proj_3);
	    s.image_angle = mdir;
	    s.depth = depth + 1;
		s.owner_inst = obj_player.id;
		s.owner_offset_x = s.x - s.owner_inst.x;
		s.owner_offset_y = s.y - s.owner_inst.y;
	    
		scr_weapon_melee_detect(false, global.player_position_x, global.player_position_y, s.image_angle, attack_damage, attack_strength, 27, obj_proj_3, obj_player.x, obj_player.y);
        
        attack_time = 8;
        attack_can = false;
		
		scr_weapon_shoot_tutourial_update();
    }
}

if (global.player_stamina_active){
    if (scr_input_is_pressed(InputBinding.Throw)){
		if (!collision_line(x, y, x + lengthdir_x(16, mdir), y + lengthdir_y(16, mdir), obj_p_solid, false, true)){
		    scr_effect_screenshake(1);
			scr_player_stamina_drain(10);
			scr_sound_play(snd_weapon_swing_0, false, 0.8, 1.2);
		
		    throw = instance_create(x, y, obj_weapondrop);
		    throw.index = index;
		    throw.spd = 9;
		    throw.damage = throw_damage;
		    throw.dir = mdir;
		    throw.angle = image_angle;
		    throw.ammo = global.weapon_slotammo[global.weapon_slotcurrent];

		    instance_destroy();
		    global.weapon_slot[global.weapon_slotcurrent] = -1;
			
			if (global.level_current == Level.Prologue){
				with(obj_controller_ui){
					if (tutourial) && (tutourial_stage == TutourialStage.Throw) && ((tutourial_stage_timer == -1) || (tutourial_stage_timer > 60 * 2)){
						tutourial_stage_timer = 60 * 2;
					}
				}
			}
		}
    }
}

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