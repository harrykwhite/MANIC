if (instance_exists(owner)){
	if (owner.health_current <= floor(owner.health_max / 3)){
	    gpu_set_fog(true, make_colour_rgb(117, 39, 39), 0, 0);
	    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, wave(0.15, 0.25, 2, 0) * image_alpha * (1 - owner.whiteflash_alpha));
	    gpu_set_fog(false, c_black, 0, 0);
	}
	
	if (owner.burn_time){
		gpu_set_fog(true, c_white, 0, 0);
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 0.125 * image_alpha);
		gpu_set_fog(false, c_black, 0, 0);
	}
	
	if (owner.object_index != obj_thescorched){
		if (owner.poison_time){
			gpu_set_fog(true, c_white, 0, 0);
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 0.1 * image_alpha);
			gpu_set_fog(false, c_black, 0, 0);
		}
	}

	if (owner.whiteflash_alpha > 0){
		gpu_set_fog(true, c_white, 0, 0);
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, owner.whiteflash_alpha * image_alpha);
		gpu_set_fog(false, c_black, 0, 0);
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
			
		        draw_sprite_ext(sprite_index, 1, x + lengthdir_x(4, angle), (y - 1) + lengthdir_y(4, angle), 1, image_yscale, angle, c_white, 1);
			
		        if (owner.health_current <= floor(owner.health_max / 3)){
		            gpu_set_fog(true, make_colour_hsv(0, 60, 60), 0, 0);
		            draw_sprite_ext(sprite_index, 1, x + lengthdir_x(4, angle), (y - 1) + lengthdir_y(4, angle), 1, image_yscale, angle, c_white, wave(0.15, 0.25, 2, 0));
		            gpu_set_fog(false, c_black, 0, 0);
		        }
		
				if (owner.burn){
					gpu_set_fog(true, c_white, 0, 0);
					draw_sprite_ext(sprite_index, 1, x + lengthdir_x(4, angle), (y - 1) + lengthdir_y(4, angle), 1, image_yscale, angle, c_white, 0.225);
					gpu_set_fog(false, c_black, 0, 0);
				}
			
				if (owner.poison){
					gpu_set_fog(true, c_white, 0, 0);
					draw_sprite_ext(sprite_index, 1, x + lengthdir_x(4, angle), (y - 1) + lengthdir_y(4, angle), 1, image_yscale, angle, c_white, 0.15);
					gpu_set_fog(false, c_black, 0, 0);
				}
			
				if (owner.whiteflash_alpha > 0){
					gpu_set_fog(true, c_white, 0, 0);
					draw_sprite_ext(sprite_index, 1, x + lengthdir_x(4, angle), (y - 1) + lengthdir_y(4, angle), 1, image_yscale, angle, c_white, owner.whiteflash_alpha * image_alpha);
					gpu_set_fog(false, c_black, 0, 0);
				}
		    }
		}
	}
}