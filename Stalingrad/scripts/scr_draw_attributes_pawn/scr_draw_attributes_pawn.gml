var is_metal = false;
var drawshader = (health_current <= max(floor(health_max / 3), 1)) || (bleed) || (burn) || (poison) || (i_blend_time > 0) || (whiteflash_alpha > 0);

if (drawshader){
	var wv = wave(0.05, 0.1, 2, 0);

	if (object_index == obj_enemy_3) || (object_index == obj_giantturret) || (object_index == obj_giantturret_flamethrower){
		is_metal = true;
	}

	shader_set(sh_pawntint);
	var shader_alpha = shader_get_uniform(sh_pawntint, "_alpha");
	var shader_red = shader_get_uniform(sh_pawntint, "_red");
	var shader_green = shader_get_uniform(sh_pawntint, "_green");
	var shader_blue = shader_get_uniform(sh_pawntint, "_blue");
	var r = 0, g = 0, b = 0, a = 0;

	if (!is_metal){
		if (health_current <= max(floor(health_max / 3), 1)) || (bleed){
			if (!global.game_pause){
			    if (random(3) < 1){
			        part_particles_create(global.ps_front, x + random_range(-6, 6), y + random_range(-14, 14), global.pt_blood_2, 1);
			    }
			}
		
			a = wv;
			r = 255 * 0.5;
			g = 0;
			b = 0;
		}
	}

	var wradius = 6;
	var hradius = 18;
	var xx = x;
	var yy = y;

	if (object_index == obj_enemy_1){
		wradius = 6;
		hradius = 6;
		xx = x;
		yy = y - 10;
	}

	if (object_index == obj_enemy_2) || (object_index == obj_companion_3) || (object_index == obj_thedogkeeper_dog){
		wradius = 12;
		hradius = 6;
	}

	if (object_index == obj_enemy_3) || (object_index == obj_giantturret_flamethrower){
		wradius = 9;
		hradius = 11;
	}

	if (object_index == obj_giantturret){
		wradius = 34;
		hradius = 12;
	}

	if (burn){
		if (!global.game_pause){
			if (random(3) < 1){
				part_particles_create(global.ps_front, xx + random_range(-wradius, wradius), yy + random_range(-hradius, hradius), global.pt_fire_0, 1);
			}

			if (random(5) < 1){
				part_particles_create(global.ps_front, xx + random_range(-wradius, wradius), yy + random_range(-hradius, hradius), global.pt_fire_2, 1);
			}
		}
	
		a = wv;
		r = 255;
		g = 255;
		b = 255;
	}

	if (!is_metal){
		var coffset = 0;
		if (object_index == obj_enemy_1){
			coffset = 20;
		}
	
		if (poison){
			if (!global.game_pause){
				if (random(2.5 + coffset) < 1){
					part_particles_create(global.ps_front, xx + random_range(-wradius, wradius), yy + random_range(-hradius, hradius), global.pt_poison_0, 1);
				}

				if (random(3.5 + coffset) < 1){
					part_particles_create(global.ps_front, xx + random_range(-wradius, wradius), yy + random_range(-hradius, hradius), global.pt_poison_1, 1);
				}
			}
		
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
	
		var alpha = (i_blend_time / 5);
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

	if (r > 0) || (g > 0) || (b > 0) || (a > 0){
		shader_set_uniform_f(shader_alpha, a);
		shader_set_uniform_f(shader_red, r);
		shader_set_uniform_f(shader_green, g);
		shader_set_uniform_f(shader_blue, b);
		draw_self();
	}

	shader_reset();
}

if (headless){
	headless_image += 0.35;

	if (object_index != obj_enemy_2) && (object_index != obj_companion_3) && (object_index != obj_thedogkeeper_dog){
		draw_sprite_ext(spr_enemy_0_headless_blood_0, headless_image, x, y, image_xscale, image_yscale, 0, c_white, 1);
	}else{
		draw_sprite_ext(spr_enemy_2_headless_blood_0, headless_image, x, y, image_xscale, image_yscale, 0, c_white, 1);
	}
}