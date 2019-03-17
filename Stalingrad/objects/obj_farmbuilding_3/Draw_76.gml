var list = declist;
scr_render_me(y + depth_offset);

if (decnum > 0){
	for(var i = 0; i < decnum; i++){
		var inst = list[| i];
		with(inst){
			scr_render_me(other.y + other.depth_offset + 15);
			image_alpha = other.image_alpha;
		}
	}
}