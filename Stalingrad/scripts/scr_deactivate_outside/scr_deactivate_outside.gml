var wrange = 120;
var hrange = 120;

instance_activate_region(camera_get_view_x(view_camera[0]) - wrange, camera_get_view_y(view_camera[0]) - hrange, camera_get_view_width(view_camera[0]) + (2 * wrange), camera_get_view_height(view_camera[0]) + (2 * hrange), true);
instance_deactivate_region(camera_get_view_x(view_camera[0]) - wrange, camera_get_view_y(view_camera[0]) - hrange, camera_get_view_width(view_camera[0]) + (2 * wrange), camera_get_view_height(view_camera[0]) + (2 * hrange), false, true);
instance_activate_object(obj_controller_camera);
instance_activate_object(obj_light);
instance_activate_object(obj_light_renderer);
instance_activate_object(obj_lighting_init);
instance_activate_object(obj_controller_ui);
instance_activate_object(scr_get_level_object());
instance_activate_object(obj_controller_all);
instance_activate_object(obj_ef_freeze);
instance_activate_object(obj_ef_flash);
instance_activate_object(obj_controller_mouse);
instance_activate_object(obj_interior_fade);
instance_activate_object(global.player);
instance_activate_object(obj_player_arm);
instance_activate_object(obj_block_persistent);
instance_activate_object(obj_artifact_pickup);
instance_activate_object(obj_block_particle);
instance_activate_object(obj_enemy_0_light);
instance_activate_object(obj_pawn_other_train_0);
instance_activate_object(obj_pawn_other_train_1);

if (corpse_active_time > 0){
	instance_activate_object(obj_environment_corpse);
}

if (room == rm_level_5_00) || (room == rm_level_5_02) || (room == rm_level_5_03) || (room == rm_level_5_04){
	instance_activate_object(obj_pawn_other_prisoner_0);
	instance_activate_object(obj_weapon_17_stand);
}

if (room == rm_level_6_00){
	var levelobject = scr_get_level_object();
	var arm;
	
	if (instance_exists(levelobject.objective_special_boss_object)){
		instance_activate_object(levelobject.objective_special_boss_object);
	}
}

if (global.weapon_slot[global.weapon_slotcurrent] != -1) && (global.weapon_slot_standalone == -1){
	instance_activate_object(global.weapon_object[global.weapon_slot[global.weapon_slotcurrent]]);
}else if (global.weapon_slot_standalone != -1) && (global.weapon_slot[global.weapon_slotcurrent] != -1){
	instance_activate_object(global.weapon_object[global.weapon_slot_standalone]);
}else{
	instance_activate_object(global.weapon_object[4]);
}