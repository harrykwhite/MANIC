// Variables
var counter = 0;
var mousex = scr_world_to_screen_x(obj_controller_mouse.x);
var mousey = scr_world_to_screen_y(obj_controller_mouse.y);

var dwidth = display_get_gui_width();
var dheight = display_get_gui_height();

var iskeyboard = (global.game_input_type == InputType.Keyboard);

// Red Tint
redtint_alphato = 0;
if (global.game_combat_state == CombatState.Buildup){
	redtint_alphato = 0.025;
}else if (global.game_combat_state == CombatState.Climax){
	redtint_alphato = 0.06;
}

if (global.game_combat_in_hordechallenge){
	redtint_alphato = 0.085;
}

redtint_alphato += redtint_flash;
redtint_flash = approach(redtint_flash, 0, 20);

if (redtint_alpha < redtint_alphato){
	redtint_alpha += 0.01;
}else if (redtint_alpha > redtint_alphato){
	redtint_alpha -= 0.01;
}

if (redtint_alpha > 0){
	draw_set_colour(c_maroon);
	draw_set_alpha(redtint_alpha);
	draw_rectangle(0, 0, dwidth, dheight, false);
}

// Weapon Slots
var amount = global.weapon_slotmax;
var yspace = 74;
var weapon_standalone_alpha = 1;

if (global.weapon_slot_standalone != -1){
	weapon_standalone_alpha = 0.2;
}

if (weaponslot_shake > 0.02){
    weaponslot_shake *= 0.925;
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
        var yy = 78 + (yspace * counter);
		
		var isred = false;
		
		if (global.weapon_slot[counter] != -1){
			if (global.weapon_type[global.weapon_slot[counter]] == WeaponType.Ranged){
				if (global.weapon_slotammo[counter] <= 0){
					isred = true;
					gpu_set_fog(true, c_red, 0, 0);
				}
			}
		}
		
        if (global.weapon_slotcurrent == counter){
			draw_sprite_ext(spr_ui_weaponslot_1, 0, xx + random_range(-shake, shake), yy + random_range(-shake, shake), 2.25 * global.weapon_slotscale[counter], 2.25 * global.weapon_slotscale[counter], 0, -1, weapon_standalone_alpha * ui_alpha);
			
			if (global.weapon_slotscale[counter] < 1.075){
				global.weapon_slotscale[counter] += 0.025;
			}
		}else{
			if (global.weapon_slotscale[counter] > 1){
				global.weapon_slotscale[counter] -= 0.025;
			}
			
			draw_sprite_ext(spr_ui_weaponslot_0, 0, xx, yy, 2.25 * global.weapon_slotscale[counter], 2.25 * global.weapon_slotscale[counter], 0, -1, weapon_standalone_alpha * ui_alpha);
        }
        
		// Drawin Slot Number
		draw_set_halign(fa_right);
		draw_set_font(fnt_cambria_0);
		draw_set_alpha(1);
		scr_text_shadow_transformed(xx - 14, yy - 28, string(counter + 1), c_gray, 1, 1, 0);
		
		gpu_set_fog(false, c_white, 0, 0);
		
        // Drawing Weapon
        if (global.weapon_slot[counter] != -1) && (global.weapon_slot[counter] != 4){
            var spr = global.weapon_centersprite[global.weapon_slot[counter]];
            
            gpu_set_fog(true, isred ? c_red : c_white, 0, 0);
            draw_sprite_ext(spr, 0, xx, yy, weaponslot_weaponscale[counter], weaponslot_weaponscale[counter], 45, c_white, 1 * weapon_standalone_alpha * ui_alpha);
            gpu_set_fog(false, c_white, 0, 0);
        }else if (global.level_current != Level.Prologue){
            var spr = spr_weapon_4_center;
			
            gpu_set_fog(true, c_gray, 0, 0);
            draw_sprite_ext(spr, 0, xx, yy, (weaponslot_weaponscale[counter] + 0.25), (weaponslot_weaponscale[counter] + 0.25), 45, c_white, 0.6 * weapon_standalone_alpha * ui_alpha);
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
    
    if (!global.player_stamina_active){
        col = c_ltgray;
    }
    
    draw_set_alpha(weapon_standalone_alpha * ui_alpha);
    draw_healthbar(xx, yy, xx + width, yy + height, sc / sm * 100, make_color_rgb(45, 45, 45), col, col, 3, false, false);
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
	
	draw_set_alpha(vignette_flash_alpha * (global.game_option[| Options.Flashing]) / 100);
    gpu_set_fog(true, vignette_flash_colour, 0, 1);
    draw_sprite_stretched(spr_ui_vignette_0, 0, 0, 0, dwidth, dheight);
    gpu_set_fog(false, c_black, 0, 0);
}

// Screen Blend
if (screenblend_alpha > 0){
    draw_set_alpha(screenblend_alpha);
    draw_set_colour(screenblend_colour);
    draw_rectangle(-5, -5, dwidth + 5, dheight + 5, false);
}

// Tutourial Display
if (tutourial) && (global.cutscene_current == -1){
	var tut_count = array_length_1d(tutourial_text);
	
	if (tutourial_stage_timer != -1){
		if (tutourial_stage_timer > 0){
			tutourial_stage_timer --;
		}else{
			scr_tutourial_next_stage();
			
			if (tutourial_stage == TutourialStage.PickupMelee){
				if (tutourial_stage_pickupmelee_equipped){
					scr_tutourial_next_stage();
					tutourial_stage_timer = -1;
					return;
				}
				
				if (!tutourial_stage_pickupmelee_cseen){
					var cutsceneblock = inst_1A5669D2;
				
					instance_destroy(cutsceneblock);
				
					global.cutscene_current = 40;
					obj_controller_gameplay.cutscene_look_x = 1702;
					obj_controller_gameplay.cutscene_look_y = 505;
					obj_controller_gameplay.cutscene_look_time = 80;
					obj_controller_gameplay.cutscene_look_prop = false;
					obj_controller_gameplay.cutscene_look_object = noone;
				}
			}else if (tutourial_stage == TutourialStage.CollectAmmo){
				if (tutourial_stage_ammocollected_done){
					scr_tutourial_next_stage();
					tutourial_stage_timer = -1;
					return;
				}
				
				if (instance_exists(obj_player)){
					global.cutscene_current = 40;
					obj_controller_gameplay.cutscene_look_x = 1762;
					obj_controller_gameplay.cutscene_look_y = 728;
					obj_controller_gameplay.cutscene_look_time = 80;
					obj_controller_gameplay.cutscene_look_prop = false;
					obj_controller_gameplay.cutscene_look_object = noone
				}
			}
			
			tutourial_stage_timer = -1;
		}
	}
	
	tutourial_scale = approach(tutourial_scale, 1, 15);
	
	var tscale = tutourial_scale;
	var tstage = min(tutourial_stage, tut_count - 1);
	
	draw_set_font(fnt_cambria_2);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	
	var stwidth = string_width(tutourial_text[tstage]);
	var toffset = -(stwidth / 2) - ((stwidth / 2) * (tscale - 1));
	
	draw_set_alpha(tutourial_alpha);
	scr_text_shadow_transformed((dwidth / 2) + toffset, (dheight - 160), tutourial_text[tstage], c_white, tscale, tscale, 0);
	
	if (!iskeyboard){
		var xwidth = string_width(tutourial_text[tstage]);
		var xat = string_pos(scr_input_get_name(0), tutourial_text[tstage]) + (string_length(scr_input_get_name(0)) / 2);
		var singlechar = xwidth / string_length(tutourial_text[tstage]);
		var symb = noone;
		
		xat *= singlechar;
		
		switch(tstage){
			case TutourialStage.Movement:
				symb = scr_input_get_symbol_ind(InputBinding.Up);
				break;
			
			case TutourialStage.Pickup:
				symb = scr_input_get_symbol_ind(InputBinding.Interact);
				break;
			
			case TutourialStage.Shoot:
				symb = scr_input_get_symbol_ind(InputBinding.Attack);
				break;
			
			case TutourialStage.Throw:
				symb = scr_input_get_symbol_ind(InputBinding.Throw);
				break;
			
			case TutourialStage.Switch:
				symb = scr_input_get_symbol_ind(InputBinding.SwitchWeaponForward);
				break;
			
			case TutourialStage.Dash:
				symb = scr_input_get_symbol_ind(InputBinding.Dash);
				break;
		}
		
		if (xat != 0) && (symb != noone){
			var ioff = xat + 16;
			var ix = ((dwidth / 2) - (ioff / 2)) + ioff;
			
			draw_sprite_ext(global.game_input_gamepad_current_sprite, symb, ix + ((tscale - 1) * ioff), (dheight - 160), tscale, tscale, 0, c_white, tutourial_alpha);
		}
	}
	
	draw_set_alpha((tscale - 1) * 3 * tutourial_alpha);
	scr_text_shadow_transformed((dwidth / 2) + toffset, (dheight - 160), tutourial_text[tstage], c_maroon, tscale, tscale, 0);
	
	draw_set_alpha(1);
	draw_set_valign(fa_top);
	
	if (tutourial_fade){
		if (tutourial_alpha > 0){
			tutourial_alpha -= 0.05;
		}else{
			tutourial = false;
			tutourial_stage = 0;
			tutourial_fade = false;
			tutourial_alpha = 1;
		}
	}
}

// Kill Display
if (global.level_current != Level.CityHeadquarters) && (!scr_level_is_peaceful(room)){
	var text = "";
	var textx = 40;
	var texty = dheight - 50;
	
	if (global.level_current == Level.Prologue){
		text = "Hunt and kill " + string(global.level_kill_max[global.level_current] - global.level_kill_count[global.level_current]) + " deer.";
		
		if (global.level_cleared[global.level_current]){
			text = "All deers hunted. Return to the house."
		}
	}else{
		text = "Kill " + string(global.level_kill_max[global.level_current] - global.level_kill_count[global.level_current]) + " enemies to clear the level.";
		
		if (global.level_cleared[global.level_current]){
			text = "Area cleared. Proceed to the next level."
		}
	}
	
	draw_set_alpha(1);
	draw_set_font(fnt_cambria_0);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	scr_text_shadow(textx, texty, text, c_white);
	draw_set_valign(fa_top);
}

// Weapon Info
if (weaponinfo){
	weaponinfo_yoff = approach(weaponinfo_yoff, weaponinfo_yoff_max, 20);
}else{
	weaponinfo_yoff = approach(weaponinfo_yoff, 0, 20);
}

if (weaponinfo_yoff > 0.02){
	var wname = global.weapon_name[weaponinfo_index];
	var wdamage = global.weapon_damage[weaponinfo_index];
	var wspeed = global.weapon_speed[weaponinfo_index];
	var wtype = global.weapon_type[weaponinfo_index];
	var gapwidth = 100;
	
	draw_set_alpha(weaponinfo_yoff / weaponinfo_yoff_max);
	draw_set_font(fnt_cambria_2);
	draw_set_halign(fa_center);
	scr_text_shadow(dwidth / 2, dheight - 110 + weaponinfo_yoff, wname, c_white);
	
	draw_set_font(fnt_cambria_0);
	
	if (wtype == WeaponType.Ranged || wtype == WeaponType.Throwing){
		var wcontent_str = (wtype == WeaponType.Ranged)
		? "AMMO: " + string(weaponinfo_ammo) + "/" + string(global.weapon_ammomax[weaponinfo_index])
		: "QUANTITY: x" + string(weaponinfo_quantity);
		var wcontent_col = c_white;
		
		draw_set_halign(fa_center);
		scr_text_shadow((dwidth / 2), dheight - 76 + weaponinfo_yoff, "SPEED: " + scr_weapon_get_level_string(wspeed), c_white);
		
		draw_set_halign(fa_right);
		scr_text_shadow((dwidth / 2) - gapwidth, dheight - 76 + weaponinfo_yoff, "DAMAGE: " + scr_weapon_get_level_string(wdamage), c_white);
		
		if (wtype == WeaponType.Ranged && weaponinfo_ammo <= 0){
			wcontent_col = c_red;
		}
		
		draw_set_halign(fa_left);
		scr_text_shadow((dwidth / 2) + gapwidth, dheight - 76 + weaponinfo_yoff, wcontent_str, wcontent_col);
	}else{
		draw_set_halign(fa_right);
		scr_text_shadow((dwidth / 2) - (gapwidth * 0.2), dheight - 76 + weaponinfo_yoff, "SPEED: " + scr_weapon_get_level_string(wspeed), c_white);
		
		draw_set_halign(fa_left);
		scr_text_shadow((dwidth / 2) + (gapwidth * 0.2), dheight - 76 + weaponinfo_yoff, "DAMAGE: " + scr_weapon_get_level_string(wdamage), c_white);
	}
	
	draw_set_alpha(1);
}

// Weapon Ammo
var w = global.weapon_slot[global.weapon_slotcurrent];
var drawammo = false;

if (global.weapon_slot_standalone != -1){
	w = global.weapon_slot_standalone;
}

if (instance_exists(obj_player)){
	counter = 0;
	var slotmax = global.weapon_slotmax;
	
	draw_set_alpha(ui_alpha);
	draw_set_font(fnt_cambria_0);
	
	repeat(slotmax){
		var xx = 51, yy = (74 * (counter + 1)) + 12;
		draw_set_halign(fa_left);
		draw_set_alpha(weapon_standalone_alpha);
		
		if (global.weapon_slot[counter] != -1){
			var col = c_white;
			
			if (global.weapon_type[global.weapon_slot[counter]] == WeaponType.Throwing){
				var quantity = global.weapon_slotquantity[counter];
				scr_text_shadow(xx, yy, "x" + string(quantity), col);
			}
		}
		
		counter ++;
	}
	
	counter = 0;
	
    if (w != -1){
		/*if (global.weapon_type[w] == WeaponType.Ranged){
			var noammoy = dheight - 220;
			
			if (global.weapon_slot_standalone == -1){
				if (global.weapon_slotammo[global.weapon_slotcurrent] <= 0){
					draw_set_font(fnt_cambria_2);
					draw_set_halign(fa_center);
					scr_text_shadow(dwidth / 2, noammoy, "NO AMMO", c_red);
					draw_set_font(fnt_cambria_0);
					scr_text_shadow(dwidth / 2, noammoy + 30, "[" + scr_mousecheck_string(global.game_option[| Options.Input_Throw]) + "] TO THROW", c_red);
					// ^^^ Could this suggest to the player that there is no way of retrieving ammo back?
				}
			}else{
				if (global.weapon_slot_standalone_ammo <= 0){
					draw_set_font(fnt_cambria_2);
					draw_set_halign(fa_center);
					scr_text_shadow(dwidth / 2, noammoy, "NO AMMO", c_red);
				}
			}
		}*/
		
		if (instance_exists(global.weapon_object[w])){
	        if (global.weapon_type[w] == WeaponType.Ranged){
	            var xx = 131 + weaponammo_x;
	            var yy = 78 - 33;
	            var col = c_white;
				
	            var ammo = global.weapon_slotammo[global.weapon_slotcurrent];
	            var maxammo = global.weapon_ammomax[w];
	            drawammo = true;
				
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
				
				switch(global.weapon_ammotype[w]){
					case AmmoType.Bullets:
						if (weaponammo_scale > 1.01){
							scr_text_shadow_transformed(xx, yy, string(ammo) + "/" + string(maxammo), col, weaponammo_scale, weaponammo_scale, 0);
						}else{
							scr_text_shadow(xx, yy, string(ammo) + "/" + string(maxammo), col);
						}
						break;
					
					case AmmoType.Fuel:
						if (weaponammo_scale > 1.01){
							scr_text_shadow_transformed(xx, yy, string(ammo) + " fuel", col, weaponammo_scale, weaponammo_scale, 0);
						}else{
							scr_text_shadow(xx, yy, string(ammo) + " fuel", col);
						}
						break;
					
					case AmmoType.Explosives:
						if (weaponammo_scale > 1.01){
							scr_text_shadow_transformed(xx, yy, string(ammo) + " explosives", col, weaponammo_scale, weaponammo_scale, 0);
						}else{
							scr_text_shadow(xx, yy, string(ammo) + " explosives", col);
						}
						break;
					
					case AmmoType.Arrows:
						if (weaponammo_scale > 1.01){
							scr_text_shadow_transformed(xx, yy, string(ammo) + " arrows", col, weaponammo_scale, weaponammo_scale, 0);
						}else{
							scr_text_shadow(xx, yy, string(ammo) + " arrows", col);
						}
						break;
					
					case AmmoType.Darts:
						if (weaponammo_scale > 1.01){
							scr_text_shadow_transformed(xx, yy, string(ammo) + " darts", col, weaponammo_scale, weaponammo_scale, 0);
						}else{
							scr_text_shadow(xx, yy, string(ammo) + " darts", col);
						}
						break;
					
					case AmmoType.Shells:
						if (weaponammo_scale > 1.01){
							scr_text_shadow_transformed(xx, yy, string(ammo) + "/" + string(maxammo) + " shells", col, weaponammo_scale, weaponammo_scale, 0);
						}else{
							scr_text_shadow(xx, yy, string(ammo) + "/" + string(maxammo) + " shells", col);
						}
						break;
				}
	        }else{
				weaponammo_x = 0;
			}
		}
    }
}

// Collectables
var str = "COLLECTABLES: " + string(global.level_collectable_current[global.level_current]) + "/" + string(global.level_collectable_number[global.level_current]) + "\nTIME: " + string(scr_seconds_to_timer(global.game_save_seconds));

if (global.level_collectable_number[global.level_current] <= 0){
	str = string_replace(str, "COLLECTABLES: " + string(global.level_collectable_current[global.level_current]) + "/" + string(global.level_collectable_number[global.level_current]) + "\n", "");
}

if (!drawammo){
	stats_y = approach(stats_y, 48, 30);
}else{
	stats_y = approach(stats_y, 72, 30);
}

draw_set_alpha(1);
draw_set_font(fnt_cambria_n1);
draw_set_halign(fa_left);
scr_text_shadow(136, stats_y, str, c_white);

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

// Boss Health
bosshealth_width_to = 500 / global.game_option[| Options.UIScale];

if (!global.game_pause){
	if (global.boss_current != -1) && (global.boss_current != Boss.SniperRobot) && (global.boss_current != Boss.MotherRobot) && (global.cutscene_current == -1) && (blackbar_sizereal <= 40){
		bosshealth_width_current = approach(bosshealth_width_current, bosshealth_width_to, 5);
	}else if (global.cutscene_current == -1){
		bosshealth_width_current = approach(bosshealth_width_current, -10, 5);
	}
}

if (bosshealth_value_current < bosshealth_value_previous){
	bosshealth_flash = 1;
}

if (bosshealth_flash > 0.01){
	bosshealth_flash *= 0.8;
}

if (bosshealth_width_current > 0){
	var xx = dwidth / 2;
	var yy = dheight - 100;
	var w = bosshealth_width_current;
	var h = 6;
	
	draw_healthbar(xx - (w / 2), yy - (h / 2), xx + (w / 2), yy + (h / 2), floor((bosshealth_value_current / bosshealth_value_max) * 100), make_color_rgb(45, 45, 45), c_ltgray, c_ltgray, 0, true, false);
	
	draw_set_alpha(bosshealth_flash * 0.3);
	draw_set_colour(c_ltgray);
	draw_rectangle(xx - (w / 2), yy - (h / 2), xx + (w / 2), yy + (h / 2), false);
	draw_set_alpha(1);
}

bosshealth_value_previous = bosshealth_value_current;

// Header Display
if (header_display_time > 0){
	header_display_time --;
	if (header_display_alpha < 1){
		header_display_alpha += 0.05;
	}
}else{
	if (header_display_alpha > 0){
		header_display_alpha -= 0.05;
	}else{
		header_display_line_width = 0;
	}
}

if (header_display_alpha > 0){
	draw_set_font(fnt_cambria_1);
	var subtwidth = string_width(header_display_subtext);
	
	draw_set_font(fnt_cambria_3);
	var twidth = string_width(header_display_text);
	
	var line_width_to = max(twidth, subtwidth) + 30;
	header_display_line_width = approach(header_display_line_width, line_width_to, 5);
	
	draw_set_alpha(header_display_alpha * (header_display_line_width / line_width_to));
	draw_set_halign(fa_center);
	scr_text_shadow(dwidth / 2, 228 + ((1 - (header_display_line_width / line_width_to)) * 30), header_display_text, c_white);
	
	draw_rectangle((dwidth / 2) - (header_display_line_width / 2), 264, (dwidth / 2) + (header_display_line_width / 2), 265, false);
	
	draw_set_font(fnt_cambria_1);
	scr_text_shadow(dwidth / 2, 269, header_display_subtext, c_white);
	
	draw_set_alpha(1);
}

// Checkpoint Display
if (checkpoint_text_time > 0){
	if (checkpoint_text_alpha < 1){
		checkpoint_text_alpha += 0.05;
	}
	
	checkpoint_text_time --;
}else{
	if (checkpoint_text_alpha > 0){
		checkpoint_text_alpha -= 0.05;
	}
}

if (checkpoint_text_alpha > 0){
	var yy = 96;
	
	draw_set_alpha(checkpoint_text_alpha);
	draw_set_font(fnt_cambria_1);
	draw_set_halign(fa_center);
	
	if (checkpoint_text_time > 0){
		scr_text_shadow((dwidth / 2), yy - ((1 - checkpoint_text_alpha) * 30), "[Checkpoint Reached]", c_white);
	}else{
		scr_text_shadow((dwidth / 2), yy, "[Checkpoint Reached]", c_white);
	}
	
	//var line_width_to = string_width("[Checkpoint Reached]") + 30;
	//checkpoint_text_line_width = approach(checkpoint_text_line_width, line_width_to, 5);
	
	//draw_rectangle((dwidth / 2) - (checkpoint_text_line_width / 2), yy - 3, (dwidth / 2) + (checkpoint_text_line_width / 2), yy - 2, false);
	draw_set_alpha(1);
}

// Control Indication
if (control_indicate){
	if (control_indicate_x < 48){
		control_indicate_x = approach(control_indicate_x, 48, 20);
	}
}else{
	if (control_indicate_x > -388){
		control_indicate_x = approach(control_indicate_x, -388, 10);
	}else{
		control_indicate_text = "";
	}
}

if (control_indicate_text != ""){
	var buttonstr = scr_input_get_name(InputBinding.Interact);
	var buttonstr = scr_input_get_name(InputBinding.Interact);
	var buttonsymb = scr_input_get_symbol_ind(InputBinding.Interact);
	
	draw_set_font(fnt_cambria_1);
	draw_set_halign(fa_right);
	draw_set_valign(fa_middle);
	draw_set_alpha(0.8);
	
	if (iskeyboard){
		scr_text_shadow(dwidth - control_indicate_x, dheight - 50, control_indicate_text + " [" + buttonstr + "]", c_white);
	}else{
		scr_text_shadow(dwidth - control_indicate_x - 16, dheight - 50, control_indicate_text, c_white);
		draw_sprite(global.game_input_gamepad_current_sprite, real(buttonsymb), dwidth - control_indicate_x + 7, dheight - 51);
	}
	
	draw_set_valign(fa_top);
}

control_indicate = false;

// Level Cleared
if (levelcleared_time > 0){
	if (levelcleared_alpha < 1){
		levelcleared_alpha += 0.05;
	}
	levelcleared_time --;
}else{
	if (levelcleared_alpha > 0){
		levelcleared_alpha -= 0.02;
	}
}

if (levelcleared_alpha > 0){
	var xx = dwidth / 2;
	var yy = dheight / 2;
	yy -= 250;
	
	draw_set_font(fnt_cambria_3);
	draw_set_halign(fa_center);
	draw_set_alpha(levelcleared_alpha);
	scr_text_shadow(xx, yy, "LEVEL CLEARED", c_white);
}

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
if (pause_text_alpha > 0) || (pausedialogue_alpha > 0){
	draw_set_colour(c_black);
	draw_set_alpha((pause_text_alpha + pausedialogue_alpha) * 0.5);
	draw_rectangle(0, 0, dwidth, dheight, false);
}

// Pause
var xx = dwidth / 2;
var yy = (dheight / 2) - ((30 * pause_selectedmax) / 2);
var offset = 42;

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
	draw_set_valign(fa_middle);
	draw_set_font(fnt_cambria_3);
	scr_text_shadow(xx, yy - 80, "GAME PAUSED", c_white);
	
	draw_set_font(fnt_cambria_2);
	
	var selected_set = pause_has_selected;
	
	if (iskeyboard){
		pause_selected = -1;
	}
	
	repeat(pause_selectedmax){
		var opty = yy + (counter * offset);
		
		if (!selected_set){
			if (iskeyboard){
				if (point_in_rectangle(mousex, mousey, xx - 80, opty - 16, xx + 80, opty + 16)){
					pause_selected = counter;
					selected_set = true;
				}
			}
		}
		
		if (pause_selected == counter){
			pause_selectoption_scale[counter] = approach(pause_selectoption_scale[counter], 1.1, 40);
			scr_text_shadow_transformed(xx, opty, pause_selectoption[counter], make_colour_rgb(189, 23, 23), pause_selectoption_scale[counter], pause_selectoption_scale[counter], 0);
		}else{
			pause_selectoption_scale[counter] = approach(pause_selectoption_scale[counter], 1, 40);
			scr_text_shadow_transformed(xx, opty, pause_selectoption[counter], c_white, pause_selectoption_scale[counter], pause_selectoption_scale[counter], 0);
		}
		
		counter ++;
	}
	
	draw_set_valign(fa_top);
	counter = 0;
}

if (!pause_text_update){
	if (global.game_pause) || (global.cutscene_current != -1){
		pause_text_update = true;
	}
}

// Pause Dialogue
var optxx = dwidth / 2;
var optyy = (dheight / 2) - ((30 * pausedialogue_option_max) / 2);

if (pausedialogue){
	if (pausedialogue_alpha < 1){
		pausedialogue_alpha += 0.1;
	}
}else{
	if (pausedialogue_alpha > 0){
		pausedialogue_alpha -= 0.1;
	}else{
		pausedialogue_option_selected = 0;
		pausedialogue_type = 0;
		pausedialogue_alpha = 0;
	}
}

if (pausedialogue_alpha > 0){
	var vslot = 0;
	var selected_set = false;
	
	draw_set_alpha(pausedialogue_alpha);
	draw_set_font(fnt_cambria_0);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	switch(pausedialogue_type){
		case 0:
			scr_text_shadow(dwidth / 2, (dheight / 2) - 40, pausedialogue_type_text, c_white);
			vslot = 1;
			break;
	
		case 1:
			optyy += string_height(pausedialogue_type_text) + 10;
			
			draw_set_font(fnt_cambria_2);
			scr_text_shadow(dwidth / 2, (dheight / 2) - 40, pausedialogue_type_text, c_white);
			
			if (iskeyboard){
				pausedialogue_option_selected = -1;
			}
			
			draw_set_font(fnt_cambria_1);
			
			for(var counter = 0; counter < pausedialogue_option_max; counter ++){
				var optrealy = optyy + (counter * 34);
				 vslot ++;
				
				if (!selected_set){
					if (iskeyboard){
						if (point_in_rectangle(mousex, mousey, optxx - 80, optrealy - 16, optxx + 80, optrealy + 16)){
							pausedialogue_option_selected = counter;
							selected_set = true;
						}
					}
				}
				
				if (pausedialogue_option_selected == counter){
					pausedialogue_type_option_scale[counter] = approach(pausedialogue_type_option_scale[counter], 1.1, 40);
					scr_text_shadow_transformed(optxx, optrealy, pausedialogue_type_option[counter], make_colour_rgb(189, 23, 23), pausedialogue_type_option_scale[counter], pausedialogue_type_option_scale[counter], 0);
				}else{
					pausedialogue_type_option_scale[counter] = approach(pausedialogue_type_option_scale[counter], 1, 40);
					scr_text_shadow_transformed(optxx, optrealy, pausedialogue_type_option[counter], c_white, pausedialogue_type_option_scale[counter], pausedialogue_type_option_scale[counter], 0);
				}
			}
			
			break;
	}
	
	var exity = optyy + (vslot * 42) + 14;
	if (!selected_set){
		if (point_in_rectangle(mousex, mousey, optxx - 80, exity - 16, optxx + 80, exity + 16)){
			pausedialogue_option_selected = counter;
			selected_set = true;
		}
	}
	
	if (pausedialogue_option_selected == counter){
		pausedialogue_option_exitscale = approach(pausedialogue_option_exitscale, 1.1, 40);
		scr_text_shadow_transformed(optxx, exity, "Resume", make_colour_rgb(189, 23, 23), pausedialogue_option_exitscale * 1.05, pausedialogue_option_exitscale * 1.05, 0);
	}else{
		pausedialogue_option_exitscale = approach(pausedialogue_option_exitscale, 1, 40);
		scr_text_shadow_transformed(optxx, exity, "Resume", c_white, pausedialogue_option_exitscale * 1.05, pausedialogue_option_exitscale * 1.05, 0);
	}
	
	draw_set_valign(fa_top);
}

// Level Screen Opening
if (screen_fade_opening > 0){
	screen_fade_opening -= 0.0075;
	
	draw_set_alpha(screen_fade_opening);
	draw_set_colour(c_black);
	draw_rectangle(0, 0, dwidth, dheight, false);
}

// Game Opening Intro
if (global.level_current == Level.Prologue){
	if (game_opening_intro){
		var text = "MANIC";
		
		if (game_opening_intro_text_stage == 0){
			text = "Geta presents";
			draw_set_font(fnt_cambria_1);
		}else{
			draw_set_font(fnt_cambria_4);
		}
		
		draw_set_alpha(game_opening_intro_alpha);
		draw_set_colour(c_black);
		draw_rectangle(0, 0, dwidth, dheight, false);
		
		draw_set_alpha(game_opening_intro_text_alpha);
		draw_set_halign(fa_center);
		scr_text_shadow(dwidth / 2, dheight / 2, text, c_white);
	}
}

// Game Ending
if (ending){
	draw_set_alpha(ending_back_alpha);
	draw_set_colour(c_black);
	draw_rectangle(0, 0, dwidth, dheight, false);
	
	draw_set_font(fnt_cambria_6);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(ending_logo_text_alpha);
	scr_text_shadow(dwidth / 2, dheight / 2, "MANIC", c_white);
	
	draw_set_font(fnt_cambria_3);
	draw_set_alpha(ending_credits_text_alpha);
	scr_text_shadow(dwidth / 2, (dheight / 2) - 165, "A GAME BY GETA", c_white);
	
	draw_set_font(fnt_cambria_2);
	scr_text_shadow(dwidth / 2, (dheight / 2) - 100, "Programming, artwork and game design by Harry White", c_white);
	scr_text_shadow(dwidth / 2, (dheight / 2) - 50, "Music and sound effects created by Frank Albrecht and Kare Abrahamsen", c_white);
	scr_text_shadow(dwidth / 2, (dheight / 2), "Art assistance for character design by James Lynch", c_white);
	scr_text_shadow(dwidth / 2, (dheight / 2) + 50, "Programming assistance from Gideon the Bard and Sam Hollins", c_white);
	scr_text_shadow(dwidth / 2, (dheight / 2) + 100, "Thanks for playing!", c_white);
	
	var cont_text = "Press [" + scr_input_get_name(InputBinding.Attack) + "] to return to titlescreen"
	
	if (!iskeyboard){
		cont_text = "Press " + scr_input_get_name(InputBinding.Interact) + "   to return to titlescreen";
		
		var xat = string_pos(scr_input_get_name(0), cont_text) + (string_length(scr_input_get_name(0)) / 2);
		xat *= string_width(cont_text) / string_length(cont_text);
		
		draw_sprite(global.game_input_gamepad_current_sprite, scr_input_get_symbol_ind(InputBinding.Interact),
		(dwidth / 2) - (string_width(cont_text) / 2) + xat + 4, (dheight / 2) + 165);
	}
	
	scr_text_shadow(dwidth / 2, (dheight / 2) + 165, cont_text, c_white);
	
	draw_set_valign(fa_top);
}

draw_set_alpha(1);