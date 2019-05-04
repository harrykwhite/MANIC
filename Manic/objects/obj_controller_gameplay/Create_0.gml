deactivate_time = 0;
counter = 0;

pause_time = 0;
corpse_active_time = 30;

levelclear_called = false;

has_saved = false;

bonus_killtime = 0;
bonus_killamount = 0;

sectionstart_record_set = false;

corpse_queue = ds_queue_create();
cutscene_look_x = 0;
cutscene_look_y = 0;
cutscene_look_time = 120;
cutscene_look_object = noone;
cutscene_look_prop = false;
cutscene_look_boss = -1;
cutscene_conveyerbelt_x = 0;
cutscene_conveyerbelt_y = 0;
cutscene_trainopening_inst = noone;
cutscene_traingoto = Level.RavagedTown;
cutscene_trainroom = -1;
cutscene_trainstart_type = -1;
cutscene_moveto_room = noone;
cutscene_moveto_level = Level.RavagedTown;
cutscene_moveto_dir = 0;
cutscene_moveto_type = 0;
cutscene_ending_stage = 0;
cutscene_ending_corpse = noone;
cutscene_prologue_opening_camspeed = 0;

weaponlist = ds_list_create();
weaponlist[| 0] = global.weapon_slot[global.weapon_slotcurrent];
weaponlist[| 1] = 4;
weaponlist[| 2] = -1;

global.player_is_respawning = false;

scr_level_current_control();

sprite_index = noone;