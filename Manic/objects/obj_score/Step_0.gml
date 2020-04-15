if (global.game_pause){
	return;
}

if (life > 0){
	if (scale < 1){
		scale += scalespeed;
	}
	
	life --;
}else{
	if (scale > 0){
		scale -= scalespeed;
	}else{
		instance_destroy();
	}
}

if (scorecurrent < _score){
	scorecurrent += min(scorespeed, _score - scorecurrent);
}else if (scorecurrent > _score){
	scorecurrent -= min(scorespeed, scorecurrent - _score);
}

vspd *= 0.9;

x += hspd;
y += vspd;