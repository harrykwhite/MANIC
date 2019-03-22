///@param x
///@param y
///@param offset
var xx = argument[0], yy = argument[1], offset = 4;

if (argument_count > 2){
	offset = argument[2];
}

if (instance_exists(obj_player)){
	
	var x1 = (sprite_get_bbox_left(sprite_index) - 12) - offset;
	var y1 = (sprite_get_bbox_top(sprite_index) - 12) - offset;
	var x2 = (sprite_get_bbox_right(sprite_index) + 12) + offset;
	var y2 = (sprite_get_bbox_bottom(sprite_index) + 12) + offset;
	
	if (collision_rectangle(x1, y1, x2, y2, obj_p_player, false, true)){
		shake = 0;
		x = xstart;
		y = ystart;
	}
	
	if (collision_rectangle(x1, y1, x2, y2, obj_p_enemy, false, true)){
		shake = 0;
		x = xstart;
		y = ystart;
	}
}