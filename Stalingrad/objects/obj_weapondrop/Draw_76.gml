if (sprite == -1){
	sprite = global.weapon_sprite[index];
	
	if (index == PlayerWeapon.Grenade) && (quantity > 1){
		sprite = spr_weapon_9_pack;
	}
	
	if (index == PlayerWeapon.ToxicGrenade) && (quantity > 1){
		sprite = spr_weapon_22_pack;
	}
	
	if (index == PlayerWeapon.LandMine) && (quantity > 1){
		sprite = spr_weapon_18_pack;
	}
}

scr_depth_controller(y - (50 + offset), scr_draw_attributes_weapon_drop, -1);