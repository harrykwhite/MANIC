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

if (instance_exists(obj_player)) && (global.player_stamina_active){
    if (scr_input_is_down(InputBinding.Attack) || scr_input_is_down(InputBinding.Throw)){
        if (throw_time >= throw_time_max - 5){
			if (!collision_rectangle(x - 12, y - 12, x + 12, y + 12, obj_p_solid, false, false)){
	            scr_player_stamina_drain(20);
				
				scr_effect_screenshake(1);
	            scr_sound_play(snd_weapon_swing_0, false, 0.8, 1.2);
				global.weapon_slotquantity[global.weapon_slotcurrent] --;
				
	            throw = instance_create(x, y, obj_throwobject_2);
	            throw.spd = 9;
	            throw.damage = throw_damage;
	            throw.dir = mdir;
	            throw.angle = image_angle;
				throw.timemax = 40;
				throw.damage_enemy = true;
				throw.damage_player = true;
				throw.damage_companion = false;
				
				if (global.weapon_slotquantity[global.weapon_slotcurrent] <= 0){
					global.weapon_slot[global.weapon_slotcurrent] = -1;
					instance_destroy();
				}
			}
        }
    }
    
    if (scr_input_is_down(InputBinding.Attack)) || (scr_input_is_down(InputBinding.Throw)){
        if (throw_time < throw_time_max){
            if (scr_player_has_upgrade(PlayerUpgrade.ShoulderBand)){
				throw_time += 2;
			}else{
				throw_time ++;
			}
        }
        
        if (throw_alpha < 1){
            throw_alpha += 0.1;
        }
    
    }else{
        throw_time = 0;
        if (throw_alpha > 0){
            throw_alpha -= 0.1;
        }
    }
}else{
    throw_time = 0;
}

