var wcurrent = -1;

if (!instance_exists(owner)){
	exit;
}

if (instance_exists(owner.weapon)){
	wcurrent = global.pawnweapon_playerindex[owner.weapon.index];
}

image_alpha = 1;
image_xscale = owner.scale;

if (wcurrent != -1){
	if (global.game_pause){
		image_alpha = 1;
		exit;
	}
	
	// Weapon Position -------------------------------------------------------------------------------------------------
	var dir = owner.weapon.dir;
	var outlength = 0;
	image_index = 0;
	
	if (global.weapon_type[wcurrent] != WeaponType.Melee){
		outlength = 2;
		
		if (global.weapon_heavy[wcurrent]){
			image_index = 2;
			outlength = 1;
		}
		
	}else{
		outlength = 1;
	}
	
	if (global.weapon_dualhanded[wcurrent]){
		image_index = 1;
		outlength = 2;
	}
	
	if (owner.image_xscale == owner.scale){
		x = (owner.x - 3) + lengthdir_x(outlength, image_angle);
		y = ((owner.y - 5) + yoffset) + lengthdir_y(outlength, image_angle);

		image_yscale = owner.scale;
	}else{
		x = (owner.x + 3) + lengthdir_x(outlength, image_angle);
		y = ((owner.y - 5) + yoffset) + lengthdir_y(outlength, image_angle);
	
		image_yscale = -owner.scale;
	}
	
	image_angle = dir;
	
}else{
	image_alpha = 0;
}