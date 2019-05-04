///@param index
///@param getwidth
var index = argument0;
var getwidth = argument1;
var dwidth = display_get_width();
var dheight = display_get_height();

var ww = dwidth;
var hh = dheight;

switch(index){
	case 0:
		ww = 800;
		hh = 600;
		break;
	
	case 1:
		ww = 1024;
		hh = 768;
		break;
	
	case 2:
		ww = 1280;
		hh = 800;
		break;
	
	case 3:
		ww = 1366;
		hh = 768;
		break;
	
	case 4:
		ww = 1440;
		hh = 900;
		break;
	
	case 5:
		ww = 1536;
		hh = 864;
		break;
	
	case 6:
		ww = 1600;
		hh = 900;
		break;
	
	case 7:
		ww = 1920;
		hh = 1080;
		break;
}

if (getwidth){
	return ww;
}else{
	return hh;
}