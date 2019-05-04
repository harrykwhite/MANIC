// Returns a list of possible resolution options
var options = ds_list_create();
var dwidth = display_get_width();
var dheight = display_get_height();

for(var i = 0; i < 8; i ++){
	var ww = 0;
	var hh = 0;
	
	switch(i){
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
	
	if (ww >= dwidth) || (hh >= dheight){
		break;
	}
	
	ds_list_add(options, string(ww) + "x" + string(hh));
}

if (ds_list_find_index(options, string(dwidth) + "x" + string(dheight)) == -1){
	ds_list_add(options, string(dwidth) + "x" + string(dheight));
}

return options;