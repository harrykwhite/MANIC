// Player Collision
if (hspd == 0) && (vspd == 0){
	return;
}

var a_hspd = abs(hspd);
var a_vspd = abs(vspd);
var s_hspd = sign(hspd);
var s_vspd = sign(vspd);

for(var i = 1; i < a_hspd + 1; i ++){
	if (place_meeting(x + (s_hspd * i), y, obj_p_solid)){
		if (s_hspd >= 0) move_contact_object(360, i, obj_p_solid, true);
		if (s_hspd < 0) move_contact_object(180, i, obj_p_solid, true);
		hspd = 0;
		break;
	}
}

for(var i = 1; i < a_vspd + 1; i ++){
	if (place_meeting(x, y + (s_vspd * i), obj_p_solid)){
		if (s_vspd >= 0) move_contact_object(270, i, obj_p_solid, true);
		if (s_vspd < 0) move_contact_object(90, i, obj_p_solid, true);
		vspd = 0;
		break;
	}
}

if (place_meeting(x + hspd, y + vspd, obj_p_solid)){
	hspd = 0;
}