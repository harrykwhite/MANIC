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

if (render_time > 0){
	render_time --;
}else{
	render = onscreen(x, y, -32);
	render_time = render_time_max;
}

if (render){
	scr_render_me(y - 39 + offset, true);
}