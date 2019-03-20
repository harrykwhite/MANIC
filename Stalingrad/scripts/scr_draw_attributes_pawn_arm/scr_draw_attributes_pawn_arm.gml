if (instance_exists(owner)){
	var is_metal = false;
	var wv = wave(0.05, 0.15, 2, 0);
	var set = false;
	
	if (owner.object_index == obj_enemy_3) || (owner.object_index == obj_giantturret) || (owner.object_index == obj_giantturret_flamethrower){
		is_metal = true;
	}
	
	shader_set(sh_pawntint);
	var shader_alpha = shader_get_uniform(sh_pawntint, "_alpha");
	var shader_red = shader_get_uniform(sh_pawntint, "_red");
	var shader_green = shader_get_uniform(sh_pawntint, "_green");
	var shader_blue = shader_get_uniform(sh_pawntint, "_blue");
	var r = 0, g = 0, b = 0, a = 0;
	
	if (owner.health_current <= floor(owner.health_max / 3)){
	    a = wv;
		r = 80;
		g = 0;
		b = 0;
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
		var colour = make_color_rgb(80, 0, 0);
		if (is_metal){
			colour = c_white;
		}
	
		var alpha = 1 - (1 / owner.i_blend_time);
		a = alpha;
		r = color_get_red(colour);
		g = color_get_green(colour);
		b = color_get_blue(colour);
	}
	
	if (owner.whiteflash_alpha > 0){
		a = owner.whiteflash_alpha;
		r = 255;
		g = 255;
		b = 255;
	}

	if (owner.weapon != -1){
		if (instance_exists(owner.weapon)){
		    var wcurrent = global.pawnweapon_realindex[owner.weapon.index];
			var angle;
		
			if (global.weapon_heavy[wcurrent]) && (global.cutscene_current == -1){
		        if (image_yscale == -owner.scale){
		            angle = clamp(image_angle, 130, 220);
		        }else{
		            if (image_angle > 0) && (image_angle < 90){
		                angle = min(image_angle, 50);
		            }else{
		                angle = max(image_angle, 320);
		            }
		        }
				
				
				if (r > 0) || (g > 0) || (b > 0) || (a > 0){
					shader_set_uniform_f(shader_alpha, a);
					shader_set_uniform_f(shader_red, r);
					shader_set_uniform_f(shader_green, g);
					shader_set_uniform_f(shader_blue, b);
					draw_sprite_ext(sprite_index, 1, x + lengthdir_x(4, angle), (y - 1) + lengthdir_y(4, angle), 1, image_yscale, angle, c_white, 1);
					draw_self();
					set = true;
				}
		    }
		}
	}
	
	if (!set){
		if (r > 0) || (g > 0) || (b > 0) || (a > 0){
			shader_set_uniform_f(shader_alpha, a);
			shader_set_uniform_f(shader_red, r);
			shader_set_uniform_f(shader_green, g);
			shader_set_uniform_f(shader_blue, b);
			draw_self();
		}
	}
	
	shader_reset();
}