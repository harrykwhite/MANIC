scr_render_me(y + depth_offset);

if (decnum > 0){
	for(var i = 0; i < decnum; i++){
		var inst = declist[| i];
		with(inst){
			scr_render_me(other.y + other.depth_offset + 5);
			image_alpha = other.image_alpha;
		}
	}
}