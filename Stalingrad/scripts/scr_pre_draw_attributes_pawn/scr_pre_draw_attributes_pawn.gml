var is_metal = false;
var drawshader = (health_current <= floor(health_max / 3)) || (burn) || (poison) || (i_blend_time > 0) || (whiteflash_alpha);

if (drawshader){
	if (weapon != -1){
		if (instance_exists(weapon)){
			var wcurrent = global.pawnweapon_playerindex[weapon.index];
			var angle;
			
			if (object_index == obj_enemy_3) || (object_index == obj_giantturret) || (object_index == obj_giantturret_flamethrower){
				is_metal = true;
			}
	
			shader_set(sh_pawntint);
			var shader_alpha = shader_get_uniform(sh_pawntint, "_alpha");
			var shader_red = shader_get_uniform(sh_pawntint, "_red");
			var shader_green = shader_get_uniform(sh_pawntint, "_green");
			var shader_blue = shader_get_uniform(sh_pawntint, "_blue");
			var r = 0, g = 0, b = 0, a = 0;
			var wv = wave(0.05, 0.1, 2, 0);
	
			if (health_current <= floor(health_max / 3)){
			    a = wv * 0.5;
				r = 255;
				g = 0;
				b = 0;
			}
	
			if (burn){
				a = wv;
				r = 255;
				g = 255;
				b = 255;
			}
	
			if (object_index != obj_thescorched){
				if (poison){
					a = wv * 0.7;
					r = 255;
					g = 255;
					b = 255;
				}
			}
	
			if (i_blend_time > 0){
				var colour = c_red;
				if (is_metal){
					colour = c_white;
				}

				var alpha = 1 - (1 / i_blend_time);
				a = alpha * 0.5;
				r = color_get_red(colour);
				g = color_get_green(colour);
				b = color_get_blue(colour);
			}
	
			if (whiteflash_alpha > 0){
				a = whiteflash_alpha;
				r = 255;
				g = 255;
				b = 255;
			}
			
			if (global.weapon_heavy[wcurrent]) && (global.cutscene_current == -1){
		        if (image_yscale == -scale){
		            angle = clamp(image_angle, 130, 220);
		        }else{
			        if (image_angle > 0) && (image_angle < 90){
		                angle = min(image_angle, 50);
		            }else{
		                angle = max(image_angle, 320);
		            }
			    }
				
				var armx = obj_player_arm.x + lengthdir_x(4, angle);
				var army = obj_player_arm.y - 1 + lengthdir_y(4, angle);
				
				draw_sprite_ext(sprite_index, 1, armx, army, 1, image_yscale, angle, c_white, 1);
				if (r > 0) || (g > 0) || (b > 0) || (a > 0){
					shader_set_uniform_f(shader_alpha, a);
					shader_set_uniform_f(shader_red, r);
					shader_set_uniform_f(shader_green, g);
					shader_set_uniform_f(shader_blue, b);
					draw_sprite_ext(sprite_index, 1, armx, army, 1, image_yscale, angle, c_white, 1);
					draw_self();
				}
		    }
		}
	}
}