var drawshader = (global.player_health_current <= 2) || (burn) || (poison) || (i_blend_time > 0) || (whiteflash_alpha > 0);

var upgrades = global.player_upgrades;
var usize = ds_list_size(upgrades);

if (usize > 0){
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
	
	for(var i = 0; i < usize; i ++){
		var upgrade = upgrades[| i];
		if (!global.upgrade_behind[upgrade]){
			if (upgrade == PlayerUpgrade.RunningBoots) || (upgrade == PlayerUpgrade.KneePads){
				var rboots = upgrade == PlayerUpgrade.RunningBoots;
				var walksprite = spr_player_upgrade_runningboots_0_walk;
				
				if (!rboots){
					walksprite = spr_player_upgrade_kneepads_0_walk;
				}
				
				if (is_idle){
					draw_sprite_ext(global.upgrade_sprite[upgrade], 0, x, y + uoffset, image_xscale, image_yscale, image_angle, c_white, image_alpha);
				}else{
					draw_sprite_ext(walksprite, image_index, x, y + uoffset, image_xscale, image_yscale, image_angle, c_white, image_alpha);
				}
			}else{
				draw_sprite_ext(global.upgrade_sprite[upgrade], 0, x, y + uoffset, image_xscale, image_yscale, image_angle, c_white, image_alpha);
			}
		}
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
		draw_self();
	}

	shader_reset();
}