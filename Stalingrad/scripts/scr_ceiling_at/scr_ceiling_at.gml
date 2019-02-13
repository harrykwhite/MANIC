///@param x
///@param y
if (global.level_current == 2) || (global.level_current == 4){
	return false;
	exit;
}

var xx = argument0;
var yy = argument1;
var ceiling = scr_colliding_interior_ceiling(xx, yy);
var iback = scr_colliding_interior_back(xx, yy);
var r = false;

for(var i = 0; i < 15; i += 5){
	
	if (iback == noone){
		iback = scr_colliding_interior_back(xx, yy + i);
	}else{
		break;
	}
}

if (ceiling != noone) && (iback == noone){
	
	if (ceiling.image_alpha > 0.6){
		r = true;
	}
}

return r;