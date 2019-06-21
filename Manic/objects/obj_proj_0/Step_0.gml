if (global.game_pause){
	image_speed = 0;
	return;
}

damage += damage_change;
damage = max(damage, 1);

x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);