var height = ds_grid_height(global.player_companions);
for(var i = 0; i < height; i ++){
	if (global.player_companions[# 0, i] != -1){
		var comp = instance_create(obj_player.x, obj_player.y, global.player_companions[# 0, i]);
	
		if (global.player_companions[# 1, i] != -1){
			comp.health_current = global.player_companions[# 1, i];
		}
	}
}