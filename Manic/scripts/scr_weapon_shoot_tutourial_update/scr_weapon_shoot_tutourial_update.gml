if (global.level_current == Level.Prologue){
	with(obj_controller_ui){
		if (tutourial) && (tutourial_stage == TutourialStage.Shoot) && ((tutourial_stage_timer == -1) || (tutourial_stage_timer > 60 * 2)){
			tutourial_stage_timer = 60 * 2;
		}
	}
}