rect_x1 = 544;
rect_y1 = 416;
rect_x2 = 687;
rect_y2 = 559;
var counter = 0;

for(var i = 0; i < 8; i++){
	trail_x[counter] = rect_x1 + (i * 16) + 16;
	trail_y[counter] = (rect_y1 - 12) - 4;
	trail_dir[counter] = 0;
	counter++;
}

for(var i = 7; i >= 0; i--){
	trail_x[counter] = rect_x1 + (i * 16) + 16;
	trail_y[counter] = rect_y1 + (16 * 7) + 4;
	trail_dir[counter] = 0;
	counter++;
}