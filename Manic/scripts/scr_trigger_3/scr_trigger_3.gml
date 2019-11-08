ds_grid_clear(global.player_companions, -1);
scr_fade_object_list_reset();
scr_level_persistent_reset_level(global.level_current);
scr_global_set();
audio_stop_all();
room_goto(rm_title_0);

obj_controller_gameplay.has_saved = true;