var height = ds_grid_height(global.player_companions);
for(var i = 0; i < height; i ++){
	if (global.player_companions[# 0, i] != -1){
		var comp, cobj = global.player_companions[# 0, i];
		
		var px = clamp(obj_player.x, 12, room_width - 12);
		var py = clamp(obj_player.y, 12, room_height - 12);
		
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