if (!instance_exists(obj_player)){
    instance_create(502, 1096, obj_player);
}

global.player_footstep_default = snd_character_footstep_wood;

scr_room_spawn_companion();

while(!instance_exists(obj_controller_mouse)){
    instance_create(mouse_x, mouse_y, obj_controller_mouse);
}

instance_activate_all();