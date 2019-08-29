if (!instance_exists(obj_player)){
    instance_create(640, 480, obj_player);
}

global.player_footstep_default = snd_character_footstep_grass;

while(!instance_exists(obj_controller_mouse)){
    instance_create(scr_input_get_mouse_x(), scr_input_get_mouse_y(), obj_controller_mouse);
}

instance_activate_all();