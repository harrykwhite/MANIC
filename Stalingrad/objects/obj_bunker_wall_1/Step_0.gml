var rectx = x - (sprite_width / 2);
var recty = y - (sprite_height / 2);
var rectw = sprite_width;
var recth = sprite_height + 10;
var list = ds_list_create();
var count = collision_rectangle_list(rectx, recty, rectx + rectw, recty + recth, obj_p_explosive, false, true, list, false);

if (count > 0){
	for(var i = 0; i < count; i++){
		list[| i].explode = true;
		explode_anim = true;
	}
}

ds_list_destroy(list);

if (explode_anim){
	if (scale < 1.2){
		scale += 0.03;
	}else{
		explode = true;
	}
	
	image_xscale = scale;
	image_yscale = scale;
}

if (explode){
	if (instance_exists(tie)) && (tie != noone){
		tie.fade = true;
	}
	
	repeat(10){
		part_particles_create(global.ps_front, rectx + random(rectw), recty + random(recth), global.pt_wood_2, 1);
	}
	
	repeat(10){
		part_particles_create(global.ps_front, rectx + random(rectw), recty + random(recth), global.pt_burst_3, 1);
	}
	
	var brk = instance_create(x - (sprite_width / 2), y - (sprite_height / 2), obj_break);
	brk.shake = 2;
	brk.sprite_index = spr_bunker_wall_1_remains;
	
	scr_effect_screenshake(5);
	scr_effect_freeze(2);
	instance_destroy();
}