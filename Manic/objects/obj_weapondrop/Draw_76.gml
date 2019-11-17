if (sprite == -1){
	sprite = global.weapon_centersprite[index];
	
	if (quantity > 1){
		if (index == PlayerWeapon.Grenade){
			sprite = spr_weapon_9_pack;
		}
	
		if (index == PlayerWeapon.ToxicGrenade){
			sprite = spr_weapon_22_pack;
		}
	
		if (index == PlayerWeapon.LandMine){
			sprite = spr_weapon_18_pack;
		}
	
		if (index == PlayerWeapon.ReinforcedGrenade){
			sprite = spr_weapon_37_pack;
		}
	}
}

scr_render_me(y - (40 + offset));