if (i_blendTime > 0){
	var colour = make_colour_rgb(163, 42, 45);
	if (object_index == obj_enemy_3){
		colour = c_white
	}
	
	gpu_set_fog(true, colour, 0, 0);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, ((1-(1 / i_blendTime)) * image_alpha) + 0.1);
	gpu_set_fog(false, c_black, 0, 0);
}

if (object_index != obj_enemy_3){
	if (health_current <= max(floor(health_max / 3), 1)) || (bleed){
		if (!global.game_pause){
		    if (random(3)<1){
		        part_particles_create(global.ps_front, x + random_range(-6, 6), y + random_range(-14, 14), global.pt_blood_2, 1);
		    }
		}
    
		gpu_set_fog(true, make_colour_rgb(117, 39, 39), 0, 0);
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, -1, wave(0.15, 0.25, 2, 0));
		gpu_set_fog(false, c_black, 0, 0);
	}
}

if (whiteflash_alpha > 0){
	gpu_set_fog(true, c_white, 0, 0);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, -1, whiteflash_alpha);
	gpu_set_fog(false, c_black, 0, 0);
}

if (object_index == obj_enemy_0) || (object_index == obj_enemy_2) ||  (object_index == obj_thedogkeeper_dog) || (object_index == obj_thescorched) || (object_index == obj_thedogkeeper) || (object_index == obj_companion_0) || (object_index == obj_companion_1) || (object_index == obj_companion_2) || (object_index == obj_companion_3){
	if (burn){
		scr_draw_burn(6, 18, x, y + 3, image_alpha);
	}

	if (poison){
		scr_draw_poison(6, 18, x, y + 3, image_alpha);
	}
	
	if (headless){
		headless_image += 0.35;
		
		if (object_index != obj_enemy_2) && (object_index != obj_companion_3) && (object_index != obj_thedogkeeper_dog){
			draw_sprite_ext(spr_enemy_0_headless_blood_0, headless_image, x, y, image_xscale, image_yscale, 0, c_white, 1);
		}else{
			draw_sprite_ext(spr_enemy_2_headless_blood_0, headless_image, x, y, image_xscale, image_yscale, 0, c_white, 1);
		}
	}
}else if (object_index == obj_enemy_1){
	if (burn){
		scr_draw_burn(6, 6, x, y - 10, image_alpha);
	}

	scr_draw_poison(6, 6, x, y - 10, image_alpha);
}