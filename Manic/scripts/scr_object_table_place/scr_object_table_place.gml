///@param depth
var dp = argument0;

if (parent != -1){
	if (!instance_exists(parent)){
		if (depth_offset > 0){
			y += depth_fall;
			depth_offset -= depth_fall;
			
			if (depth_fall < 3){
				depth_fall += 0.25;
			}
		}else{
			depth_fall = 0;
			depth_offset = 0;
			parent = -1;
		}
	}else{
		depth_offset = dp;
	}
}