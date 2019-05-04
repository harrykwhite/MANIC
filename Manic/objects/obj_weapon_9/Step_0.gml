if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	image_index = 0;
	return;
}

var mdir = point_direction(x, y, mouse_x, mouse_y);

if (instance_exists(obj_player)) && (global.player_stamina_active){
    if (mouse_check_button_released(mb_left)) || (mouse_check_button_released(mb_right)){
        if (throw_time == throw_time_max){
			if (!collision_line(obj_player.x, obj_player.y, x + lengthdir_x(3, mdir), y + lengthdir_y(3, mdir), obj_p_solid, false, true)){
	            scr_player_stamina_drain(20);
				
				scr_effect_screenshake(1);
	            scr_sound_play(snd_weapon_swing_0, false, 0.8, 1.2);
				global.weapon_quantity[index] = max(global.weapon_quantity[index] - 1, 0);
			
	            throw = instance_create(x, y, obj_throwobject_1);
	            throw.spd = 10;
	            throw.damage = throw_damage;
	            throw.dir = mdir;
	            throw.image_angle = image_angle;
				throw.timemax = 20;
				throw.damage_enemy = true;
				throw.damage_player = true;
				throw.damage_companion = false;
				
				if (global.weapon_quantity[index] <= 0){
					instance_destroy();
					global.weapon_slot[global.weapon_slotcurrent] = -1;
				}
			}
        }
    }
    
    if (mouse_check_button(obj_controller_all.key_attack)) || (mouse_check_button(obj_controller_all.key_throw)){
        if (throw_time < throw_time_max){
            throw_time ++;
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

