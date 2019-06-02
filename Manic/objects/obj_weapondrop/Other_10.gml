var yy = wave(-1, -3, 1, 0);
var alpha_glow = wave(0, 0.2, 2.5, 0);
animation += animation_speed;

gpu_set_fog(true, c_black, 0, 0);
draw_sprite_ext(sprite, animation, x, y, scale, scale, angle, c_white, alpha * 0.135);
gpu_set_fog(false, c_black, 0, 0);

if (pickup){
	gpu_set_fog(true, outlinewhite, 0, 0);
	draw_sprite_ext(sprite, animation, x + lengthdir_x(1, angle), y + yy + lengthdir_y(1, angle), scale, scale, angle, c_white, alpha);
	draw_sprite_ext(sprite, animation, x + lengthdir_x(1, angle + 90), y + yy + lengthdir_y(1, angle + 90), scale, scale, angle, c_white, 1);
	draw_sprite_ext(sprite, animation, x + lengthdir_x(1, angle + 180), y + yy + lengthdir_y(1, angle + 180), scale, scale, angle, c_white, 1);
	draw_sprite_ext(sprite, animation, x + lengthdir_x(1, angle + 270), y + yy + lengthdir_y(1, angle + 270), scale, scale, angle, c_white, 1);
	gpu_set_fog(false, c_black, 0, 0);
}

draw_sprite_ext(sprite, animation, x, y + yy, scale, scale, angle, c_white, 1);
mask_index = spr_mask_0;

if (ammo == 0) && (global.weapon_type[index] == WeaponType.Ranged){
    gpu_set_fog(true, c_red, 0, 0);
    draw_sprite_ext(sprite, animation, x, y + yy, scale, scale, angle, c_white, alpha_glow);
    gpu_set_fog(false, c_black, 0, 0);
    draw_set_alpha(1);
}

if (specialweapon){
	if (random(15) < 1){
		part_particles_create(global.ps_front, x + random_range(-4, 4), y + random_range(-4, 4), global.pt_glow_0, 1);
	}
	
	var glow = wave(0.4, 1, 2, 0);
	gpu_set_fog(true, c_white, 0, 0);
	draw_sprite_ext(sprite, 0, x, y + yy, scale, scale, angle, c_white, 0.1 * glow);
	gpu_set_fog(false, c_black, 0, 0);
}