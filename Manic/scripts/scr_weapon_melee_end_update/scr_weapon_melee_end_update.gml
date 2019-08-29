///@param length
var length = argument0;

if (instance_exists(obj_player)){
	var mdir = point_direction(obj_player.x, obj_player.y, scr_input_get_mouse_x(), scr_input_get_mouse_y());
	var angle = mdir + (0.3 * angle_offset_current);
	
	if (!global.game_pause){
		angle_offset_current = approach(angle_offset_current, angle_offset, 40);
		
		x = obj_player_arm.x + lengthdir_x(length + 1, angle);
		y = obj_player_arm.y + lengthdir_y(length + 1, angle);
		
		image_angle = mdir + angle_offset_current;
		
		if (angle_offset_current < 0){
			image_yscale = 1;
		}else{
			image_yscale = -1;
		}
	}
	
	obj_player_arm.image_angle = angle;
    
    if (obj_player.state == scr_player_dash) || (global.cutscene_current != -1){
        visible = false;
        attack_can = false;
    }else{
		visible = true;
	}
}else{
	instance_destroy();
}