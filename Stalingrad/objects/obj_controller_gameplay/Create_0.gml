deactivate_time = 0;

ds_enemylist = 0;

combat_mprevious = 0;
combat_mnew = 0;

pause_time = 0;
corpse_active_time = 30;

bonus_killtime = 0;
bonus_killamount = 0;

levelstart_record_set = false;
sectionstart_record_set = false;

cutscene_conveyerbelt_x = 0;
cutscene_conveyerbelt_y = 0;
cutscene_trainopening_inst = noone;

weaponlist = ds_list_create();
weaponlist[| 0] = global.weapon_slot[global.weapon_slotcurrent];
weaponlist[| 1] = 4;
weaponlist[| 2] = -1;

scr_level_current_control();
sprite_index = noone;