if (!instance_exists(obj_player)){
    instance_create(0, 0, obj_player);
}

global.player_footstep_default = snd_character_footstep_grass;

while(!instance_exists(obj_controller_mouse)){
    instance_create(mouse_x, mouse_y, obj_controller_mouse);
}

instance_activate_all();