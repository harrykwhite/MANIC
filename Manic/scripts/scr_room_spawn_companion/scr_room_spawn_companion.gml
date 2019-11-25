var height = ds_grid_height(global.player_companions);
for(var i = 0; i < height; i ++){
	if (global.player_companions[# 0, i] != -1){
		var comp, cobj = global.player_companions[# 0, i];
		
		if (!instance_exists(cobj)){
			comp = instance_create(obj_player.x, obj_player.y, cobj);
		}else{
			comp = cobj.id;
			comp.x = obj_player.x;
			comp.y = obj_player.y;
		}
		
		comp.registered = true;
		
		if (global.player_companions[# 1, i] != -1){
			comp.health_current = global.player_companions[# 1, i];
		}
	}
}