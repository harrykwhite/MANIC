if (parent != -1){
	depth_offset = 36;
	
	if (!instance_exists(parent)){
		x = x + random_range(-3, 3);
		y = y + random_range(-2, 2);
		
		depth_offset = 0;
		parent = -1;
	}
}