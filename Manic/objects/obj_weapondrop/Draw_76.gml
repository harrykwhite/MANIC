if (sprite == -1){
	sprite = global.weapon_centersprite[index];
	
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

scr_render_me(y - (29 + offset));