scr_save_game();

if (ds_exists(corpse_queue, ds_type_list)){
	ds_list_destroy(corpse_queue);
}