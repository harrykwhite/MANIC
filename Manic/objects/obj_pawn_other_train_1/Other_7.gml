if (close) && ((sprite_index == spr_train_0_part_0_door_close) || (sprite_index == spr_train_1_part_0_door_close)){
	image_speed = 0;
	image_index = 0;
	close = false;
}

if (open) && (!open_pause) && ((sprite_index == spr_train_0_part_0_door_open) || (sprite_index == spr_train_1_part_0_door_open)){
	image_speed = 0;
	image_index = image_number - 1;
	open_pause = true;
}