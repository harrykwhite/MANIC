var level = scr_level_get_index(room);
var _score = 0;

switch(object_index){
	case obj_enemy_0:
		_score = 100;
		
		switch(type){
			case Enemy0_Type.Healer:
				_score = 125;
				break;
			
			case Enemy0_Type.Grenadier:
			case Enemy0_Type.Crazy:
				_score = 150;
				break;
			
			case Enemy0_Type.Fly:
				_score = 175;
				break;
			
			case Enemy0_Type.Mother:
			case Enemy0_Type.Sniper:
				_score = 200;
				break;
		}
		break;
	
	case obj_enemy_2:
		_score = 75;
		break;
	
	case obj_enemy_3:
		_score = 175;
		break;
	
	case obj_enemy_4:
		_score = 125;
		break;
}

if (_score != 0){
	global.level_score[level] += _score;
	
	obj_controller_ui.arena_score_scale = 1.35;
	
	var pts = instance_create(x, y - 2, obj_score);
	pts._score = _score;
}