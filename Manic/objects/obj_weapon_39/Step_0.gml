if (!instance_exists(obj_player)){
	instance_destroy();
	return;
}

if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	image_index = 0;
	return;
}

var mdir = point_direction(x, y, scr_input_get_mouse_x(), scr_input_get_mouse_y());
var xpos = x + lengthdir_x(38, mdir);
var ypos = y + lengthdir_y(38, mdir);

if (scr_input_is_pressed(InputBinding.Attack)) && (global.player_stamina_active) && (!global.game_pause){
    if (attack_can){
		scr_camera_to_player();
        scr_effect_screenshake(4);
		
        scr_mouse_control(MouseType.SmallCircle, 2.5, 25);
        scr_sound_play(snd_weapon_swing_0, false, 0.8, 1.2);
        scr_player_knockback_initiate(1, mdir);
        scr_player_stamina_drain(22);
        angle_offset = -angle_offset;
		
	    var s = instance_create(xpos, ypos, obj_proj_1);
	    s.image_angle = mdir;
	    s.depth = depth + 1;
		s.owner_inst = obj_player.id;
		s.owner_offset_x = s.x - s.owner_inst.x;
		s.owner_offset_y = s.y - s.owner_inst.y;
		
		scr_weapon_melee_detect(false, x, y, s.image_angle, attack_damage, attack_strength, 38, obj_proj_2, obj_player.x, obj_player.y);
        
        attack_time = 36;
        attack_can = false;
    }
}

if (global.player_stamina_active){
    if (scr_input_is_pressed(InputBinding.Throw)){
		if (!collision_line(x, y, x + lengthdir_x(10, mdir), y + lengthdir_y(10, mdir), obj_p_solid, false, true)){
		    scr_effect_screenshake(1);
			scr_player_stamina_drain(15);
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