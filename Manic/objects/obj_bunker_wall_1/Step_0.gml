var rectx = x;
var recty = y;
var rectw = sprite_width;
var recth = sprite_height + 10;
var list = ds_list_create();
var count = collision_rectangle_list(rectx, recty, rectx + rectw, recty + recth, obj_p_explosive, false, true, list, false);

if (count > 0){
	for(var i = 0; i < count; i ++){
		list[| i].explode = true;
		explode = true;
	}
}

ds_list_destroy(list);

if (explode){
	if (instance_exists(tie)) && (tie != noone){
		tie.fade = true;
	}
	
	repeat(16)part_particles_create(global.ps_bottom, x + random(sprite_width), y + ((sprite_height - 10) / 2) + random_range(-5, 5), global.pt_wood_0, 1);
	repeat(6)part_particles_create(global.ps_bottom, x + random(sprite_width), y + ((sprite_height - 10) / 2) + random_range(-5, 5), global.pt_scraps_0, 1);
	repeat(3)part_particles_create(global.ps_bottom, x + (sprite_width / 2) + random_range(-4, 4), y + (sprite_height / 2) + random(5), global.pt_bunker_parts_0_perm, 1);
	
	var brk = instance_create(x, y, obj_break);
	brk.shake = 4;
	brk.sprite_index = spr_bunker_wall_1_remains;
	
	scr_effect_screenshake(5);
	scr_effect_freeze(9);
	scr_sound_play_distance(snd_object_box_break_0, false, 300);
	instance_destroy();
}