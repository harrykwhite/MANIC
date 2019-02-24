///@param total
var total = argument0;
var interval = 3200, s = true;

/*switch(global.level_current){
	case 0:
		interval = 4000;
		break;
	
	case 1:
		interval = 3000;
		break;
	
	case 2:
		interval = 2500;
		break;
	
	case 3:
		interval = 2600;
		break;
	
	case 4:
		interval = 5000;
		break;
	
	case 5:
		interval = 1600;
		break;
	
	case 6:
		interval = 2500;
		break;
	
	case 7:
		interval = 2500;
		break;
	
	case 8:
		interval = 4000;
		break;
}*/

for(var i = 0; i < 15; i++){
	if (within(total, i * interval, ((i + 1) * interval) - 1)){
		rank = i;
		s = false;
	}
}

if (s){
	rank = Grade.S;
}

return rank;