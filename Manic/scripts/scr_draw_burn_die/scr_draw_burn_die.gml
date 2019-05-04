///@param wradius
///@param hradius
///@param xx
///@param yy
///@param number
var wradius = argument[0];
var hradius = argument[1];

var px = x;
var py = y;
var num = 6;

switch(argument_count){
	case 3:
		px = argument[2];
		break;
	
	case 4:
		px = argument[2];
		py = argument[3];
		break;
	
	case 5:
		px = argument[2];
		py = argument[3];
		num = argument[4];
		break;
}


part_type_direction(global.pt_smoke_5, 0, 360, 0, 0);
repeat(num){
	part_particles_create(global.ps_front, px + random_range(-wradius, wradius), py + random_range(-hradius, hradius), global.pt_smoke_5, 1);
}