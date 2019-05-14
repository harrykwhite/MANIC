var tut_count = array_length_1d(obj_controller_ui.tutourial_text);

with(obj_controller_ui){
	if (tutourial_stage < tut_count - 1){
		tutourial_stage ++;
		tutourial_scale = 1.3;
	}else{
		tutourial_fade = true;
	}
}