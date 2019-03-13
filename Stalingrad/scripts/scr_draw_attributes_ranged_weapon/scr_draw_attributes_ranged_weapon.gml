var alpha = wave(0, 0.2, 2.5, 0);
if (index != PlayerWeapon.MountedMachineGun){
	if (global.weapon_slotammo[global.weapon_slotcurrent] <= 0) && (global.weapon_type[index] == WeaponType.Ranged){
	    gpu_set_fog(true, c_red, 0, 0);
	    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, alpha);
	    gpu_set_fog(false, c_black, 0, 0);
	}
}