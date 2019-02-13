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

for(var i = 0; i < maxdist; i++){
	
	for(var len = 0; len < 5; len++){
		if (collision_line(xprevious, yprevious, xx + lengthdir_x(len, dir), yy + lengthdir_y(len, dir), parent, false, true)){
			
			if (!precise){
				x = xx + lengthdir_x(9, dir);
				y = yy + lengthdir_y(9, dir);
			}else{
				x = xx;
				y = yy;
			}
			
			break;
		}
	}
	
	xx += lengthdir_x(1, dir);
	yy += lengthdir_y(1, dir);
}

return i;