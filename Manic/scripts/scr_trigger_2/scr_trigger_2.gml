var people, peoplecount;

people[0] = obj_townperson_0;
people[1] = obj_townperson_1;
people[2] = obj_townperson_3;
people[3] = obj_townperson_4;
people[4] = obj_townperson_5;
people[5] = obj_townchild_0;

peoplecount = array_length_1d(people);

for(var p = 0; p < peoplecount; p ++){
	var person = people[p];
	
	if (instance_exists(person)){
		if (point_distance(obj_player.x, obj_player.y, person.x, person.y) < 140){
			instance_destroy(person);
		}
	}
}

scr_effect_flash(1, 0.025, c_black);

global.cutscene_current = -1;