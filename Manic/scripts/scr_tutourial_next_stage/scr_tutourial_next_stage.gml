var tut_count = array_length_1d(obj_controller_ui.tutourial_text);

with(obj_controller_ui){
	if (tutourial_stage < tut_count - 1){
		tutourial_stage ++;
		tutourial_scale = 1.3;
	}else{
		tutourial_fade = true;
	}
	
	if (tutourial_stage == TutourialStage.CollectAmmo){
		var x1 = 1724;
		var y1 = 712;
		var x2 = 1808;
		var y2 = 758;
		
		var templist = ds_list_create();
		var envcount = collision_rectangle_list(x1, y1, x2, y2, obj_p_environhit, false, true, templist, false);
		
		if (envcount <= 0){
			if (tutourial_stage < tut_count - 1){
				tutourial_stage ++;
				tutourial_scale = 1.3;
			}else{
				tutourial_fade = true;
			}
		}
		
		ds_list_destroy(templist);
	}else if (tutourial_stage == TutourialStage.ThrowPurpose){
		tutourial_stage_timer = 60 * 4;
	}
}