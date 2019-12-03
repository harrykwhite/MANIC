scr_weapon_melee_end_update(13);

if (kill){
	instance_destroy();
	global.weapon_slot[global.weapon_slotcurrent] = -1;
	
	scr_sound_play(snd_weapon_stick_break_0, false, 0.8, 1.2);
	
	var sticklen = 33 / 3, thislen = 0;
	repeat(sticklen){
		part_particles_create(global.ps_bottom, x + lengthdir_x(thislen, image_angle), y + lengthdir_y(thislen, image_angle), global.pt_stick_break_0, 1);
		part_particles_create(global.ps_bottom, x + lengthdir_x(thislen, image_angle), y + lengthdir_y(thislen, image_angle), global.pt_stick_break_flash_0, 1);
		thislen += 3;
	}
}