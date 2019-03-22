var soffset = wave(0, 0.025, 3, 0, false);
var counter = 0;
var dwidth = display_get_gui_width();
var dheight = display_get_gui_height();

// Weapon Slots
var amount = array_length_1d(global.weapon_slot);
var yspace = 74;
var weapon_standalone_alpha = 1;

if (global.weapon_slot_standalone != -1){
	weapon_standalone_alpha = 0.2;
}

if (weaponslot_shake > 0.05){
    weaponslot_shake *= 0.9;
}else{
    weaponslot_shake = 0;
}

var shake = weaponslot_shake;

if (instance_exists(obj_player)){
    repeat(amount){
        
        // Weapon Slot Scale
        if (weaponslot_weaponscale[counter] < 1.875){
            weaponslot_weaponscale[counter] += 0.25;
        }else{
            weaponslot_weaponscale[counter] = 1.875;
        }
        
        // Drawing Slot
        var xx = 78;
        var yy = 78 + (yspace * counter);
		
        if (global.weapon_slotcurrent == counter){
			draw_sprite_ext(spr_ui_weaponslot_1, 0, xx + random_range(-shake, shake), yy + random_range(-shake, shake), 2.25 * global.weapon_slotscale[counter], 2.25 * global.weapon_slotscale[counter], 0, -1, weapon_standalone_alpha * ui_alpha);
			
			if (global.weapon_slotscale[counter] < 1.075){
				global.weapon_slotscale[counter] += 0.025;
			}
		}else{
			if (global.weapon_slotscale[counter] > 1){
				global.weapon_slotscale[counter] -= 0.025;
			}
			
            if (counter > 0){
				if (global.weapon_slotcurrent == counter - 1){
					//yy += 10 * global.weapon_slotscale[counter - 1];
				}
			}
			
			draw_sprite_ext(spr_ui_weaponslot_0, 0, xx, yy, 2.25 * global.weapon_slotscale[counter], 2.25 * global.weapon_slotscale[counter], 0, -1, weapon_standalone_alpha * ui_alpha);
        }
        
        // Drawing Weapon
        if (global.weapon_slot[counter] != -1) && (global.weapon_slot[counter] != 4){
            var spr = global.weapon_sprite[global.weapon_slot[counter]];
            
			gpu_set_fog(true, c_gray, 0, 0);
			draw_sprite_ext(spr, 0, (xx - 9) + 1, (yy + 8) + 1, weaponslot_weaponscale[counter], weaponslot_weaponscale[counter], 45, c_white, 0.75 * weapon_standalone_alpha * ui_alpha);
			
            gpu_set_fog(true, c_white, 0, 0);
            draw_sprite_ext(spr, 0, xx - 9, yy + 8, weaponslot_weaponscale[counter], weaponslot_weaponscale[counter], 45, c_white, 1 * weapon_standalone_alpha * ui_alpha);
            gpu_set_fog(false, c_white, 0, 0);
			
        }else{
            var spr = spr_weapon_4;
			
			gpu_set_fog(true, c_dkgray, 0, 0);
			draw_sprite_ext(spr, 0, (xx - 9) + 1, (yy + 8) + 1, weaponslot_weaponscale[counter], weaponslot_weaponscale[counter], 45, c_white, 0.75 * weapon_standalone_alpha * ui_alpha);
			
            gpu_set_fog(true, c_gray, 0, 0);
            draw_sprite_ext(spr, 0, xx - 9, yy + 8, (weaponslot_weaponscale[counter] + 0.25), (weaponslot_weaponscale[counter] + 0.25), 45, c_white, 0.6 * weapon_standalone_alpha * ui_alpha);
            gpu_set_fog(false, c_black, 0, 0);
        }
		
		counter ++;
    }
	
	counter = 0;
}

// Player Stamina
if (instance_exists(obj_player)){
    var sc = global.player_stamina_current;
    var sm = global.player_stamina_max;
    
    var xx = 122;
    var yy = 78 - 30;
    var width = 3;
    var height = 137;
    var col = c_white;
    
    if (global.player_stamina_active == false){
        col = c_ltgray;
    }
    
    draw_set_alpha(weapon_standalone_alpha * ui_alpha);
    draw_healthbar(xx, yy, xx + width, yy + height, sc / sm * 100, c_white, col, col, 3, false, false);
}

// Player Hit
if (playerhit_alpha > 0){
    playerhit_alpha -= 0.05;
    
	draw_set_alpha(playerhit_alpha);
    gpu_set_fog(true, playerhit_colour, 0, 1);
    draw_sprite_stretched(spr_ui_vignette_0, 0, 0, 0, dwidth, dheight);
    gpu_set_fog(false, c_black, 0, 0);
}

// Vignette Flash
if (vignette_flash_alpha > 0){
	vignette_flash_alpha -= vignette_flash_alpha_speed;
	
	draw_set_alpha(vignette_flash_alpha);
    gpu_set_fog(true, vignette_flash_colour, 0, 1);
    draw_sprite_stretched(spr_ui_vignette_0, 0, 0, 0, dwidth, dheight);
    gpu_set_fog(false, c_black, 0, 0);
}

// Screen Blend
if (screenblend_alpha > 0){
    draw_set_alpha(screenblend_alpha);
    draw_set_colour(screenblend_colour);
    draw_rectangle(-5, -5, dwidth+5, dheight+5, false);
}

// Score Display
var length = 7;
var shake = wave(-score_shake, score_shake, 0.2, 0);

draw_set_alpha(1);
draw_set_font(fnt_cambria_2);
draw_set_halign(fa_left);
scr_text_shadow_transformed(58 + shake, (dheight - 63) + shake, string(score_current) + "pts", c_white, (score_scale * 1.35) + soffset, (score_scale * 1.35) + soffset, 0);

// Score Text Display
if (score_text_time > 0){
	score_text_time--;
	
	if (score_text_alpha < 1){
		score_text_alpha += 0.1;
	}
	
	if (score_text_offset > 0){
		score_text_offset -= 0.25;
	}
}else{
	
	if (score_text_alpha > 0){
		score_text_alpha -= 0.1;
	}
	
	if (score_text_offset > -12){
		score_text_offset -= 0.25;
	}
}

if (score_text_alpha > 0){
	draw_set_alpha(score_text_alpha);
	draw_set_font(fnt_cambria_2);
	scr_text_shadow_transformed(59 + shake, ((dheight - 32) + shake) + score_text_offset, string(score_text), c_white, (score_scale * 0.65) + soffset, (score_scale * 0.65) + soffset, 0);
	draw_set_valign(fa_top);
}

// Weapon Ammo
var w = global.weapon_slot[global.weapon_slotcurrent];

if (global.weapon_slot_standalone != -1){
	w = global.weapon_slot_standalone;
}

if (instance_exists(obj_player)){
	repeat(2){
		if (global.weapon_slot[counter] != -1){
			if (global.weapon_type[global.weapon_slot[counter]] == WeaponType.Throwing){
				var xx = 41, yy;
				var col = make_color_hsv(0, 0, (color_get_value(c_white) - 7) + weaponammo_scale);
				var quantity = ceil(global.weapon_quantity[global.weapon_slot[counter]]);
				
				switch(counter){
					case 0:
						yy = 64;
						break;
					
					case 1:
						yy = 143;
						break;
				}
				
				draw_set_halign(fa_left);
				draw_set_font(fnt_cambria_0);
				draw_set_alpha(ui_alpha);
				scr_text_shadow_transformed(xx, yy, "x" + string(quantity), col, (weaponammo_scale * 1.1) + soffset, (weaponammo_scale * 1.1) + soffset, 0);
			}
		}
		
		counter ++;
	}
	
	counter = 0;
	
    if (w != -1){
		if (instance_exists(global.weapon_object[w])){
	        if (global.weapon_type[w] == WeaponType.Ranged){
	            var xx = 131 + weaponammo_x;
	            var yy = 78 - 30;
	            var col = make_color_hsv(0, 0, (color_get_value(c_white) - 7) + weaponammo_scale);
				
	            var ammo = global.weapon_slotammo[global.weapon_slotcurrent];
	            var maxammo = global.weapon_ammomax[global.weapon_slot[global.weapon_slotcurrent]];
	            
				if (global.weapon_slot_standalone != -1){
					ammo = global.weapon_slot_standalone_ammo;
					maxammo = global.weapon_ammomax[global.weapon_slot_standalone];
				}
				
				if (weaponammo_x < 5){
					weaponammo_x += 2.5;
				}
				
				weaponammo_scale = approach(weaponammo_scale, weaponammo_scaleTo, 20);
            
	            if (ammo == 0){
	                col = c_red;
	            }
            
	            draw_set_halign(fa_left);
	            draw_set_font(fnt_cambria_2);
				draw_set_alpha(ui_alpha);
				
				if (global.weapon_ammotype[w] == AmmoType.Bullets){
					scr_text_shadow_transformed(xx, yy, string(ammo) + "/" + string(maxammo), col, (weaponammo_scale * 1.1) + soffset, (weaponammo_scale * 1.1) + soffset, 0);
				}
				
				if (global.weapon_ammotype[w] == AmmoType.Fuel){
					scr_text_shadow_transformed(xx, yy, string(ammo) + " fuel", col, (weaponammo_scale * 1.1) + soffset, (weaponammo_scale * 1.1) + soffset, 0);
				}
				
				if (global.weapon_ammotype[w] == AmmoType.Explosives){
					scr_text_shadow_transformed(xx, yy, string(ammo) + " explosives", col, (weaponammo_scale * 1.1) + soffset, (weaponammo_scale * 1.1) + soffset, 0);
				}
				
				if (global.weapon_ammotype[w] == AmmoType.Arrows){
					scr_text_shadow_transformed(xx, yy, string(ammo) + " arrows", col, (weaponammo_scale * 1.1) + soffset, (weaponammo_scale * 1.1) + soffset, 0);
				}
				
				if (global.weapon_ammotype[w] == AmmoType.Darts){
					scr_text_shadow_transformed(xx, yy, string(ammo) + " darts", col, (weaponammo_scale * 1.1) + soffset, (weaponammo_scale * 1.1) + soffset, 0);
				}
	        }else{
				weaponammo_x = 0;
			}
		}
    }
}

/* Time Passed
var time_passed_text;
var time_passed_minutes = (global.game_time_passed div 100) div 60;
var time_passed_seconds = (global.game_time_passed div 100) - (60 * time_passed_minutes);

if (time_passed_seconds < 10){
	time_passed_text = string(time_passed_minutes) + ":0" + string(time_passed_seconds);
}else{
	time_passed_text = string(time_passed_minutes) + ":" + string(time_passed_seconds);
}

draw_set_halign(fa_center);
draw_set_font(fnt_cambria_0);
scr_text_shadow(dwidth / 2, (dheight / 2) + 28, time_passed_text, c_white);*/

// Level Text
if (leveltext_alpha > 0){
	draw_set_font(fnt_cambria_2);

	var xx = dwidth / 2;
	var yy = 160;
	var width = string_width(leveltext_text) + 30;
	var height = 1;
	var offset = 25;

	draw_set_colour(c_white);
	draw_set_alpha(leveltext_alpha);
	draw_rectangle((dwidth - xx) - (width / 2), yy, (dwidth - xx) + (width / 2), yy + height, false);

	draw_set_halign(fa_center);
	scr_text_shadow(xx, yy - (offset), string(leveltext_text), c_white);
}

// Control Indication
if (control_indicate){
	if (control_indicate_x < 48){
		control_indicate_x += 31;
	}
}else{
	if (control_indicate_x > -388){
		control_indicate_x -= 31;
	}else{
		control_indicate_text = "";
	}
}

if (control_indicate_text != ""){
	draw_set_font(fnt_cambria_2);
	draw_set_halign(fa_right);
	draw_set_alpha(0.8);
	scr_text_shadow(dwidth - control_indicate_x, dheight - 64, control_indicate_text, c_white);
}

control_indicate = false;

/* Area Cleared
if (areacleared_time > 0){
	if (areacleared_alpha < 1){
		areacleared_alpha += 0.1;
	}
	areacleared_time --;
}else{
	if (areacleared_alpha > 0){
		areacleared_alpha -= 0.02;
	}
}

if (areacleared_alpha > 0){
	var xx = dwidth / 2;
	var yy = dheight / 2;
	yy -= 150;
	
	draw_set_font(fnt_cambria_4);
	draw_set_halign(fa_center);
	draw_set_alpha(0.8 * areacleared_alpha * 0.8);
	scr_text_shadow(xx, yy, "AREA CLEARED", c_white);
}*/

// Level Results / Ranking
if (rank_display_draw){
	blackbar_draw = true;
	
	draw_set_alpha(rank_display_alpha);
	draw_set_font(fnt_cambria_2);
	draw_set_halign(fa_center);
	scr_text_shadow(dwidth / 2, 214, string(levelname), c_white);
	draw_rectangle(0, 274, dwidth, 274 + (3), false);
	
	draw_set_font(fnt_cambria_1);
	
	var x1 = (dwidth / 2) - 300;
	var x2 = (dwidth / 2) + 300;
	var length = array_length_1d(rank_string);

	repeat(length){
		if (rank_display[counter]){
			draw_set_alpha(rank_alpha[counter]);
			draw_set_halign(fa_left);
			scr_text_shadow(x1, (370 + (50 * counter)), string(rank_string[counter]), c_white);
		
			draw_set_halign(fa_right);
			scr_text_shadow(x2, (370 + (50 * counter)), string(rank_score[counter]) + "pts", make_colour_rgb(189, 23, 23));
		}
		
		counter ++;
	}
	
	counter = 0;
	
	if (rank_end_display){
		draw_set_font(fnt_cambria_2);
		draw_set_halign(fa_center);
		draw_set_alpha(rank_end_alpha);
		scr_text_shadow((dwidth / 2) - 40, (370 + (50 * (length + 2))), "Grade", c_white);
		
		var scale = 0.85;
		
		draw_set_font(fnt_cambria_2);
		scr_text_shadow_transformed((dwidth / 2) + 60, (370 + (50 * (length + 2))) - 4, string(scr_rank_to_string(rank)), c_white, scale, scale, 0);
		
		draw_set_font(fnt_cambria_0);
		scr_text_shadow(dwidth / 2, (370 + (50 * (length + 2))) + 50, "Press Enter to Continue", c_white);
	}
}

// Pause Backdrop
if (pausedialogue_alpha > 0) || (pause_text_alpha > 0){
	draw_set_colour(c_black);
	draw_set_alpha((pause_text_alpha + pausedialogue_alpha) * 0.5);
	draw_rectangle(0, 0, dwidth, dheight, false);
}

// Pause
var xx = dwidth / 2;
var yy = (dheight / 2) - ((30 * pause_selectedmax) / 2);
var offset = 30;

if (global.game_pause) && (!pausedialogue){
	if (pause_text_alpha < 1){
		pause_text_alpha += 0.15;
	}
}else{
	pause_text_update = false;
	
	if (pause_text_alpha > 0){
		pause_text_alpha -= 0.15;
	}
}

if (pause_text_alpha > 0){
	draw_set_alpha(pause_text_alpha);
	draw_set_halign(fa_center);
	draw_set_font(fnt_cambria_1);
	repeat(pause_selectedmax){
		if (pause_selected == counter){
			scr_text_shadow(xx, yy + (counter * offset), pause_selectoption[counter], make_colour_rgb(189, 23, 23));
		}else{
			scr_text_shadow(xx, yy + (counter * offset), pause_selectoption[counter], c_white);
		}
		
		counter ++;
	}
	
	counter = 0;
}

if (pause_text_update == false){
	if (global.game_pause) || (global.cutscene_current != -1){
		pause_text_offset = 0;
		pause_text_update = true;
	}
}

// Pause Dialogue
var optxx = dwidth / 2;
var optyy = (dheight / 2) - ((30 * pausedialogue_option_max) / 2);

if (pausedialogue){
	if (pausedialogue_alpha < 1){
		pausedialogue_alpha += 0.15;
	}
}else{
	if (pausedialogue_alpha > 0){
		pausedialogue_alpha -= 0.15;
	}else{
		pausedialogue_option_selected = 0;
		pausedialogue_type = 0;
		pausedialogue_alpha = 0;
	}
}

if (pausedialogue_alpha > 0){
	draw_set_alpha(pausedialogue_alpha);
	draw_set_font(fnt_cambria_1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);

	switch(pausedialogue_type){
		case 0:
			scr_text_shadow(dwidth / 2, dheight / 2, pausedialogue_type_text, c_white);
			break;
	
		case 1:
			optyy += 45;
			scr_text_shadow(dwidth / 2, (dheight / 2) - 30, pausedialogue_type_text, c_white);
			for(var counter = 0; counter < pausedialogue_option_max; counter ++){
				if (pausedialogue_option_selected == counter){
					scr_text_shadow(optxx, optyy + (counter * 30), pausedialogue_type_option[counter], make_colour_rgb(189, 23, 23));
				}else{
					scr_text_shadow(optxx, optyy + (counter * 30), pausedialogue_type_option[counter], c_white);
				}
			}
			break;
	}

	scr_text_shadow((dwidth / 2) + 220, (dheight / 2) + 220, "Resume [E]", c_white);
	draw_set_valign(fa_top);
}

// Level Screen Opening
if (screen_fade_opening > 0){
	screen_fade_opening -= 0.0035;
	
	draw_set_alpha(screen_fade_opening);
	draw_set_colour(c_black);
	draw_rectangle(0, 0, dwidth, dheight, false);
}

draw_set_alpha(1);