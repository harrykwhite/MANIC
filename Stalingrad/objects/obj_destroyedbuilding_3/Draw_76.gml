scr_depth_controller(y + depth_offset, -1);

if (decnum > 0){
	
	for(var i = 0; i < decnum; i++){
		
		with(declist[| i]){
			scr_depth_controller(other.y + other.depth_offset + 5, -1);
			image_alpha = other.image_alpha;
		}
	}
}