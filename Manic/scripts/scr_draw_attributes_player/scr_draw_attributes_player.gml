var drawshader = (global.player_health_current <= 2) || (burn) || (poison) || (i_blend_time > 0) || (whiteflash_alpha > 0);

var ucount = array_length_1d(global.upgrade_name);
if (ucount > 0) || (has_antagonist_mask){
	var uoffset = 0, is_idle = true;
	if (sprite_index == spr_player_idle_0) || (sprite_index == spr_player_idle_1) || (sprite_index == spr_player_idle_2){
		if (image_index == 1){
			uoffset = 1;
		}
	}
	
	if (sprite_index == spr_player_walk_0) || (sprite_index == spr_player_walk_1) || (sprite_index == spr_player_walk_2){
		is_idle = false;
		if (image_index == 2) || (image_index == 4) || (image_index == 9) || (image_index == 11){
			uoffset = 1;
		}
		
		if (image_index == 3) || (image_index == 10){
			uoffset = 2;
		}
	}
	
	for(var i = 0; i < ucount; i ++){
		if (upgrade_has[i]){
			if (!global.upgrade_behind[i]){
				if (i == PlayerUpgrade.RunningBoots) || (i == PlayerUpgrade.KneePads) || (i == PlayerUpgrade.IronGlove){
					if (!in_minecart){
						var walksprite = spr_player_upgrade_runningboots_0_walk;
				
						if (i == PlayerUpgrade.KneePads){
							walksprite = spr_player_upgrade_kneepads_0_walk;
						}else if (i == PlayerUpgrade.IronGlove){
							walksprite = spr_player_upgrade_ironglove_0_walk;
							
							if (sprite_index != spr_player_walk_1){
								continue;
							}
						}
				
						if (is_idle){
							draw_sprite_ext(global.upgrade_sprite[i], 0, x, y + uoffset, image_xscale, image_yscale, image_angle, c_white, image_alpha * i_time_alpha);
						}else{
							draw_sprite_ext(walksprite, image_index, x, y + uoffset, image_xscale, image_yscale, image_angle, c_white, image_alpha * i_time_alpha);
						}
					}
				}else{
					draw_sprite_ext(global.upgrade_sprite[i], 0, x, y + uoffset, image_xscale, image_yscale, image_angle, c_white, image_alpha * i_time_alpha);
				}
			}
		}
	}
	
	if (has_antagonist_mask){
		draw_sprite_ext(spr_antagonist_mask_0, 0, x, y + uoffset, image_xscale, image_yscale, image_angle, c_white, image_alpha * i_time_alpha);
	}
}

if (drawshader){
	shader_set(sh_pawntint);
	var shader_alpha = shader_get_uniform(sh_pawntint, "_alpha");
	var shader_red = shader_get_uniform(sh_pawntint, "_red");
	var shader_green = shader_get_uniform(sh_pawntint, "_green");
	var shader_blue = shader_get_uniform(sh_pawntint, "_blue");
	var r = 0, g = 0, b = 0, a = 0;
	var wv = wave(0.05, 0.1, 2, 0);

	if (global.player_health_current <= 2){
		if (!global.game_pause){
		    if (random(3) < 1){
		        part_particles_create(global.ps_front, x + random_range(-6, 6), y + random_range(-14, 14), global.pt_blood_2, 1);
		    }
		}
    
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
	
		if (!global.game_pause){
			if (random(3) < 1){
				part_particles_create(global.ps_front, x + random_range(-6, 6), y + random_range(-18, 18), global.pt_fire_0, 1);
			}
		
			if (random(5) < 1){
				part_particles_create(global.ps_front, x + random_range(-6, 6), y + random_range(-18, 18), global.pt_fire_2, 1);
			}
			
			if (random(12) < 1){
				part_particles_create(global.ps_front, x + random_range(-6, 6), y + random_range(-18, 18), global.pt_smoke_3, 1);
			}
		}
	}

	if (poison){
		a = wv * 0.7;
		r = 255;
		g = 255;
		b = 255;
	
		draw_self();
	
		if (!global.game_pause){
			if (random(2.5) < 1){
				part_particles_create(global.ps_front, x + random_range(-6, 6), y + random_range(-18, 18), global.pt_poison_0, 1);
			}

			if (random(3.5) < 1){
				part_particles_create(global.ps_front, x + random_range(-6, 6), y + random_range(-18, 18), global.pt_poison_1, 1);
			}
		}
	}

	if (i_blend_time > 0){
		var alpha = (i_blend_time / 5);
		a = alpha * 0.5;
		r = 255;
		g = 0;
		b = 0;
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
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha * i_time_alpha);
	}

	shader_reset();
}