///@param length
var length = argument0;

if (instance_exists(obj_player)){
	
	if (!global.game_pause){
	    var mdir = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);
	    angle_offset_current = approach(angle_offset_current, angle_offset, 40);
		
		x = obj_player_arm.x + lengthdir_x(length, mdir);
		y = obj_player_arm.y + lengthdir_y(length, mdir);
		image_angle = mdir + angle_offset_current;
			
		if (angle_offset_current < 0){
			image_yscale = 1;
		}else{
			image_yscale = -1;
		}
	}
    
    if (obj_player.state == scr_player_dash) || (global.cutscene_current != -1){
        visible = false;
        attack_can = false;
    }else{
		visible = true;
	}
}else{
	instance_destroy();
}