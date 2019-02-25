if (global.game_pause){
	image_speed = 0;
	exit;
}else{
	image_speed = 0.2;
}

if (fobject != noone){
	xbase = fobject.x;
	ybase = f.object.y;
}

if (fscale < 1){
	fscale += 0.01;
}

if (buzz == noone){
	buzz = scr_sound_play(snd_other_fly_0, true, 1, 1);
}
scr_sound_set_distance(buzz, 40);

while(point_distance(x, y, xoffset + xbase, yoffset + ybase) < 5){
	xoffset = random_range(-xrange, xrange);
	yoffset = random_range(-yrange, yrange);
}

fdir = point_direction(x, y, xoffset + xbase, yoffset + ybase);

xoffsetcur += lengthdir_x(0.75, fdir);
yoffsetcur += lengthdir_y(0.75, fdir);

x = xoffsetcur + xbase;
y = yoffsetcur + ybase;

image_xscale = fscale;
image_yscale = fscale;