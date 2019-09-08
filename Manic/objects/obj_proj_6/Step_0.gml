if (global.game_pause) || (enemy && global.cutscene_current != -1){
	image_speed = 0;
	return;
}

if (owner != noone){
	if (!instance_exists(owner)){
		instance_destroy();
		return;
	}
	
	spd = 0;
	damage = false;
	
	x = owner.x - owner_offset_x;
	y = owner.y - owner_offset_y;
}else{
	for(var len = 0; len < spd; len ++){
		var colat = instance_place(x - lengthdir_x(9, dir), y - lengthdir_y(9, dir), obj_p_solid);
	
		if (colat != noone){
			if (colat.object_index != obj_p_depth_environhit) && (object_get_parent(colat.object_index) != obj_p_depth_environhit){
				deffect = true;
				instance_destroy();
				return;
			}
		}
	
		x += lengthdir_x(1, dir);
		y += lengthdir_y(1, dir);
	}
}