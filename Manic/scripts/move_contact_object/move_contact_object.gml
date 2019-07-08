///@param dir
///@param maxdistance
///@param parent
var dir = argument[0];
var maxdist = argument[1];
var parent = argument[2];
var precise = false;

if (argument_count > 3){
	precise = argument[3];
}

var xx = x;
var yy = y;

if (maxdist == -1){
	maxdist = 1000;
}

for(var i = 0; i < maxdist; i ++){
	if (place_meeting(xx, yy, parent)){
		break;
	}
	
	xx = xx + lengthdir_x(2, dir);
	yy = yy + lengthdir_y(2, dir);
}

return i;