///scr_cutscene_7();
var index = 7;
var x_to = cutscene_conveyerbelt_x, y_to = cutscene_conveyerbelt_y;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	global.cutscene_camera_x[index] = cutscene_conveyerbelt_x;
	global.cutscene_camera_y[index] = cutscene_conveyerbelt_y;
	
	if (point_distance(obj_player.x, obj_player.y, x_to, y_to) < 24){
		obj_player.move_x_to = -1;
		obj_player.move_y_to = -1;
		obj_player.move_ext_spd = 0;
		
		if (global.cutscene_time[index] < 120){
			global.cutscene_time[index] ++;
			if (!audio_is_playing(snd_other_typing_0)){
				scr_sound_play(snd_other_typing_0, false, 1, 1);
			}
		}else{
			if (audio_is_playing(snd_other_typing_0)){
				audio_stop_sound(snd_other_typing_0);
				scr_conveyerbelt_shutdown_group();
				scr_sound_play(snd_other_conveyerbelt_1, false, 1, 1);
			}
			
			if (room == rm_level_1_00){
				var dropx = 625;
				var dropy = 1740;
				
				if (global.cutscene_time[index] < 170){
					global.cutscene_time[index] ++;
					
					if (global.cutscene_time[index] == 155){
						scr_sound_play(snd_weapon_swing_0, false, 0.8, 1.2);
						var drop = instance_create(dropx, dropy + 10, obj_weapondrop);
						drop.index = PlayerWeapon.Wrench;
						drop.spd = 5;
						drop.dir = 270 + random_range(-5, 5);
						drop.angle = 0;
						drop.is_cutscene = true;
					}
					
					global.cutscene_camera_x[index] = dropx;
					global.cutscene_camera_y[index] = dropy + 14;
				}else{
					global.cutscene_current = -1;
					global.cutscene_time[index] = 0;
				}
			}else if (room == rm_level_4_03){
				var levelobj = scr_level_get_object();
				
				if (levelobj.terminal_deactivate_count < 2){
					levelobj.terminal_deactivate_count ++;
					
					global.cutscene_current = -1;
					global.cutscene_time[index] = 0;
				}else{
					var lookx = 872;
					var looky = 430;
					
					//obj_player.move_x_to = lookx;
					//obj_player.move_y_to = looky;
					obj_player.move_ext_spd = 0;
					
					if (global.cutscene_time[index] < 170) && (!scr_player_has_upgrade(PlayerUpgrade.AmmoPack)){
						var does_exist = false;
						var num = instance_number(obj_upgrade_pickup);
						
						for(var i = 0; i < num; i ++){
							var inst = instance_find(obj_upgrade_pickup, i);
							if (inst.index == PlayerUpgrade.AmmoPack){
								does_exist = true;
							}
						}
						
						if (!does_exist){
							var upgrade = instance_create(lookx, looky, obj_upgrade_pickup);
							upgrade.index = PlayerUpgrade.AmmoPack;
							upgrade.angle = 20;
							
							var cblock = instance_create(lookx - 64, looky - 64, obj_block_cutscene);
							cblock.image_xscale = 8;
							cblock.image_yscale = 8;
							cblock.index = 53;
							cblock.destroy_on_activate = true;
							
							does_exist = true;
						}
						
						global.cutscene_time[index] ++;
						
						global.cutscene_camera_x[index] = lookx;
						global.cutscene_camera_y[index] = looky;
					}else{
						global.cutscene_current = -1;
						global.cutscene_time[index] = 0;
					}
				}
			}else{
				global.cutscene_current = -1;
				global.cutscene_time[index] = 0;
			}
		}
	}else{
		obj_player.move_x_to = x_to;
		obj_player.move_y_to = y_to;
		obj_player.move_ext_spd = obj_player.spd_max;
	}

	obj_player.flashlight_direction = 90;
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}