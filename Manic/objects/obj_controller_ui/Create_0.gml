// Setup
global.level_current = scr_level_get_index(room);

if (global.game_is_playthrough){
	global.game_save_level = global.level_current;
}

playerhit_alpha = 0;
playerhit_colour = c_maroon;

vignette_flash_alpha = 0;
vignette_flash_alpha_speed = 0;
vignette_flash_colour = c_white;

objective_scale = 1;

stats_y = 0;

weaponinfo = false;
weaponinfo_index = 0;
weaponinfo_index_prev = 0;
weaponinfo_ammo = -1;
weaponinfo_quantity = -1;
weaponinfo_yoff = 0;
weaponinfo_yoff_max = 30;

weaponammo_scale = 1;
weaponammo_scaleTo = 1;
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
	Pickup,
	Shoot,
	Throw,
	PickupMelee,
	Switch,
	CollectAmmo,
	Dash,
}

tutourial = false;
tutourial_scale = 1;
tutourial_alpha = 1;
tutourial_fade = false;
tutourial_stage = 0;
tutourial_stage_timer = -1;
tutourial_stage_pickupmelee_cseen = false;
tutourial_stage_pickupmelee_equipped = false;
tutourial_stage_ammocollected_done = false;

if (global.game_input_type == InputType.Keyboard){
	tutourial_text[TutourialStage.Movement] = "Use the [" + scr_input_get_name(InputBinding.Up, false) + scr_input_get_name(InputBinding.Left, false) + scr_input_get_name(InputBinding.Down, false) + scr_input_get_name(InputBinding.Right, false) + "] keys to move";
	tutourial_text[TutourialStage.Pickup] = "Pick up the rifle in the shed with " + scr_input_get_name(InputBinding.Interact);
	tutourial_text[TutourialStage.Shoot] = "Shoot by pressing " + scr_input_get_name(InputBinding.Attack);
	tutourial_text[TutourialStage.Throw] = "Throw your weapon by pressing " + scr_input_get_name(InputBinding.Throw);
	tutourial_text[TutourialStage.Switch] = "Switch between weapons by using the " + scr_input_get_name(InputBinding.SwitchWeaponForward) + " or the number keys";
	tutourial_text[TutourialStage.Dash] = "Dash by pressing " + scr_input_get_name(InputBinding.Dash);
}else{
	tutourial_text[TutourialStage.Movement] = "Move with " + scr_input_get_name(InputBinding.Up);
	tutourial_text[TutourialStage.Pickup] = "Pick up the rifle in the shed with " + scr_input_get_name(InputBinding.Interact);
	tutourial_text[TutourialStage.Shoot] = "Shoot by pressing " + scr_input_get_name(InputBinding.Attack);
	tutourial_text[TutourialStage.Throw] = "Throw your weapon by pressing " + scr_input_get_name(InputBinding.Throw);
	tutourial_text[TutourialStage.Switch] = "Switch between weapons by pressing " + scr_input_get_name(InputBinding.SwitchWeaponForward);
	tutourial_text[TutourialStage.Dash] = "Dash by pressing " + scr_input_get_name(InputBinding.Dash);
}

tutourial_text[TutourialStage.PickupMelee] = "Pick up the melee weapon by the crates";
tutourial_text[TutourialStage.CollectAmmo] = "Break open the crates to retrieve ammo";

if (global.level_current == Level.Prologue){
	tutourial = true;
}

ui_alpha = 1;

redtint_alpha = 0;
redtint_alphato = 0;
redtint_flash = 0;

pause_text_update = false;
pause_text_alpha = 0;
pause_selected = -1;
pause_selected_break = 0;
pause_selected_held_time = 0;
pause_selected_held_time_max = 40;
pause_has_selected = false;
pause_has_selected_index = -1;
pause_has_selected_time = 0;
pause_selectoption[0] = "Resume";
pause_selectoption_scale[0] = 1;
//pause_selectoption[1] = "Restart Level";
//pause_selectoption_scale[1] = 1;
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
//checkpoint_text_line_width = 0;

level_opening = false;
level_opening_line_width = 0;
level_opening_text_alpha = 0;
level_opening_alpha = 1;
level_opening_time = 0;
level_opening_active = false;

var levelcount = array_length_1d(global.level_name);

if (room == rm_prologue_00){
	global.level_entered[0] = false;
}

for(var i = 0; i < levelcount; i ++){
	if (room == global.level_room[i]){
		if (!global.level_entered[i]){
			var upgradecount = array_length_1d(global.upgrade_name);
			
			if (!global.game_is_playthrough) || (room == rm_prologue_00){
				scr_companions_clear();
				scr_player_upgrades_clear();
				scr_set_kills_and_findings();
			}else{
				for(var u = 0; u < upgradecount; u ++){
					if (global.game_save_upgrade_unlocked[u]){
						scr_upgrade_add(u);
					}
				}
			}
			
			global.game_combat_state = CombatState.Idle;
			global.game_combat_state_time_real = 0;
			
			if (!global.level_complete[i]){
				global.game_objective_set = false;
			}else{
				global.game_objective_set = true;
				global.game_objective_complete = true;
			}
			
			scr_checkpoint_reset();
			scr_player_upgrade_update();
			
			if (global.level_current != Level.Prologue){
				level_opening = true;
				level_opening_active = true;
				level_opening_time = 60 * 4.65;
			}
			
			global.level_entered[i] = true;
			break;
		}
	}
}

if (!global.game_boss_firstantag_killed){
	if (room == rm_level_6_pre_00){
		scr_companion_register(obj_companion_0);
	}
	
	if (global.level_current >= Level.WesternFarmland) && (global.level_current < Level.TrainStation)
	&& (room != rm_level_2_pre_00) && (room != rm_level_2_00) && (room != rm_level_2_01) && (room != rm_level_2_02){
		scr_companion_register(obj_companion_0);
		global.game_companion_farmer_found = true;
	}
}else{
	scr_companion_remove(obj_companion_0);
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

score_current = global.game_score;
score_scale = 1;
score_shake = 0;
score_text = "";
score_text_offset = 0;
score_text_time = 0;
score_text_alpha = 0;

leveltext_alpha = 0;
leveltext_text = "";
leveltext_time = 0;

var levels = array_length_1d(global.level_name);
for(var i = 1; i < levels; i ++){
	if (room == global.level_room[i]){
		leveltext_time = 60 * 3.5;
	}
}

var weaponalength = array_length_1d(global.weapon_slot);

for (var i = 0; i < weaponalength; i ++){
	weaponslot_shake[i] = 0;
    weaponslot_weaponscale[i] = 0;
}

blackbar_draw = false;
blackbar_sizereal = 0;
blackbar_size = 185;

screenblend_draw = false;
screenblend_alpha = 0;
screenblend_colour = c_white;
screenblend_speed = 0.1;
screenblend_endalpha = 0.6;

rank_display_draw = false;
rank_display_alpha = 0;

control_indicate = false;
control_indicate_text = "";
control_indicate_x = 0;

bosshealth_value_current = 0;
bosshealth_value_previous = 0;
bosshealth_value_max = 0;
bosshealth_width_to = 0;
bosshealth_width_current = 0;
bosshealth_flash = 3;

pausedialogue = false;
pausedialogue_alpha = 0;
pausedialogue_type = 1;
pausedialogue_time = 0;
pausedialogue_break = 0;
pausedialogue_option_exitscale = 1;
pausedialogue_option_selected = -1;
pausedialogue_option_selected_held_time = 0;
pausedialogue_option_selected_held_time_max = 40;
pausedialogue_option_max = 0;
pausedialogue_type_text = "I haven't been given dialogue yet!";
pausedialogue_type_option[0] = -1;
pausedialogue_type_option_scale[0] = 1;
pausedialogue_type_option_special[0] = -1;
pausedialogue_type_option_cutscene[0] = -1;
pausedialogue_type_option_traingoto[0] = -1;
pausedialogue_type_option_trainroom[0] = -1;
pausedialogue_type_option_trainstart_type[0] = -1;

minimap_x = 30;
minimap_y = 30;
minimap_width = 220;
minimap_height = 220;
minimap_arrow_sine = 0;
minimap_arrow_sine_speed = 5;

sprite_index = noone;
depth = -4;