if (global.game_pause){
	image_speed = 0;
	return;
}

// Talking
var yy = y + 6;
var box_x1 = x - (10 * sign(image_xscale));
var box_y1 = yy - 30;
var box_x2 = x + (45 * sign(image_xscale));
var box_y2 = yy + 30;

interact = false;

if (instance_exists(obj_player)) && (!talked_second) && (global.cutscene_current == -1) && (global.game_companion_farmer_level4post_talked_0){
	if (collision_rectangle(box_x1, box_y1, box_x2, box_y2, obj_player, false, true)){
		if (obj_controller_ui.dialogue_time <= 0){
			interact = true;
			scr_ui_control_indicate("Talk");
			
			if (interact_break <= 0){
				if (scr_input_is_pressed(InputBinding.Interact) && global.player_stamina_active){
					interact_break = 15;
					
					scr_player_stamina_drain(4);
					
					if (!global.game_npc_townperson6_talked){
						global.cutscene_current = 58;
						talking = true;
					}else{
						obj_controller_ui.pausedialogue = true;
						obj_controller_ui.pausedialogue_type = 1;
						obj_controller_ui.pausedialogue_type_text = "Enter the prison?";
						obj_controller_ui.pausedialogue_option_exittext = "Resume";
						obj_controller_ui.pausedialogue_type_option[0] = "Leave now";
						obj_controller_ui.pausedialogue_type_option_scale[0] = 1;
						obj_controller_ui.pausedialogue_type_option_special[0] = 2;
						obj_controller_ui.pausedialogue_type_option_cutscene[0] = -1;
						obj_controller_ui.pausedialogue_option_max = 1;
						scr_toggle_pause(true);
					}
				}
			}else{
				interact_break --;
			}
		}
	}
}

// Sprite
sprite_index = spr_townperson_6_idle_0;
image_speed = 0.02;

if (instance_exists(obj_player)){
	if (obj_player.x > x){
		image_xscale = scale;
	}else{
		image_xscale = -scale;
	}
	
	image_yscale = scale;
}