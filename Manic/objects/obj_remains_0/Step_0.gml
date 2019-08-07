if (global.game_pause){
	image_speed = 0;
	exit;
}else{
	image_speed = 1;
}

mylight.x = x;
mylight.y = y;
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y;
mylight.light[| eLight.LutIntensity] = 1.55;
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;

if (random(6) < 1){
	part_particles_create(global.ps_front, x + random_range(-6, 6), y - 8, global.pt_smoke_3, 1);
}