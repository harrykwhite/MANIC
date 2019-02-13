if (alpha > 0){
	alpha -= alpha_decline;
}else{
	instance_destroy();
}

if (xscale > 0){
	xscale -= size_decline;
}

if (yscale > 0){
	yscale -= size_decline;
}

if (spd > 0){
	scr_motion_control();
}