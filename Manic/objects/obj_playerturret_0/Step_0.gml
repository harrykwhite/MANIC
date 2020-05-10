if (!instance_exists(mylight)){
	mylight = instance_create_layer(x, y, "Lights", obj_playerturret_0_light);
}

mylight.x = x;
mylight.y = y;
mylight.Light_Intensity = max(1.45 + (clamp(flash_time, 0, 2) / 10), 1.2);
mylight.Light_Intensity *= light_brightness;

if (global.game_pause){
	image_speed = 0;
	image_index = 0;
	return;
}

var level = scr_level_get_index(room);
var activate = global.level_score[level] >= scorelevel * scoreinterval;

if (activate && !activated){
	global.cutscene_current = 40;
	
	obj_controller_gameplay.cutscene_look_x = x;
	obj_controller_gameplay.cutscene_look_y = y;
	obj_controller_gameplay.cutscene_look_time = 70;
	obj_controller_gameplay.cutscene_look_prop = false;
	obj_controller_gameplay.cutscene_look_object = noone;
}

activated = activate;

if (!activated){
	shoot_time = shoot_time_max;
	
	if (activated_alpha > 0){
		activated_alpha -= 0.1;
	}
}else{
	if (activated_alpha < 1){
		activated_alpha += 0.1;
	}
	
	if (global.cutscene_current == -1){
		if (!instance_exists(target)){
			var nearestenemy = instance_nearest(x, y, obj_p_enemy);
			var nearestenemydist = -1;
			
			if (nearestenemy != noone){
				nearestenemydist = point_distance(x, y, nearestenemy.x, nearestenemy.y);
			
				if (!collision_line(x, y, nearestenemy.x, nearestenemy.y, obj_p_solid, false, true)) && (nearestenemydist < 400){
					target = nearestenemy;
				}
			}
		}
		
		if (instance_exists(target)){
			dir_to = point_direction(x, y, target.x, target.y);
			
			if (shoot_time > 0){
				shoot_time --;
			}else{
				flash_time = 6;
				scr_sound_play(snd_weapon_shoot_1, false, 0.8, 1.2);
				scr_effect_screenshake(2);
		
				var xpos = x + lengthdir_x(20, image_angle) + lengthdir_x(1, up(image_angle));
				var ypos = y + lengthdir_y(20, image_angle) + lengthdir_y(1, up(image_angle));
		
				part_type_direction(global.pt_smoke_4, image_angle - 6, image_angle + 6, 0, 0);
				for(var l = 0; l < 16; l += 4){
					part_particles_create(global.ps_front, xpos + lengthdir_x(-6 + l, image_angle) + random_range(-3, 3), ypos + lengthdir_y(-6 + l, image_angle) + random_range(-3, 3), global.pt_smoke_4, 1);
				}
		
				var bullet = instance_create(xpos, ypos, obj_proj_0);
				bullet.damage = 1;
				bullet.spd = 15;
				bullet.strength = 1;
				bullet.dir = image_angle;
				bullet.image_angle = bullet.dir;
			
				image_speed = 1;
		
				shoot_time = shoot_time_max;
			}
		}else{
			shoot_time = shoot_time_max;
		}
	}
}

var dirdiff = angle_difference(dir, dir_to);
var dirinterv = 10;

if (abs(dirdiff) < dirinterv){
	dir = dir_to;
}else{
	dir += -sign(dirdiff) * dirinterv;
}

image_angle = dir;

if (abs(image_angle) < 90) || (abs(image_angle) > 270){
	image_yscale = scale;
}else{
	image_yscale = -scale;
}