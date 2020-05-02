if (!instance_exists(obj_player)){
	instance_destroy();
	return;
}

if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	return;
}

image_speed = 1;

var mdir = point_direction(global.player_position_x, global.player_position_y, scr_input_get_mouse_x(), scr_input_get_mouse_y());

if (instance_exists(obj_player)) && (global.player_stamina_active){
    if (scr_input_is_pressed(InputBinding.Attack)) || (scr_input_is_pressed(InputBinding.Throw)){
		if (!collision_line(obj_player.x, obj_player.y, x + lengthdir_x(8, mdir), y + lengthdir_y(8, mdir), obj_p_solid, false, true)){
	        scr_player_stamina_drain(20);
			
			scr_effect_screenshake(1);
	        scr_sound_play(snd_weapon_swing_0, false, 0.8, 1.2);
			global.weapon_slotquantity[global.weapon_slotcurrent] --;
			
	        throw = instance_create(x, y, obj_throwobject_0);
	        throw.spd = 7;
	        throw.damage = damage;
	        throw.dir = mdir;
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