/// @param frame_speed
var fs = argument0;

if (global.game_option[| Options.ScreenFreeze]){
	if (!instance_exists(obj_ef_freeze)){
	    f = instance_create(0, 0, obj_ef_freeze);
	    f.framespd = fs;
	}else{
	    with(obj_ef_freeze){
	        framespd = fs;
	    }
	}
}