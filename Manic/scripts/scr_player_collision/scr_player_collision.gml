// Player Collision
if (hspd == 0) && (vspd == 0){
	return;
}

var a_hspd = abs(hspd);
var a_vspd = abs(vspd);
var s_hspd = sign(hspd);
var s_vspd = sign(vspd);

if (place_meeting(x + hspd + s_hspd, y, obj_p_solid)){
	if (s_hspd >= 0) move_contact_object(360, a_hspd, obj_p_solid, true);
	if (s_hspd < 0) move_contact_object(180, a_hspd, obj_p_solid, true);
	hspd = 0;
}

if (place_meeting(x, y + vspd + s_vspd, obj_p_solid)){
	if (s_vspd >= 0) move_contact_object(270, a_vspd, obj_p_solid, true);
	if (s_vspd < 0) move_contact_object(90, a_vspd, obj_p_solid, true);
	vspd = 0;
}

if (place_meeting(x + hspd, y + vspd, obj_p_solid)){
	hspd = 0;
}