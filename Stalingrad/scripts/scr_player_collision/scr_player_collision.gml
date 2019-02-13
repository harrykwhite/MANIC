// Player Collision
if (hspd == 0) && (vspd == 0){
	exit;
}

for(var i = 0; i < abs(hspd) + 1; i++){
	if (place_meeting(x + (sign(hspd) * i), y, obj_p_solid)){
		if (sign(hspd) >= 0) move_contact_object(360, i, obj_p_solid, true);
		if (sign(hspd) < 0) move_contact_object(180, i, obj_p_solid, true);
		hspd = 0;
	}
}

for(var i = 0; i < abs(vspd) + 1; i++){
	if (place_meeting(x, y + (sign(vspd) * i), obj_p_solid)){
		if (sign(vspd) >= 0) move_contact_object(270, i, obj_p_solid, true);
		if (sign(vspd) < 0) move_contact_object(90, i, obj_p_solid, true);
		vspd = 0;
	}
}

if (place_meeting(x + hspd, y + vspd, obj_p_solid)){
	hspd = 0;
}