// Drawing Shadow
if (in_minecart){
	if (minecart_sprite != noone){
		draw_sprite(minecart_sprite, minecart_sprite_image, x, y);
	}
}

// Upgrades
var ucount = array_length_1d(global.upgrade_name);
var uoffset = 0;

if (sprite_index == spr_player_idle_0) || (sprite_index == spr_player_idle_1) || (sprite_index == spr_player_idle_2){
	if (image_index == 1){
		uoffset = 1;
	}
}

if (sprite_index == spr_player_walk_0) || (sprite_index == spr_player_walk_1) || (sprite_index == spr_player_walk_2){
	if (image_index == 2) || (image_index == 4) || (image_index == 9) || (image_index == 11){
		uoffset = 1;
	}
	
	if (image_index == 3) || (image_index == 10){
		uoffset = 2;
	}
}

for(var i = 0; i < ucount; i ++){
	if (upgrade_has[i]){
		if (global.upgrade_behind[i]){
			draw_sprite_ext(global.upgrade_sprite[i], 0, x, y + uoffset, image_xscale, image_yscale, image_angle, c_white, image_alpha * i_time_alpha);
		}
	}
}

// Drawing Arm
var wcurrent = global.weapon_slot[global.weapon_slotcurrent];
var angle = 0;

if (global.weapon_slot_standalone != -1){
	wcurrent = global.weapon_slot_standalone;
}

if (wcurrent != -1) && (instance_exists(obj_player_arm)) && (state != scr_player_dash){
    if (global.weapon_heavy[wcurrent]) && (global.cutscene_current == -1) && (move_x_to == -1) && (move_y_to == -1){
        if (obj_player_arm.image_yscale = -1){
            angle = clamp(obj_player_arm.image_angle, 130, 220);
        }else{
            if (obj_player_arm.image_angle > 0) && (obj_player_arm.image_angle < 90){
                angle = min(obj_player_arm.image_angle, 50);
            }else{
                angle = max(obj_player_arm.image_angle, 320);
            }
        }
		
		var armx = obj_player_arm.x + lengthdir_x(4, angle);
		var army = (obj_player_arm.y - 1) + lengthdir_y(4, angle);
		draw_sprite_ext(spr_player_arm, 1, armx, army, 1, obj_player_arm.image_yscale, angle, c_white, image_alpha * i_time_alpha);
		
		var wv = wave(0.05, 0.1, 2, 0);
		
		shader_set(sh_pawntint);
		var shader_alpha = shader_get_uniform(sh_pawntint, "_alpha");
		var shader_red = shader_get_uniform(sh_pawntint, "_red");
		var shader_green = shader_get_uniform(sh_pawntint, "_green");
		var shader_blue = shader_get_uniform(sh_pawntint, "_blue");
		var r = 0, g = 0, b = 0, a = 0;
		
        if (global.player_health_current <= 2){
            a = wv * 0.5;
			r = 255;
			g = 0;
			b = 0;
		}
		
		if (burn) || (poison){
			if (burn){
				a = wv;
			}else{
				a = wv * 0.7;
			}
			
			r = 255;
			g = 255;
			b = 255;
		}
		
		if (i_blend_time > 0){
			var alpha = (i_blend_time / 5);
			a = alpha * 0.5;
			r = 255;
			g = 0;
			b = 0;
		}
		
		if (r > 0) || (g > 0) || (b > 0) || (a > 0){
			shader_set_uniform_f(shader_alpha, a);
			shader_set_uniform_f(shader_red, r);
			shader_set_uniform_f(shader_green, g);
			shader_set_uniform_f(shader_blue, b);
			draw_sprite_ext(spr_player_arm, 1, armx, army, 1, obj_player_arm.image_yscale, angle, c_white, image_alpha * i_time_alpha);
		}
		
		shader_reset();
    }
}