var is_metal = false;
var alpha_mult = 1;
var drawshader = (health_current <= floor(health_max / 3)) || (burn) || (poison) || (i_blend_time > 0);

if (weapon != -1){
	if (instance_exists(weapon) && weapon != -1){
		var wcurrent = global.pawnweapon_playerindex[weapon_index];
		var angle = 0;
		
		if (object_index == obj_enemy_3) || (object_index == obj_giantturret) || (object_index == obj_giantturret_flamethrower){
			is_metal = true;
		}
		
		if (object_get_parent(object_index) == obj_p_player){
			alpha_mult = i_time_alpha;
		}
		
		if (global.weapon_heavy[wcurrent]){
			if (image_xscale == -scale){
	            angle = clamp(weapon.dir, 130, 220);
	        }else{
		        if (weapon.dir > 0) && (weapon.dir < 90){
	                angle = min(weapon.dir, 50);
	            }else{
	                angle = max(weapon.dir, 320);
	            }
		    }
			
			var armx = arm.x + lengthdir_x(4 * scale, angle);
			var army = (arm.y - scale) + lengthdir_y(4 * scale, angle);
			
			if (object_index == obj_thescorched) || (object_index == obj_thedogkeeper) || (object_index == obj_antagonist){
				army --;
			}
			
			draw_sprite_ext(arm.sprite_index, 1, armx, army, scale, arm.image_yscale, angle, c_white, image_alpha * alpha_mult);
			
			if (drawshader){
				shader_set(sh_pawntint);
				var shader_alpha = shader_get_uniform(sh_pawntint, "_alpha");
				var shader_red = shader_get_uniform(sh_pawntint, "_red");
				var shader_green = shader_get_uniform(sh_pawntint, "_green");
				var shader_blue = shader_get_uniform(sh_pawntint, "_blue");
				var r = 0, g = 0, b = 0, a = 0;
				var wv = wave(0.05, 0.1, 2, 0);
				
				var drawlowhealth = true;
				if (object_index == obj_antagonist){
					if (room == rm_level_6_pre_00){
						drawlowhealth = false;
					}
				}
				
				if (health_current <= floor(health_max / 3)) && (drawlowhealth){
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
				
				if (r > 0) || (g > 0) || (b > 0) || (a > 0){
					shader_set_uniform_f(shader_alpha, a);
					shader_set_uniform_f(shader_red, r);
					shader_set_uniform_f(shader_green, g);
					shader_set_uniform_f(shader_blue, b);
					
					draw_sprite_ext(arm.sprite_index, 1, armx, army, scale, image_xscale, angle, c_white, image_alpha * alpha_mult);
				}
				
				shader_reset();
			}
	    }
	}
}