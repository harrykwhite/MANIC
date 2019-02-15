rect_x1 = 912;
rect_y1 = 1072;
rect_x2 = 1055;
rect_y2 = 1135;

var base_x = 912;
var base_y = 1072;
var counter = 0;

for(var i = 0; i < 8; i++){
	trail_x[counter] = base_x + (i * 16) + 16;
	trail_y[counter] = base_y - 12;
	trail_dir[counter] = 0;
	counter++;
}

for(var i = 7; i >= 0; i--){
	trail_x[counter] = base_x + (i * 16) + 16;
	trail_y[counter] = base_y + 32 + 4;
	trail_dir[counter] = 0;
	counter++;
}