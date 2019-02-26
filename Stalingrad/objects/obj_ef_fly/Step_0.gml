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

if (instance_exists(global.player)) && (!global.game_pause){
	if (distance_to_object(global.player) < 60){
		if (buzz == noone){
			buzz = scr_sound_play(snd_other_fly_0, true, 1, 1);
		}
		scr_sound_set_distance(buzz, 60);
	}else{
		if (audio_is_playing(buzz)){
			audio_stop_sound(buzz);
			buzz = noone;
		}
	}
}else{
	if (audio_is_playing(buzz)){
		audio_stop_sound(buzz);
		buzz = noone;
	}
}

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