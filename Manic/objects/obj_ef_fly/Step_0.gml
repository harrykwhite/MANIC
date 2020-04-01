if (global.game_pause){
	image_speed = 0;
	
	if (audio_is_playing(buzz)){
		audio_stop_sound(buzz);
		buzz = noone;
	}
	return;
}else{
	image_speed = 0.2;
}

if (fobject != noone){
	if (!instance_exists(fobject)){
		instance_destroy();
		return;
	}
	
	xbase = fobject.x;
	ybase = fobject.y;
}

if (fscale < 1){
	fscale += 0.01;
}

var bfade = true;
var bdist = 40;

if (instance_exists(obj_player)) && (global.cutscene_current == -1){
	if (distance_to_object(obj_player) <= bdist){
		if (buzz == noone){
			buzz = scr_sound_play(snd_other_fly_0, true, 1, 1);
		}
		
		scr_sound_set_distance(buzz, bdist);
		bfade = false;
	}
}

if (bfade) && (buzz != noone){
	audio_sound_gain(buzz, 0, 2000);
	
	if (audio_sound_get_gain(buzz) <= 0){
		audio_stop_sound(buzz);
		buzz = noone;
	}
}

while(point_distance(x, y, xoffset + xbase, yoffset + ybase) < 10){
	xoffset = random_range(-xrange, xrange);
	yoffset = random_range(-yrange, yrange);
}

fdir = point_direction(x, y, xoffset + xbase, yoffset + ybase);

xoffsetcur += lengthdir_x(0.75, fdir);
yoffsetcur += lengthdir_y(0.75, fdir);

x = xoffsetcur + xbase;
y = yoffsetcur + ybase;