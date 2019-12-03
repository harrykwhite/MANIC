var height = ds_grid_height(global.player_companions);
for(var i = 0; i < height; i ++){
	if (global.player_companions[# 0, i] != -1){
		var comp, cobj = global.player_companions[# 0, i];
		
		var px = clamp(obj_player.x, 27, room_width - 27);
		var py = clamp(obj_player.y, 27, room_height - 27);
		
		if (!instance_exists(cobj)){
			comp = instance_create(px, py, cobj);
		}else{
			comp = cobj.id;
			comp.x = px;
			comp.y = py;
		}
		
		comp.registered = true;
		
		if (global.player_companions[# 1, i] != -1){
			comp.health_current = global.player_companions[# 1, i];
		}
	}
}