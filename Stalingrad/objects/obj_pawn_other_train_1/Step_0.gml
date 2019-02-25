if (global.game_pause){
	image_speed = 0;
	exit;
}

if (open){
	switch(type){
		case 0:
			sprite_index = spr_train_0_part_0_door_open;
			break;
		
		case 1:
			sprite_index = spr_train_1_part_0_door_open;
			break;
	}
	
	if (open_pause){
		if (open_time < 50){
			if (global.cutscene_current == 22) || (global.cutscene_current == 47) || (global.cutscene_current == 51){
				open_time ++;
			}
			
			image_index = image_number - 1;
			image_speed = 0;
		}else{
			open_time = 0;
			open = false;
			open_pause = false;
			close = true;
			switch(type){
				case 0:
					sprite_index = spr_train_0_part_0_door_close;
					break;
		
				case 1:
					sprite_index = spr_train_1_part_0_door_close;
					break;
			}
			image_index = 0;
			image_speed = 0;
		}
	}else{
		image_speed = 1;
	}
}else if (close){
	switch(type){
		case 0:
			sprite_index = spr_train_0_part_0_door_close;
			break;
		
		case 1:
			sprite_index = spr_train_1_part_0_door_close;
			break;
	}
	image_speed = 1;
}else{
	if (mainsprite != noone){
		sprite_index = mainsprite;
	}
	
	image_speed = 0.1 * (spd / 4);
	if (spd <= 0){
		image_index = 0;
	}
}

x += spd * dir;

if (spd > 0) || (leave){
	if (leave){
		spd += 0.0075 * 1.35;
	}else{
		spd -= 0.0075;
	}
}

spd = max(spd, 0);

if (dir == 1){
	image_xscale = 1;
}else{
	image_xscale = -1;
}

// Light
/*if (count != 0) && (count != 5){
	if (mylight == noone){
		mylight = instance_create(x, y - 4, obj_pawn_other_train_light);
	}else{
		mylight.x = x;
		mylight.y = y - 4;
		mylight.light[| eLight.X] = x;
		mylight.light[| eLight.Y] = y - 4;
		mylight.light[| eLight.LutIntensity] = 1.05;
		mylight.light[| eLight.Flags] |= eLightFlags.Dirty;
	}
}*/