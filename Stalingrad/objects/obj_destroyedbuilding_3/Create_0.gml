fadeOwner = noone;
depth_offset = 0;

declist = ds_list_create();
decnum = collision_rectangle_list(x, y, x + sprite_width, y + sprite_height, obj_p_decorative, false, true, declist, false);