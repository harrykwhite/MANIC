var px = global.player_position_x div map_tile_width;
var py = global.player_position_y div map_tile_height;
var pradius = 20;

for(var yy = -pradius; yy < pradius; yy ++){
	for(var xx = -pradius; xx < pradius; xx ++){
		var tx = px + xx;
		var ty = py + yy;
		
		if (tx >= 0 && ty >= 0 && tx < map_width && ty < map_height){
			map_found[tx, ty] = true;
		}
	}
}