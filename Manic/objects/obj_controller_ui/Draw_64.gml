if (!obj_controller_all.show_ui){
	return;
}

// Variables
var counter = 0;
var mousex = scr_world_to_screen_x(obj_controller_mouse.x);
var mousey = scr_world_to_screen_y(obj_controller_mouse.y);

var dwidth = display_get_gui_width();
var dheight = display_get_gui_height();

var iskeyboard = (global.game_input_type == InputType.Keyboard);
var iscutscene = (global.cutscene_current != -1);

var levelcur = global.level_current;

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
var weaponslot = global.weapon_slot;
var weaponcentersprite = global.weapon_centersprite;
var weapondefault = global.weapon_default;
var weaponslotcurrent = global.weapon_slotcurrent;
var weaponslotamount = global.weapon_slotmax;
var weaponslotammo = global.weapon_slotammo;

var yspace = 74;
var weapon_standalone_alpha = 1;

if (global.weapon_slot_standalone != -1){
	weapon_standalone_alpha = 0.2;
}

repeat(weaponslotamount){
	// Weapon Slot Scale and Shake
    if (weaponslot_weaponscale[counter] < 1.875){
		weaponslot_weaponscale[counter] += 0.25;
    }else{
        weaponslot_weaponscale[counter] = 1.875;
    }
	
	if (weaponslot_shake[counter] > 0.02){
		weaponslot_shake[counter] *= 0.925;
	}else{
		weaponslot_shake[counter] = 0;
	}
	
	// Drawing Slot
    var xx = 78;
    var yy = 78 + (yspace * counter);
	var slotsprite = spr_ui_weaponslot_0;
	
	xx += random_range(-weaponslot_shake[counter], weaponslot_shake[counter]);
	yy += random_range(-weaponslot_shake[counter], weaponslot_shake[counter]);
	
	var isred = false;
	
	if (weaponslot[counter] != -1){
		if (global.weapon_type[weaponslot[counter]] == WeaponType.Ranged){
			if (weaponslotammo[counter] <= 0){
				isred = true;
				gpu_set_fog(true, c_red, 0, 0);
			}
		}
	}
	
    if (weaponslotcurrent == counter){
		slotsprite = spr_ui_weaponslot_1;
		
		if (global.weapon_slotscale[counter] < 1.075){
			global.weapon_slotscale[counter] += 0.025;
		}
	}else{
		if (global.weapon_slotscale[counter] > 1){
			global.weapon_slotscale[counter] -= 0.025;
		}
    }
	
	draw_sprite_ext(slotsprite, 0, xx, yy, 2.25 * global.weapon_slotscale[counter], 2.25 * global.weapon_slotscale[counter], 0, -1, weapon_standalone_alpha * ui_alpha);
    
	// Drawin Slot Number
	draw_set_halign(fa_right);
	draw_set_font(fnt_cambria_0);
	draw_set_alpha(1);
	scr_text(xx - 14, yy - 28, string(counter + 1), c_gray);
	
	gpu_set_fog(false, c_white, 0, 0);
	
    // Drawing Weapon
    if (weaponslot[counter] != -1) && (weaponslot[counter] != weapondefault){
		var spr = weaponcentersprite[weaponslot[counter]];
        
        gpu_set_fog(true, isred ? c_red : c_white, 0, 0);
        draw_sprite_ext(spr, 0, xx, yy, weaponslot_weaponscale[counter], weaponslot_weaponscale[counter], 45, c_white, 1 * weapon_standalone_alpha * ui_alpha);
        gpu_set_fog(false, c_white, 0, 0);
    }else if (levelcur != Level.Prologue){
		var spr = weaponcentersprite[weapondefault];
		
		gpu_set_fog(true, c_gray, 0, 0);
        draw_sprite_ext(spr, 0, xx, yy, (weaponslot_weaponscale[counter] + 0.25), (weaponslot_weaponscale[counter] + 0.25), 45, c_white, 0.6 * weapon_standalone_alpha * ui_alpha);
        gpu_set_fog(false, c_black, 0, 0);
	}
	
	counter ++;
}

counter = 0;

// Player Stamina
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
if (tutourial) && (!iscutscene){
	var tut_count = array_length_1d(tutourial_text);
	
	if (tutourial_stage_timer != -1){
		if (tutourial_stage_timer > 0){
			tutourial_stage_timer --;
		}else{
			tutourial_stage_timer = -1;
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
		}
	}
	
	if (global.cutscene_current == -1){
		tutourial_scale = approach(tutourial_scale, 1, 7);
		tutourial_scale_draw = tutourial_scale;
		
		tutourial_stage_draw = tutourial_stage;
	}
	
	var tscale = tutourial_scale_draw;
	var tstage = min(tutourial_stage_draw, tut_count - 1);
	
	draw_set_font(fnt_cambria_2);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	
	var stwidth = string_width(tutourial_text[tstage]);
	var toffset = -(stwidth / 2) - ((stwidth / 2) * (tscale - 1));
	
	draw_set_alpha(tutourial_alpha);
	scr_text_transformed((dwidth / 2) + toffset, (dheight - 160), tutourial_text[tstage], c_white, tscale, tscale, 0);
	
	draw_set_alpha((tscale - 1) * 1.5 * tutourial_alpha);
	scr_text_transformed((dwidth / 2) + toffset, (dheight - 160), tutourial_text[tstage], c_maroon, tscale, tscale, 0);
	
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

// Objective Display
if (levelcur != Level.CityHeadquarters) && (!scr_level_is_peaceful(room)){
	var text = "";
	var textx = 40;
	var texty = dheight - 50;
	
	if (global.game_objective_complete){
		text = "Objective completed. ";
		
		if (levelcur == Level.Prologue){
			text += "Return to the house.";
		}else{
			text += "Proceed to the next area.";
		}
	}else{
		text = global.objective_name[global.game_objective_current];
		text = string_replace(text, "^", global.objective_counter_max[global.game_objective_current] - global.objective_counter[global.game_objective_current]);
	}
	
	var redglow = wave(0.125, 0.225, 2, 0);
	var redglowalpha;
	objective_scale = approach(objective_scale, 1, 15);
	
	draw_set_alpha(1);
	
	draw_set_font(fnt_cambria_1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	
	if (objective_scale > 1.01){
		scr_text_transformed(textx, texty, text, c_white, objective_scale, objective_scale, 0);
	}else{
		scr_text(textx, texty, text, c_white);
	}
	
	redglowalpha = redglow + ((objective_scale - 1) / 0.25);
	
	if (redglowalpha > 0){
		draw_set_alpha(redglowalpha);
	
		if (objective_scale > 1.01){
			scr_text_transformed(textx, texty, text, c_maroon, objective_scale, objective_scale, 0);
		}else{
			scr_text(textx, texty, text, c_maroon);
		}
	
		draw_set_valign(fa_top);
	}
}

/* Weapon Info
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
	var gapwidth = 80;
	
	draw_set_alpha(weaponinfo_yoff / weaponinfo_yoff_max);
	draw_set_font(fnt_cambria_2);
	draw_set_halign(fa_center);
	scr_text(dwidth / 2, dheight - 110 + weaponinfo_yoff, wname, c_white);
	
	draw_set_font(fnt_cambria_n1);
	
	if (wtype == WeaponType.Ranged || wtype == WeaponType.Throwing){
		var wcontent_str = (wtype == WeaponType.Ranged)
		? "AMMO: " + string(weaponinfo_ammo) + "/" + string(global.weapon_ammomax[weaponinfo_index])
		: "QUANTITY: x" + string(weaponinfo_quantity);
		var wcontent_col = c_white;
		
		draw_set_halign(fa_center);
		scr_text((dwidth / 2), dheight - 76 + weaponinfo_yoff, "SPEED: " + scr_weapon_get_level_string(wspeed), c_white);
		
		draw_set_halign(fa_right);
		scr_text((dwidth / 2) - gapwidth, dheight - 76 + weaponinfo_yoff, "DAMAGE: " + scr_weapon_get_level_string(wdamage), c_white);
		
		if (wtype == WeaponType.Ranged && weaponinfo_ammo <= 0){
			wcontent_col = c_red;
		}
		
		draw_set_halign(fa_left);
		scr_text((dwidth / 2) + gapwidth, dheight - 76 + weaponinfo_yoff, wcontent_str, wcontent_col);
	}else{
		draw_set_halign(fa_right);
		scr_text((dwidth / 2) - (gapwidth * 0.2), dheight - 76 + weaponinfo_yoff, "SPEED: " + scr_weapon_get_level_string(wspeed), c_white);
		
		draw_set_halign(fa_left);
		scr_text((dwidth / 2) + (gapwidth * 0.2), dheight - 76 + weaponinfo_yoff, "DAMAGE: " + scr_weapon_get_level_string(wdamage), c_white);
	}
	
	draw_set_alpha(1);
}*/

// Weapon Ammo
draw_set_valign(fa_top);

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
				scr_text(xx, yy, "x" + string(quantity), col);
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
					scr_text(dwidth / 2, noammoy, "NO AMMO", c_red);
					draw_set_font(fnt_cambria_0);
					scr_text(dwidth / 2, noammoy + 30, scr_mousecheck_string(global.game_option[| Options.Input_Throw]) + " TO THROW", c_red);
					// ^^^ Could this suggest to the player that there is no way of retrieving ammo back?
				}
			}else{
				if (global.weapon_slot_standalone_ammo <= 0){
					draw_set_font(fnt_cambria_2);
					draw_set_halign(fa_center);
					scr_text(dwidth / 2, noammoy, "NO AMMO", c_red);
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
							scr_text_transformed(xx, yy, string(ammo) + "/" + string(maxammo), col, weaponammo_scale, weaponammo_scale, 0);
						}else{
							scr_text(xx, yy, string(ammo) + "/" + string(maxammo), col);
						}
						break;
					
					case AmmoType.Fuel:
						if (weaponammo_scale > 1.01){
							scr_text_transformed(xx, yy, string(ammo) + " fuel", col, weaponammo_scale, weaponammo_scale, 0);
						}else{
							scr_text(xx, yy, string(ammo) + " fuel", col);
						}
						break;
					
					case AmmoType.Explosives:
						if (weaponammo_scale > 1.01){
							scr_text_transformed(xx, yy, string(ammo) + " explosives", col, weaponammo_scale, weaponammo_scale, 0);
						}else{
							scr_text(xx, yy, string(ammo) + " explosives", col);
						}
						break;
					
					case AmmoType.Arrows:
						if (weaponammo_scale > 1.01){
							scr_text_transformed(xx, yy, string(ammo) + " arrows", col, weaponammo_scale, weaponammo_scale, 0);
						}else{
							scr_text(xx, yy, string(ammo) + " arrows", col);
						}
						break;
					
					case AmmoType.Darts:
						if (weaponammo_scale > 1.01){
							scr_text_transformed(xx, yy, string(ammo) + " darts", col, weaponammo_scale, weaponammo_scale, 0);
						}else{
							scr_text(xx, yy, string(ammo) + " darts", col);
						}
						break;
					
					case AmmoType.Shells:
						if (weaponammo_scale > 1.01){
							scr_text_transformed(xx, yy, string(ammo) + "/" + string(maxammo) + " shells", col, weaponammo_scale, weaponammo_scale, 0);
						}else{
							scr_text(xx, yy, string(ammo) + "/" + string(maxammo) + " shells", col);
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
var str = string(scr_seconds_to_timer(global.game_save_seconds));

if (!drawammo){
	stats_y = approach(stats_y, 48, 30);
}else{
	stats_y = approach(stats_y, 72, 30);
}

draw_set_alpha(1);
draw_set_font(fnt_cambria_n1);
draw_set_halign(fa_left);
scr_text(136, stats_y, str, c_white);

// Boss Health
bosshealth_width_to = 500 / global.game_option[| Options.UIScale];

if (!global.game_pause){
	if (global.boss_current != -1) && (global.boss_current != Boss.SniperRobot) && (global.boss_current != Boss.MotherRobot) && (!iscutscene) && (blackbar_sizereal <= 40){
		bosshealth_width_current = approach(bosshealth_width_current, bosshealth_width_to, 5);
	}else if (!iscutscene){
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
	
	draw_healthbar(xx - (w / 2), yy - (h / 2), xx + (w / 2), yy + (h / 2), floor((bosshealth_value_current / bosshealth_value_max) * 100), make_colour_rgb(38, 38, 38), c_ltgray, c_ltgray, 0, true, false);
	
	draw_set_alpha(bosshealth_flash * 0.3);
	draw_set_colour(c_ltgray);
	draw_rectangle(xx - (w / 2), yy - (h / 2), xx + (w / 2), yy + (h / 2), false);
	draw_set_alpha(1);
}

bosshealth_value_previous = bosshealth_value_current;

// Header Display
if (header_display_alpha > 0){
	draw_set_font(fnt_cambria_1);
	var subtwidth = string_width(header_display_subtext);
	
	draw_set_font(fnt_cambria_3);
	var twidth = string_width(header_display_text);
	
	var line_width_to = max(twidth, subtwidth) + 30;
	header_display_line_width = approach(header_display_line_width, line_width_to, 5);
	
	draw_set_alpha(header_display_alpha * (header_display_line_width / line_width_to));
	draw_set_halign(fa_center);
	scr_text(dwidth / 2, 218 + ((1 - (header_display_line_width / line_width_to)) * 30), header_display_text, c_white);
	
	draw_rectangle((dwidth / 2) - (header_display_line_width / 2), 254, (dwidth / 2) + (header_display_line_width / 2), 255, false);
	
	draw_set_font(fnt_cambria_1);
	scr_text(dwidth / 2, 259, header_display_subtext, c_white);
	
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
		scr_text((dwidth / 2), yy - ((1 - checkpoint_text_alpha) * 30), "Checkpoint Reached", c_white);
	}else{
		scr_text((dwidth / 2), yy, "Checkpoint Reached", c_white);
	}
	
	//var line_width_to = string_width("Checkpoint Reached") + 30;
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
	
	draw_set_font(fnt_cambria_1);
	draw_set_halign(fa_right);
	draw_set_valign(fa_middle);
	draw_set_alpha(0.8);
	
	scr_text(dwidth - control_indicate_x, dheight - 50, control_indicate_text + " " + buttonstr, c_white);
	
	draw_set_valign(fa_top);
}

control_indicate = false;

// Minimap
if (global.game_option[| Options.ShowMinimap]){
	var mapx = (dwidth - minimap_x) - minimap_width;
	var mapy = minimap_y;

	var mapwidth = obj_controller_gameplay.map_width;
	var mapheight = obj_controller_gameplay.map_height;

	var maptilewidth = obj_controller_gameplay.map_tile_width;
	var maptileheight = obj_controller_gameplay.map_tile_height;

	var mapdrawtilew = 4;
	var mapdrawtileh = 4;

	var mapdrawoffx = global.player_position_x / maptilewidth; mapdrawoffx -= (minimap_width / 2) / mapdrawtilew;
	var mapdrawoffy = global.player_position_y / maptileheight; mapdrawoffy -= (minimap_height / 2) / mapdrawtileh;

	var maptilesprite;

	maptilesprite[0] = spr_ui_minimap_tile_0;
	maptilesprite[1] = spr_ui_minimap_tile_1;
	maptilesprite[2] = spr_ui_minimap_tile_2;
	maptilesprite[3] = spr_ui_minimap_tile_3;

	var map_objects, map_objects_sprite, map_objects_sprite_screenlock, map_objects_count;

	map_objects[0] = obj_collectable_pickup;
	map_objects_sprite[0] = spr_collectable_0;
	map_objects_sprite_screenlock[0] = false;

	map_objects[1] = obj_upgrade_pickup;
	map_objects_sprite[1] = spr_upgrade_0;
	map_objects_sprite_screenlock[1] = false;

	var compcount = array_length_1d(global.companion);
	map_objects_count = array_length_1d(map_objects);

	for(var o = 0; o < compcount; o ++){
		map_objects[o + map_objects_count] = global.companion[o];
		map_objects_sprite[o + map_objects_count] = global.companion_mapicon[o];
		map_objects_sprite_screenlock[o + map_objects_count] = false;
	}
	
	map_objects_count = array_length_1d(map_objects) - 1;

	map_objects[map_objects_count + 1] = obj_player;
	map_objects_sprite[map_objects_count + 1] = spr_player_head_0_minimap;
	map_objects_sprite_screenlock[map_objects_count + 1] = false;

	map_objects[map_objects_count + 2] = obj_pawn_other_prisoner_0;
	map_objects_sprite[map_objects_count + 2] = spr_prisoner_head_0_minimap;
	map_objects_sprite_screenlock[map_objects_count + 2] = false;
	
	map_objects[map_objects_count + 3] = obj_townperson_0;
	map_objects_sprite[map_objects_count + 3] = spr_townperson_0_head_0_minimap;
	map_objects_sprite_screenlock[map_objects_count + 3] = false;
	
	map_objects[map_objects_count + 4] = obj_townperson_1;
	map_objects_sprite[map_objects_count + 4] = spr_townperson_1_head_0_minimap;
	map_objects_sprite_screenlock[map_objects_count + 4] = false;
	
	map_objects[map_objects_count + 5] = obj_townperson_2;
	map_objects_sprite[map_objects_count + 5] = spr_townperson_2_head_0_minimap;
	map_objects_sprite_screenlock[map_objects_count + 5] = false;
	
	map_objects[map_objects_count + 6] = obj_townperson_3;
	map_objects_sprite[map_objects_count + 6] = spr_townperson_3_head_0_minimap;
	map_objects_sprite_screenlock[map_objects_count + 6] = false;
	
	map_objects[map_objects_count + 7] = obj_townperson_4;
	map_objects_sprite[map_objects_count + 7] = spr_townperson_4_head_0_minimap;
	map_objects_sprite_screenlock[map_objects_count + 7] = false;
	
	map_objects[map_objects_count + 8] = obj_townperson_5;
	map_objects_sprite[map_objects_count + 8] = spr_townperson_5_head_0_minimap;
	map_objects_sprite_screenlock[map_objects_count + 8] = false;
	
	map_objects[map_objects_count + 9] = obj_townperson_6;
	map_objects_sprite[map_objects_count + 9] = spr_townperson_6_head_0_minimap;
	map_objects_sprite_screenlock[map_objects_count + 9] = false;
	
	map_objects[map_objects_count + 10] = obj_townchild_0;
	map_objects_sprite[map_objects_count + 10] = spr_townchild_0_head_0_minimap;
	map_objects_sprite_screenlock[map_objects_count + 10] = false;
	
	map_objects[map_objects_count + 11] = obj_player_wife_0;
	map_objects_sprite[map_objects_count + 11] = spr_player_wife_head_0_minimap;
	map_objects_sprite_screenlock[map_objects_count + 11] = false;
	
	map_objects[map_objects_count + 12] = obj_player_child_0;
	map_objects_sprite[map_objects_count + 12] = spr_player_child_0_head_0_minimap;
	map_objects_sprite_screenlock[map_objects_count + 12] = false;
	
	if (global.game_objective_complete){
		map_objects[map_objects_count + 13] = obj_section_end_pointer;
		map_objects_sprite[map_objects_count + 13] = spr_ui_arrow;
		map_objects_sprite_screenlock[map_objects_count + 13] = true;
	}

	map_objects_count = array_length_1d(map_objects);

	mapdrawoffx = clamp(mapdrawoffx, 0, mapwidth - (minimap_width div mapdrawtilew));
	mapdrawoffy = clamp(mapdrawoffy, 0, mapheight - (minimap_height div mapdrawtileh));

	draw_set_alpha(1);
	draw_sprite(spr_ui_minimap_border_0, 0, mapx - 2, mapy - 2);

	for(var yy = 0; yy < minimap_height; yy += mapdrawtileh){
		for(var xx = 0; xx < minimap_width; xx += mapdrawtilew){
			var col;
			var tilex = xx div mapdrawtilew; tilex += mapdrawoffx;
			var tiley = yy div mapdrawtileh; tiley += mapdrawoffy;
		
			if (tilex < 0 || tiley < 0 || tilex >= mapwidth || tiley >= mapheight){
				continue;
			}
		
			var tile = obj_controller_gameplay.map[tilex, tiley];
		
			if (tile != -1){
				draw_sprite(maptilesprite[tile], 0, mapx + xx, mapy + yy);
			}
		}
	}

	for(var o = 0; o < map_objects_count; o ++){
		if (instance_exists(map_objects[o])){
			var icount = instance_number(map_objects[o]);
		
			for(var i = 0; i < icount; i ++){
				var inst = instance_find(map_objects[o], i), draw = false;
				var spr = map_objects_sprite[o];
				var tx = inst.x div maptilewidth;
				var ty = (inst.y + 6) div maptileheight;
			
				if (tx < 0 || ty < 0 || tx >= mapwidth || ty >= mapheight){
					continue;
				}
				
				if (map_objects[o] == obj_player_child_0){
					if (inst.type == 1){
						spr = spr_player_child_1_head_0_minimap;
					}
				}
			
				var dx = mapx - (mapdrawoffx * mapdrawtilew) + ((inst.x / room_width) * mapwidth * mapdrawtilew);
				var dy = mapy - (mapdrawoffy * mapdrawtileh) + (((inst.y + 6) / room_height) * mapheight * mapdrawtileh);
				var dangle = 0;
			
				if (map_objects_sprite_screenlock[o]){
					var margin = 10;
					draw = true;
				
					dx = clamp(dx, mapx + margin, mapx + minimap_width - margin);
					dy = clamp(dy, mapy + margin, mapy + minimap_height - margin);
				
					if (map_objects[o] == obj_section_end_pointer){
						var loff = dsin(minimap_arrow_sine) * 5;
						dangle = inst.image_angle;
					
						dx += lengthdir_x(loff - 10, dangle);
						dy += lengthdir_y(loff - 10, dangle);
					}
				}else{
					if (dx >= mapx && dy >= mapy && dx <= mapx + minimap_width && dy <= mapy + minimap_height){
						draw = true;
					}
				}
			
				if (draw){
					if (dangle == 0){
						draw_sprite(spr, 0, dx, dy);
					}else{
						draw_sprite_ext(spr, 0, dx, dy, 1, 1, dangle, c_white, 1);
					}
				}
			}
		}
	}

	draw_sprite(spr_ui_minimap_border_overlay_0, 0, mapx - 2, mapy - 2);
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
	scr_text(xx, yy - 80, "GAME PAUSED", c_white);
	
	draw_set_font(fnt_cambria_2);
	
	var selected_set = pause_has_selected;
	
	if (iskeyboard){
		pause_selected = -1;
	}
	
	repeat(pause_selectedmax){
		var opty = yy + (counter * offset);
		
		if (!selected_set) && (!obj_controller_all.warning_prompt){
			if (iskeyboard){
				if (point_in_rectangle(mousex, mousey, xx - 80, opty - 16, xx + 80, opty + 16)){
					pause_selected = counter;
					selected_set = true;
				}
			}
		}
		
		if (pause_selected == counter){
			pause_selectoption_scale[counter] = approach(pause_selectoption_scale[counter], 1.1, 40);
			scr_text_transformed(xx, opty, pause_selectoption[counter], make_colour_rgb(189, 23, 23), pause_selectoption_scale[counter], pause_selectoption_scale[counter], 0);
		}else{
			pause_selectoption_scale[counter] = approach(pause_selectoption_scale[counter], 1, 40);
			scr_text_transformed(xx, opty, pause_selectoption[counter], c_white, pause_selectoption_scale[counter], pause_selectoption_scale[counter], 0);
		}
		
		counter ++;
	}
	
	draw_set_valign(fa_top);
	counter = 0;
}

if (!pause_text_update){
	if (global.game_pause) || (iscutscene){
		pause_text_update = true;
	}
}

// Pause Dialogue
var optint = 48;
var optxx = dwidth / 2;
var optyy = (dheight / 2) - ((optint * pausedialogue_option_max) / 2);

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
	draw_set_font(fnt_cambria_1);
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	if (iskeyboard){
		pausedialogue_option_selected = -1;
	}
	
	switch(pausedialogue_type){
		case 0:
			draw_text_ext(dwidth / 2, optyy, pausedialogue_type_text, -1, 660);
			optyy += string_height(pausedialogue_type_text) + 54;
			break;
		
		case 1:
			draw_set_font(fnt_cambria_2);
			scr_text(dwidth / 2, optyy, pausedialogue_type_text, c_white);
			
			optyy += string_height(pausedialogue_type_text) + 20;
			
			draw_set_font(fnt_cambria_1);
			
			for(var counter = 0; counter < pausedialogue_option_max; counter ++){
				var optrealy = optyy + (counter * optint);
				vslot ++;
				
				if (!selected_set) && (!obj_controller_all.warning_prompt){
					if (iskeyboard){
						if (point_in_rectangle(mousex, mousey, optxx - 80, optrealy - 16, optxx + 80, optrealy + 16)){
							pausedialogue_option_selected = counter;
							selected_set = true;
						}
					}
				}
				
				if (pausedialogue_option_selected == counter){
					pausedialogue_type_option_scale[counter] = approach(pausedialogue_type_option_scale[counter], 1.1, 40);
					scr_text_transformed(optxx, optrealy, pausedialogue_type_option[counter], make_colour_rgb(189, 23, 23), pausedialogue_type_option_scale[counter], pausedialogue_type_option_scale[counter], 0);
				}else{
					pausedialogue_type_option_scale[counter] = approach(pausedialogue_type_option_scale[counter], 1, 40);
					scr_text_transformed(optxx, optrealy, pausedialogue_type_option[counter], c_white, pausedialogue_type_option_scale[counter], pausedialogue_type_option_scale[counter], 0);
				}
			}
			
			break;
	}
	
	var exity = optyy + (vslot * optint);
	
	if (!selected_set) && (!obj_controller_all.warning_prompt){
		if (iskeyboard){
			if (point_in_rectangle(mousex, mousey, optxx - 80, exity - 16, optxx + 80, exity + 16)){
				pausedialogue_option_selected = counter;
				selected_set = true;
			}
		}
	}
	
	if (pausedialogue_option_selected == counter){
		pausedialogue_option_exitscale = approach(pausedialogue_option_exitscale, 1.1, 40);
		scr_text_transformed(optxx, exity, pausedialogue_option_exittext, make_colour_rgb(189, 23, 23), pausedialogue_option_exitscale, pausedialogue_option_exitscale, 0);
	}else{
		pausedialogue_option_exitscale = approach(pausedialogue_option_exitscale, 1, 40);
		scr_text_transformed(optxx, exity, pausedialogue_option_exittext, c_white, pausedialogue_option_exitscale, pausedialogue_option_exitscale, 0);
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
if (levelcur == Level.Prologue){
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
		scr_text(dwidth / 2, dheight / 2, text, c_white);
	}
}

// Teaser Ending
if (iskeyboard){
	teaserend_button_selected = -1;
}

if (teaserend){
	draw_set_alpha(teaserend_alpha * 0.2);
	draw_set_colour(c_black);
	draw_rectangle(0, 0, dwidth, dheight, false);
	
	draw_set_font(fnt_cambria_6);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(teaserend_text_alpha);
	scr_text(dwidth / 2, (dheight / 2) - 214, "MANIC", c_white);
	
	draw_set_font(fnt_cambria_1);
	scr_text(dwidth / 2, (dheight / 2) - 179, "A GAME BY GETA", c_white);
	
	draw_set_font(fnt_cambria_1);
	
	for(var b = 0; b < teaserend_button_selected_max; b ++){
		var bx = dwidth / 2;
		var by = (dheight / 2) - 65 + (48 * b);
		var bcol = c_white;
		
		if (iskeyboard){
			if (point_in_rectangle(mousex, mousey, bx - 80, by - 16, bx + 80, by + 16)){
				teaserend_button_selected = b;
			}
		}
		
		if (teaserend_button_selected == b){
			teaserend_button_scale[b] = approach(teaserend_button_scale[b], 1.1, 40);
			bcol = make_colour_rgb(189, 23, 23);
		}else{
			teaserend_button_scale[b] = approach(teaserend_button_scale[b], 1, 40);
		}
		
		scr_text_transformed(bx, by, teaserend_button[b], bcol, teaserend_button_scale[b], teaserend_button_scale[b], 0);
	}
	
	scr_text(dwidth / 2, (dheight / 2) - 65 + (48 * (teaserend_button_selected_max + 1)), "Thanks for playing!", c_white);
	
	draw_set_valign(fa_top);
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
	scr_text(dwidth / 2, dheight / 2, "MANIC", c_white);
	
	draw_set_font(fnt_cambria_3);
	draw_set_alpha(ending_credits_text_alpha);
	scr_text(dwidth / 2, (dheight / 2) - 190, "A GAME BY GETA", c_white);
	
	draw_set_font(fnt_cambria_2);
	scr_text(dwidth / 2, (dheight / 2) - 125, "Programming, artwork and game design by Harry White", c_white);
	scr_text(dwidth / 2, (dheight / 2) - 75, "Music created by Frank Albrecht", c_white);
	scr_text(dwidth / 2, (dheight / 2) - 25, "Sound effects created by Frank Albrecht and Kare Abrahamsen", c_white);
	scr_text(dwidth / 2, (dheight / 2) + 25, "Art assistance for character design from James Lynch", c_white);
	scr_text(dwidth / 2, (dheight / 2) + 75, "Programming assistance from Grayson Sutherlin and Sam Hollins", c_white);
	scr_text(dwidth / 2, (dheight / 2) + 125, "Thank you for playing!", c_white);
	
	var cont_text = "Press " + (!iskeyboard ? scr_input_get_name(InputBinding.Interact) : scr_input_get_name(InputBinding.Attack)) + " to return to titlescreen"
	
	scr_text(dwidth / 2, (dheight / 2) + 190, cont_text, c_white);
	
	draw_set_valign(fa_top);
}

draw_set_alpha(1);