var yy = wave(-1, -3, 1, 0);
var noammo_glow = wave(0.15, 0.3, 2.5, 0);
animation += animation_speed;

// Shadow
gpu_set_fog(true, c_black, 0, 0);
draw_sprite_ext(sprite, animation, x, y, scale, scale, angle, c_white, alpha * 0.135);
gpu_set_fog(false, c_black, 0, 0);

// Outline
var outline_alpha = 0.8;
var outline_colour = outlineweapondrop;

if (pickup){
	outline_colour = outlinewhite;
	outline_alpha = 1;
}

if (obj_controller_all.show_ui){
	gpu_set_fog(true, outline_colour, 0, 0);
	draw_sprite_ext(sprite, animation, x + lengthdir_x(1, angle), y + yy + lengthdir_y(1, angle), scale, scale, angle, c_white, alpha * outline_alpha);
	draw_sprite_ext(sprite, animation, x + lengthdir_x(1, angle + 90), y + yy + lengthdir_y(1, angle + 90), scale, scale, angle, c_white, alpha * outline_alpha);
	draw_sprite_ext(sprite, animation, x + lengthdir_x(1, angle + 180), y + yy + lengthdir_y(1, angle + 180), scale, scale, angle, c_white, alpha * outline_alpha);
	draw_sprite_ext(sprite, animation, x + lengthdir_x(1, angle + 270), y + yy + lengthdir_y(1, angle + 270), scale, scale, angle, c_white, alpha * outline_alpha);
	gpu_set_fog(false, c_black, 0, 0);
}

// Base sprite
draw_sprite_ext(sprite, animation, x, y + yy, scale, scale, angle, c_white, alpha);
mask_index = spr_mask_0;

// No ammo effects
if (ammo == 0) && (global.weapon_type[index] == WeaponType.Ranged){
    gpu_set_fog(true, c_red, 0, 0);
    draw_sprite_ext(sprite, animation, x, y + yy, scale, scale, angle, c_white, alpha * noammo_glow);
    gpu_set_fog(false, c_black, 0, 0);
    draw_set_alpha(1);
}

// Special weapon effects
if (specialweapon){
	/*if (!global.game_pause){
		if (!place_meeting(x, y, obj_block_cover)){
			if (random(13) < 1){
				part_particles_create(global.ps_front, x + random_range(-4, 4), y + random_range(-4, 4), global.pt_glow_0, 1);
			}
		}
	}*/
	
	var glow = wave(0.25, 0.65, 2, 0);
	gpu_set_fog(true, c_white, 0, 0);
	draw_sprite_ext(sprite, 0, x, y + yy, scale, scale, angle, c_white, alpha * glow * 0.4);
	gpu_set_fog(false, c_black, 0, 0);
}