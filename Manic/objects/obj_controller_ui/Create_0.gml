// Setup
var weaponalength = array_length_1d(global.weapon_slot);

playerhit_alpha = 0;
playerhit_colour = c_maroon;

vignette_flash_alpha = 0;
vignette_flash_alpha_speed = 0;
vignette_flash_colour = c_white;

levelcleared_alpha = 0;
levelcleared_time = 0;

stats_y = 0;

weaponammo_scale = 1;
weaponammo_scaleTo = 1;
weaponammo_x = 0;

tutourial = false;
tutourial_scale = 1;
tutourial_stage = 0;
tutourial_stage_timer = -1;
tutourial_text[0] = "Use the [" + scr_keycheck_string(global.game_option[| Options.Input_MoveUp]) + scr_keycheck_string(global.game_option[| Options.Input_MoveLeft]) + scr_keycheck_string(global.game_option[| Options.Input_MoveDown]) + scr_keycheck_string(global.game_option[| Options.Input_MoveRight]) + "] keys to move";
tutourial_text[1] = "Pick up the rifle in the shed with [" + scr_keycheck_string(global.game_option[| Options.Input_Interact]) + "]";
tutourial_text[2] = "Shoot with [" + scr_mousecheck_string(global.game_option[| Options.Input_Attack]) + "]";
tutourial_text[3] = "Throw your weapon at enemies by pressing [" + scr_mousecheck_string(global.game_option[| Options.Input_Throw]) + "]";
tutourial_text[4] = "Dash by pressing [" + scr_keycheck_string(global.game_option[| Options.Input_Dash]) + "]";

if (global.level_current == Level.Prologue){
	tutourial = true;
}

ui_alpha = 1;

redtint_alpha = 0;
redtint_alphato = 0;

pause_text_update = false;
pause_text_alpha = 0;
pause_selected = -1;
pause_has_selected = false;
pause_has_selected_index = -1;
pause_has_selected_time = 0;
pause_selectoption[0] = "Resume";
pause_selectoption_scale[0] = 1;
pause_selectoption[1] = "Restart Section";
pause_selectoption_scale[1] = 1;
pause_selectoption[2] = "Exit to Titlescreen";
pause_selectoption_scale[2] = 1;
pause_selectoption[3] = "Exit to Desktop";
pause_selectoption_scale[3] = 1;
pause_selectedmax = array_length_1d(pause_selectoption);

game_opening_intro = true;
game_opening_intro_speed = 1.1;
game_opening_intro_alpha = 4.7;
game_opening_intro_text_alpha = -0.25;
game_opening_intro_text_stage = 0;
game_opening_intro_text_time = 60 * 4;

if (global.level_current != Level.Prologue){
	game_opening_intro = false;
}

upgrade_indicate_index = 0;
upgrade_indicate_time = 0;
upgrade_indicate_alpha = 0;

level_opening = false;
level_opening_text_alpha = 0;
level_opening_alpha = 1;
level_opening_time = 0;
level_opening_active = false;

var levelcount = array_length_1d(global.level_name);
for(var i = 0; i < levelcount; i ++){
	if (room == global.level_room[i]){
		if (!global.level_entered[i]){
			if (!global.game_is_playthrough){
				scr_set_kills_and_findings();
			}
			
			global.game_combat_state = CombatState.Idle;
			global.game_combat_state_time_real = 0;
			
			if (global.level_current != Level.Prologue){
				level_opening = true;
				level_opening_active = true;
				level_opening_time = 60 * 4;
			}
			
			global.level_entered[i] = true;
			break;
		}
	}
}

screen_fade_opening = 1.15;

ending = false;
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

weaponslot_shake = 0;
for (var i = 0; i < weaponalength; i ++){
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
bosshealth_width_to = 500;
bosshealth_width_current = 0;
bosshealth_flash = 3;

pausedialogue = false;
pausedialogue_alpha = 0;
pausedialogue_type = 1;
pausedialogue_time = 0;
pausedialogue_option_exitscale = 1;
pausedialogue_option_selected = -1;
pausedialogue_option_max = 0;
pausedialogue_type_text = "I haven't been given dialogue yet!";
pausedialogue_type_option[0] = -1;
pausedialogue_type_option_scale[0] = 1;
pausedialogue_type_option_special[0] = -1;
pausedialogue_type_option_cutscene[0] = -1;
pausedialogue_type_option_traingoto[0] = -1;
pausedialogue_type_option_trainroom[0] = -1;
pausedialogue_type_option_trainstart_type[0] = -1;

sprite_index = noone;
depth = -4;