x += (x_to - x) * spd;
y += (y_to - y) * spd;

if (yoffset_time < 180){
	yoffset_time += 2;
}else{
	yoffset_time = 0;
}