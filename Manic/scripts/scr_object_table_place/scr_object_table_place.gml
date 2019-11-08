///@param depth
///@param depth_fall_mult
var dp = argument[0];
var dp_fall_mult = 1;

if (argument_count > 1){
	dp_fall_mult = argument[1];
}

if (parent != -1){
	if (!instance_exists(parent)){
		if (depth_offset > 0){
			y += depth_fall;
			depth_offset -= depth_fall * dp_fall_mult;
			
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