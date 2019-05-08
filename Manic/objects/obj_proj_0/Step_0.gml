if (global.game_pause){
	image_speed = 0;
	return;
}

if (place_meeting(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), obj_p_solid)){
	instance_destroy();
}

damage += damage_change;
damage = max(damage, 1);
x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);