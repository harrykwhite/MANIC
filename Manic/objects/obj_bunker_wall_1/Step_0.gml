var rectx = x;
var recty = y;
var rectw = sprite_width;
var recth = sprite_height + 10;

var list = ds_list_create();
var count = collision_rectangle_list(rectx, recty, rectx + rectw, recty + recth, obj_p_depth_explosive, false, true, list, false);

if (count > 0){
	for(var i = 0; i < count; i ++){
		list[| i].explode = true;
		explode = true;
	}
}

ds_list_destroy(list);

if (explode){
	if (instance_exists(tie)) && (tie != noone){
		instance_destroy(tie);
	}
	
	repeat(14)part_particles_create(global.ps_bottom, x + random(sprite_width), y + (sprite_height - 10) + random_range(-8, 4), global.pt_wood_0, 1);
	repeat(8)part_particles_create(global.ps_bottom, x + random(sprite_width), y + (sprite_height - 10) + random_range(-3, 4), global.pt_scraps_0, 1);
	
	part_particles_create(global.ps_bottom, x + ((sprite_width / 4) * 1), y + (sprite_height - 10) + random_range(2, 8), global.pt_bunker_parts_0_perm, 2);
	part_particles_create(global.ps_bottom, x + ((sprite_width / 4) * 2), y + (sprite_height - 10) + random_range(2, 8), global.pt_bunker_parts_0_perm, 2);
	part_particles_create(global.ps_bottom, x + ((sprite_width / 4) * 3), y + (sprite_height - 10) + random_range(2, 8), global.pt_bunker_parts_0_perm, 2);
	
	var brk = instance_create(x, y, obj_break);
	brk.shake = 3;
	brk.sprite_index = spr_bunker_wall_1_remains;
	
	scr_effect_freeze(6);
	scr_effect_vignette_flash(c_white, 0.3, 0.025);
	scr_effect_screenshake(3);
	scr_sound_play_distance(snd_object_box_break_0, false, 300);
	
	with(obj_controller_gameplay){
		scr_map_clear();
		scr_map_fill();
	}
	
	instance_destroy();
}