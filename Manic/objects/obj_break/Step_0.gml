if (shake > 0){
	x = xstart + random_range(-shake, shake);
	y = ystart + random_range(-shake, shake);
	shake *= 0.9;
}else{
	x = xstart;
	y = ystart;
}