if (instance_exists(owner)){
	var is_metal = false;
	var alpha_mult = 1;
	var drawshader = (owner.health_current <= floor(owner.health_max / 3)) || (owner.bleed) || (owner.burn) || (owner.poison) || (owner.i_blend_time > 0);
	
	if (drawshader){
		if (owner.object_index == obj_enemy_3) || (owner.object_index == obj_giantturret) || (owner.object_index == obj_giantturret_flamethrower){
			is_metal = true;
		}
		
		if (object_get_parent(owner) == obj_p_player){
			alpha_mult = owner.i_time_alpha;
		}
		
		shader_set(sh_pawntint);
		var shader_alpha = shader_get_uniform(sh_pawntint, "_alpha");
		var shader_red = shader_get_uniform(sh_pawntint, "_red");
		var shader_green = shader_get_uniform(sh_pawntint, "_green");
		var shader_blue = shader_get_uniform(sh_pawntint, "_blue");
		var r = 0, g = 0, b = 0, a = 0;
		var wv = wave(0.05, 0.1, 2, 0);
		
		var drawlowhealth = ((owner.health_current <= max(floor(owner.health_max / 3), 1)) || (owner.bleed));
		
		if (owner.object_index == obj_antagonist){
			if (room == rm_level_6_pre_00){
				drawlowhealth = false;
			}
		}
		
		if (drawlowhealth){
		    a = wv;
			r = 255 * 0.5;
			g = 0;
			b = 0;
			
			if (owner.bleed){
				a *= 1.25;
				r *= 1.25;
			
				a = clamp(a, 0, 1);
				r = clamp(r, 0, 255);
			}
		}
		
		if (owner.burn){
			a = wv;
			r = 255;
			g = 255;
			b = 255;
		}
		
		if (owner.object_index != obj_thescorched){
			if (owner.poison){
				a = wv * 0.7;
				r = 255;
				g = 255;
				b = 255;
			}
		}
		
		if (owner.i_blend_time > 0){
			var colour = c_red;
			if (is_metal){
				colour = c_white;
			}
	
			var alpha = 1 - (1 / owner.i_blend_time);
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
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha * alpha_mult);
		}
		
		shader_reset();
	}
}