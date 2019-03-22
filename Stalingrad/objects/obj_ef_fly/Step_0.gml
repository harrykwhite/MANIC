if (global.game_pause){
	image_speed = 0;
	if (audio_is_playing(buzz)){
		audio_stop_sound(buzz);
		buzz = noone;
	}
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

if (instance_exists(obj_player)){
	if (distance_to_object(obj_player) < 60){
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
}

while(point_distance(x, y, xoffset + xbase, yoffset + ybase) < 5){
	xoffset = random_range(-xrange, xrange);
	yoffset = random_range(-yrange, yrange);
	fdir = point_direction(x, y, xoffset + xbase, yoffset + ybase);
}

xoffsetcur += lengthdir_x(0.75, fdir);
yoffsetcur += lengthdir_y(0.75, fdir);

x = xoffsetcur + xbase;
y = yoffsetcur + ybase;