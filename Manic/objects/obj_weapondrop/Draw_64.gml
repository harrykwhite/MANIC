/*var drawbox_x = scr_world_to_screen_x(x + 10);
var drawbox_y = scr_world_to_screen_y(y + infodraw_yoff);
var drawbox_width = 260;
var drawbox_height = 80;

if (infodraw_yoff > 0.02){
	var txt = global.weapon_name[index] + "\n";
	
	txt += "Damage: " + scr_weapon_get_level_string(global.weapon_damage[index]) + "\n";
	txt += "Speed: " + scr_weapon_get_level_string(global.weapon_speed[index]);
	
	if (global.weapon_type[index] == WeaponType.Ranged){
		txt += "\nAmmo: " + string(ammo) + "/" + string(global.weapon_ammomax[index]);
	}else if (global.weapon_type[index] == WeaponType.Throwing){
		txt += "\nQuantity: x" + string(quantity);
	}
	
	var txth = string_height(txt);
	drawbox_height = txth + 20;
	
	draw_set_colour(c_black);
	draw_set_alpha(0.7 * (infodraw_yoff / infodraw_yoff_max));
	draw_rectangle(drawbox_x, drawbox_y, drawbox_x + drawbox_width, drawbox_y + drawbox_height, false);
	
	draw_set_halign(fa_left);
	draw_set_font(fnt_cambria_0);
	draw_set_colour(c_white);
	draw_text_ext(drawbox_x + 10, drawbox_y + 10, txt, -1, drawbox_width - 20);
}*/