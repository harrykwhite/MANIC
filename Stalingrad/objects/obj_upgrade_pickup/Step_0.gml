// Pickup
if (instance_exists(obj_player)){
    if (pickup){
        instance_destroy();
		
		scr_sound_play(snd_weapon_pickup_2, false, 0.8, 1.2);
		scr_player_stamina_drain(6);
		scr_effect_screenshake(1);
		scr_upgrade_add(index);
		
		obj_controller_ui.upgrade_indicate_index = index;
		obj_controller_ui.upgrade_indicate_time = 60 * 10;
    }
}