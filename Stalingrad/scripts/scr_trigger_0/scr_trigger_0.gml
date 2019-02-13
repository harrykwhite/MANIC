scr_enemy_reset();
scr_corpse_remove();
scr_respawn_load();
scr_effect_flash(1, 0.05, c_black);

if (instance_exists(obj_controller_ui)){
	obj_controller_ui.blackbar_draw = false;
}