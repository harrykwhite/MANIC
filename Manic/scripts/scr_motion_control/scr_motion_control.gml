///@param contact
///@param contactlist
var contact = false;
var contactlist = 0;

if (spd == 0){
	return;
}

if (argument_count > 0){
	contact = argument[0];
	
	for(var i = argument_count - 1; i > 0; i--){
		contactlist[i] = argument[i];
	}
}

if (contact){
	var length = array_length_1d(contactlist);
	
	for(var i = 0; i < length; i ++){
		move_contact_object(dir, spd, contactlist[i]);
	}
}else{
	x += lengthdir_x(spd, dir);
	y += lengthdir_y(spd, dir);
}