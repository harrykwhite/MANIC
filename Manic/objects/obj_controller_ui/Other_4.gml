if (start_run){
	return;
}

if (global.pers_runthrough){
	instance_deactivate_object(object_index);
	return;
}

var iskeyboard = (global.game_input_type == InputType.Keyboard);

// Setup
global.level_current = scr_level_get_index(room);

if (global.game_is_playthrough){
	global.game_save_level = global.level_current;
}

playerhit_alpha = 0;
playerhit_colour = c_maroon;

vignette_flash_alpha = 0;
vignette_flash_alpha_speed = 0.05;
vignette_flash_colour = c_white;

arena_scale = 1;
arena_score_scale = 1;
arena_score_current = 0;

objective_scale = 1;

weaponammo_x = 0;

dialogue = "";
dialogue_voice = noone;
dialogue_voice_opened = false;
dialogue_voice_closed = true;
dialogue_char_count = 0;
dialogue_char_speed = 1;
dialogue_length = 0;
dialogue_time = 0;
dialogue_pause = false;
dialogue_next = false;
dialogue_x = 0;
dialogue_y = 0;
dialogue_skip = 0;
dialogue_skip_max = 40;
dialogue_break = 0;

enum TutourialStage{
	Movement,
	Dash,
	Pickup,
	Shoot,
	Throw,
	ThrowPurpose,
	PickupMelee,
	Switch,
	CollectAmmo,
}

tutourial = false;
tutourial_scale = 1;
tutourial_alpha = 1;
tutourial_fade = false;
tutourial_stage = 0;
tutourial_stage_timer = -1;
tutourial_stage_timer_max = 60 * 8;
tutourial_stage_moving_time = 0;
tutourial_stage_pickupmelee_cseen = false;
tutourial_stage_pickupmelee_equipped = false;
tutourial_stage_ammocollected_done = false;

scr_tutourial_names_set();

if (global.level_current == Level.Prologue){
	tutourial = true;
}

ui_alpha = 1;

redtint_alpha = 0;
redtint_alphato = 0;
redtint_flash = 0;

pause_text_update = false;
pause_text_alpha = 0;
pause_selected = iskeyboard ? -1 : 0;
pause_selected_previous = pause_selected;
pause_selected_break = 0;
pause_selected_held_time = 0;
pause_selected_held_time_max = 40;
pause_has_selected = false;
pause_has_selected_index = iskeyboard ? -1 : 0;
pause_has_selected_time = 0;
pause_selectoption[0] = "Resume";
pause_selectoption_scale[0] = 1;
pause_selectoption[1] = "Exit to Titlescreen";
pause_selectoption_scale[1] = 1;
pause_selectoption[2] = "Exit to Desktop";
pause_selectoption_scale[2] = 1;
pause_selectedmax = array_length_1d(pause_selectoption);

game_opening_intro = true;
game_opening_intro_startbreak = 30;
game_opening_intro_speed = 1.5;
game_opening_intro_alpha = 4.7;
game_opening_intro_text_alpha = -0.25;
game_opening_intro_text_stage = 0;
game_opening_intro_text_time = 60 * 7;

if (global.level_current != Level.Prologue){
	game_opening_intro = false;
}

header_display_text = "";
header_display_subtext = "";
header_display_time = 0;
header_display_alpha = 0;
header_display_line_width = 0;

checkpoint_text_alpha = 0;
checkpoint_text_time = 0;

unlock_text = "";
unlock_text_alpha = 0;
unlock_text_time = 0;

level_opening = false;
level_opening_line_width = 0;
level_opening_text_alpha = 0;
level_opening_alpha = 1;
level_opening_time = 0;
level_opening_active = false;

var levelcount = global.level_campaign_count;

if (room == rm_prologue_00){
	global.level_entered[0] = false;
}

if (scr_level_is_arena()){
	scr_companions_clear();
	scr_player_upgrades_clear();
	scr_set_kills_and_findings();
	
	global.weapon_default_set = false;
}

if (!global.pers_runthrough_pre){
	for(var i = 0; i < levelcount; i ++){
		if (room == global.level_room[i]){
			if (!global.level_entered[i]){
				var upgradecount = array_length_1d(global.upgrade_name);
				
				global.game_objective_set = false;
				global.game_objective_complete = false;
				
				if (!global.game_is_playthrough) || (room == rm_prologue_00){
					scr_companions_clear();
					scr_player_upgrades_clear();
					scr_set_kills_and_findings();
					
					if (global.level_complete[i]){
						global.game_objective_set = true;
						global.game_objective_complete = true;
					}
					
					global.weapon_default_set = false;
				}else{
					scr_save_game();
					scr_player_upgrades_clear();
				
					global.level_complete[i] = false;
				
					for(var u = 0; u < upgradecount; u ++){
						if (global.game_save_upgrade_unlocked[u]){
							scr_upgrade_add(u);
						}
					}
				}
				
				global.game_combat_state = CombatState.Idle;
				global.game_combat_state_time_real = 0;
				
				scr_checkpoint_reset();
				scr_player_upgrade_update();
				
				if (i != Level.Prologue){
					level_opening = true;
					level_opening_active = true;
					level_opening_time = 60 * 4.65;
				}
				
				if (!global.game_boss_firstantag_killed){
					if (!global.game_is_playthrough){
						if (global.level_current >= Level.EasternFarmland) && (global.level_current < Level.TrainStation)
						&& (room != rm_level_2_pre_00) && (room != rm_level_2_00) && (room != rm_level_2_01) && (room != rm_level_2_02){
							scr_companion_register(obj_companion_0);
							global.game_companion_farmer_found = true;
						}
					}
				}else{
					scr_companion_remove(obj_companion_0);
				}
				
				global.level_entered[i] = true;
				break;
			}
		}else if (room == global.level_preroom[i]){
			if (!global.level_entered[i]){
				scr_save_game();
			}
		}
	}
	
	if (global.game_boss_firstantag_killed){
		scr_companion_remove(obj_companion_0);
	}
}

screen_fade_opening = 1.15;

ending = false;
ending_close = false;
ending_logo_text_time = 60 * 6;
ending_logo_text_alpha = 0;
ending_credits_text_alpha = 0;
ending_back_time = 60 * 3;
ending_back_alpha = 0;

area_next_fade = false;
area_next_alpha = 0;
area_next_alpha_speed = 0.02;
area_next_room = noone;

var weaponalength = array_length_1d(global.weapon_slot);

for(var i = 0; i < weaponalength; i ++){
	weaponslot_shake[i] = 0;
    weaponslot_weaponscale[i] = 0;
	weaponslot_ammoscale[i] = 1;
}

weapon_standalone_ammox = -100;
weapon_standalone_ammoy = -100;
weapon_standalone_ammoscale = 1;

blackbar_draw = false;
blackbar_sizereal = 0;
blackbar_size = 185;

screenblend_draw = false;
screenblend_alpha = 0;
screenblend_colour = c_white;
screenblend_speed = 0.1;
screenblend_endalpha = 0.6;

control_indicate = false;
control_indicate_text = "";
control_indicate_x = 0;

bosshealth_value_current = 0;
bosshealth_value_previous = 0;
bosshealth_value_max = 0;
bosshealth_width_to = 0;
bosshealth_width_current = 0;
bosshealth_flash = 0;

pausedialogue = false;
pausedialogue_alpha = 0;
pausedialogue_type = 1;
pausedialogue_time = 0;
pausedialogue_break = 0;
pausedialogue_option_exitscale = 1;
pausedialogue_option_selected = iskeyboard ? -1 : 0;
pausedialogue_option_selected_previous = pausedialogue_option_selected;
pausedialogue_option_selected_held_time = 0;
pausedialogue_option_selected_held_time_max = 40;
pausedialogue_option_select_break = 0;
pausedialogue_option_max = 0;
pausedialogue_type_text = "I haven't been given dialogue yet!";
pausedialogue_option_exittext = "Resume";
pausedialogue_type_option[0] = -1;
pausedialogue_type_option_scale[0] = 1;
pausedialogue_type_option_special[0] = -1;
pausedialogue_type_option_cutscene[0] = -1;

minimap_x = 30;
minimap_y = 30;
minimap_width = 220;
minimap_height = 124;
minimap_arrow_sine = 0;
minimap_arrow_sine_speed = 5;

sprite_index = noone;
depth = -4;

start_run = true;