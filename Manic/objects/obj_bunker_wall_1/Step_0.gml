var rectx = x;
var recty = y;
var rectw = sprite_width;
var recth = sprite_height + 10;
var list = ds_list_create();
var count = collision_rectangle_list(rectx, recty, rectx + rectw, recty + recth, obj_p_explosive, false, true, list, false);

if (count > 0){
	for(var i = 0; i < count; i ++){
		list[| i].explode = true;
		explode_anim = true;
	}
}

ds_list_destroy(list);

if (explode_anim){
	if (explode_anim_time < 15){
		explode_anim_time ++;
	}else{
		explode_anim_time = 0;
		explode_anim = false;
		explode = true;
	}
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
	
	var brk = instance_create(x, y, obj_break);
	brk.shake = 2;
	brk.sprite_index = spr_bunker_wall_1_remains;
	
	scr_effect_screenshake(4);
	scr_effect_freeze(7);
	instance_destroy();
}