// Variables
var counter = 0;
var mousex = scr_world_to_screen_x(obj_controller_mouse.x);
var mousey = scr_world_to_screen_y(obj_controller_mouse.y);
var dwidth = display_get_gui_width();
var dheight = display_get_gui_height();

// Player goggle effect
if (instance_exists(obj_player)){
	if (scr_player_has_upgrade(PlayerUpgrade.Goggles)){
		var enemycount = instance_number(obj_p_enemy);
		
		gpu_set_fog(true, c_red, 0, 0);
		for(var i = 0; i < enemycount; i ++){
			var inst = instance_find(obj_p_enemy, i);
			var alpha = 0.35;
			
			alpha *= (point_distance(inst.x, inst.y, obj_player.x, obj_player.y) / 400);
			
			var xx = (inst.x - camera_get_view_x(view_camera[0])) * gui_scale_x;
			var yy = (inst.y - camera_get_view_y(view_camera[0])) * gui_scale_y;
			
			with(inst){
				draw_sprite_ext(sprite_index, image_index, xx, yy, image_xscale * gui_scale_x, image_yscale * gui_scale_y, image_angle, c_white, alpha * image_alpha);
			}
		}
		
		gpu_set_fog(false, c_black, 0, 0);
	}
}

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
        }else if (global.level_current != Level.Prologue){
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
				}
				
				if (!tutourial_stage_pickupmelee_cseen){
					var cutsceneblock = inst_1A5669D2;
				
					instance_activate_object(cutsceneblock);
					instance_destroy(cutsceneblock);
				
					global.cutscene_current = 40;
					obj_controller_gameplay.cutscene_look_x = 1702;
					obj_controller_gameplay.cutscene_look_y = 505;
					obj_controller_gameplay.cutscene_look_time = 70;
					obj_controller_gameplay.cutscene_look_prop = false;
					obj_controller_gameplay.cutscene_look_object = noone;
				}
			}
			
			tutourial_stage_timer = -1;
		}
	}
	
	var scalem = wave(1, 1.025, 3.5, 0);
	tutourial_scale = approach(tutourial_scale, 1, 15);
	
	var tstage = min(tutourial_stage, tut_count - 1);
	
	draw_set_font(fnt_cambria_2);
	draw_set_halign(fa_center);
	draw_set_alpha(tutourial_alpha);
	scr_text_shadow_transformed(dwidth / 2, dheight - 160, tutourial_text[tstage], c_white, tutourial_scale * scalem, tutourial_scale * scalem, 0);
	
	draw_set_alpha(((tutourial_scale * scalem) - 1) * 3 * tutourial_alpha);
	scr_text_shadow_transformed(dwidth / 2, dheight - 160, tutourial_text[tstage], c_maroon, tutourial_scale * scalem, tutourial_scale * scalem, 0);
	draw_set_alpha(1);
	
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
if (global.level_current != Level.CityHeadquarters){
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

//// Score Display
//var length = 7;
//var shake = wave(-score_shake, score_shake, 0.2, 0);

//draw_set_alpha(1);
//draw_set_font(fnt_cambria_2);
//draw_set_halign(fa_left);
//scr_text_shadow_transformed(58 + shake, (dheight - 63) + shake, string(score_current) + "pts", c_white, (score_scale * 1.35), (score_scale * 1.35), 0);

//// Score Text Display
//if (score_text_time > 0){
//	score_text_time--;
	
//	if (score_text_alpha < 1){
//		score_text_alpha += 0.1;
//	}
	
//	if (score_text_offset > 0){
//		score_text_offset -= 0.25;
//	}
//}else{
	
//	if (score_text_alpha > 0){
//		score_text_alpha -= 0.1;
//	}
	
//	if (score_text_offset > -12){
//		score_text_offset -= 0.25;
//	}
//}

//if (score_text_alpha > 0){
//	draw_set_alpha(score_text_alpha);
//	draw_set_font(fnt_cambria_2);
//	scr_text_shadow_transformed(59 + shake, ((dheight - 32) + shake) + score_text_offset, string(score_text), c_white, (score_scale * 0.65), (score_scale * 0.65), 0);
//	draw_set_valign(fa_top);
//}

// Weapon Ammo
var w = global.weapon_slot[global.weapon_slotcurrent];
var drawammo = false;

if (global.weapon_slot_standalone != -1){
	w = global.weapon_slot_standalone;
}

if (instance_exists(obj_player)){
	repeat(2){
		if (global.weapon_slot[counter] != -1){
			if (global.weapon_type[global.weapon_slot[counter]] == WeaponType.Throwing){
				var xx = 51, yy = (74 * (counter + 1)) + 12;
				var col = c_white;
				var quantity = ceil(global.weapon_quantity[global.weapon_slot[counter]]);
				
				draw_set_halign(fa_left);
				draw_set_font(fnt_cambria_0);
				draw_set_alpha(ui_alpha);
				scr_text_shadow_transformed(xx, yy, "x" + string(quantity), col, weaponammo_scale, weaponammo_scale, 0);
			}
		}
		
		counter ++;
	}
	
	counter = 0;
	
    if (w != -1){
		if (instance_exists(global.weapon_object[w])){
	        if (global.weapon_type[w] == WeaponType.Ranged){
	            var xx = 131 + weaponammo_x;
	            var yy = 78 - 33;
	            var col = c_white;
				
	            var ammo = global.weapon_slotammo[global.weapon_slotcurrent];
	            var maxammo = global.weapon_ammomax[global.weapon_slot[global.weapon_slotcurrent]];
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
						scr_text_shadow_transformed(xx, yy, string(ammo) + "/" + string(maxammo), col, weaponammo_scale, weaponammo_scale, 0);
						break;
					
					case AmmoType.Fuel:
						scr_text_shadow_transformed(xx, yy, string(ammo) + " fuel", col, weaponammo_scale, weaponammo_scale, 0);
						break;
					
					case AmmoType.Explosives:
						scr_text_shadow_transformed(xx, yy, string(ammo) + " explosives", col, weaponammo_scale, weaponammo_scale, 0);
						break;
					
					case AmmoType.Arrows:
						scr_text_shadow_transformed(xx, yy, string(ammo) + " arrows", col, weaponammo_scale, weaponammo_scale, 0);
						break;
					
					case AmmoType.Darts:
						scr_text_shadow_transformed(xx, yy, string(ammo) + " darts", col, weaponammo_scale, weaponammo_scale, 0);
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
	var yy = dheight - 50;
	var w = bosshealth_width_current;
	var h = 12;
	
	draw_healthbar(xx - (w / 2), yy - (h / 2), xx + (w / 2), yy + (h / 2), floor((bosshealth_value_current / bosshealth_value_max) * 100), make_color_rgb(45, 45, 45), c_ltgray, c_ltgray, 0, true, false);
	
	draw_set_alpha(bosshealth_flash * 0.3);
	draw_set_colour(c_ltgray);
	draw_rectangle(xx - (w / 2), yy - (h / 2), xx + (w / 2), yy + (h / 2), false);
	draw_set_alpha(1);
}

bosshealth_value_previous = bosshealth_value_current;

// Upgrade Indication
if (upgrade_indicate_time > 0){
	upgrade_indicate_time --;
	if (upgrade_indicate_alpha < 1){
		upgrade_indicate_alpha += 0.05;
	}
}else{
	if (upgrade_indicate_alpha > 0){
		upgrade_indicate_alpha -= 0.05;
	}
}

if (upgrade_indicate_alpha > 0){
	draw_set_alpha(upgrade_indicate_alpha);
	
	draw_set_halign(fa_center);
	draw_set_font(fnt_cambria_3);
	scr_text_shadow(dwidth / 2, dheight - 249, global.upgrade_name[upgrade_indicate_index], c_white);
	draw_set_font(fnt_cambria_1);
	scr_text_shadow(dwidth / 2, dheight - 220, global.upgrade_description[upgrade_indicate_index], c_white);
	
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
	var buttonstr = scr_keycheck_string(obj_controller_all.key_interact);
	
	draw_set_font(fnt_cambria_1);
	draw_set_halign(fa_right);
	draw_set_alpha(0.8);
	scr_text_shadow(dwidth - control_indicate_x, dheight - 64, control_indicate_text + " [" + buttonstr + "]", c_white);
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
	draw_set_alpha((pause_text_alpha + (pausedialogue_alpha * 0.8)) * 0.35);
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
	pause_selected = -1;
	
	repeat(pause_selectedmax){
		var opty = yy + (counter * offset);
		
		if (!selected_set){
			if (point_in_rectangle(mousex, mousey, xx - 80, opty - 16, xx + 80, opty + 16)){
				pause_selected = counter;
				selected_set = true;
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
		pausedialogue_alpha += 0.05;
	}
}else{
	if (pausedialogue_alpha > 0){
		pausedialogue_alpha -= 0.05;
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
			scr_text_shadow(dwidth / 2, dheight / 2, pausedialogue_type_text, c_white);
			vslot = 1;
			break;
	
		case 1:
			optyy += string_height(pausedialogue_type_text) + 20;
			scr_text_shadow(dwidth / 2, (dheight / 2) - 30, pausedialogue_type_text, c_white);
			
			pausedialogue_option_selected = -1;
			
			for(var counter = 0; counter < pausedialogue_option_max; counter ++){
				var optrealy = optyy + (counter * 42);
				 vslot ++;
				
				if (!selected_set){
					if (point_in_rectangle(mousex, mousey, optxx - 80, optrealy - 16, optxx + 80, optrealy + 16)){
						pausedialogue_option_selected = counter;
						selected_set = true;
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
			draw_set_font(fnt_cambria_3);
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
	if (ending_back_time > 0){
		ending_back_time --;
	}else{
		if (ending_back_alpha < 1){
			ending_back_alpha += 0.0025;
		}
	}
	
	if (ending_logo_text_time > 0){
		ending_logo_text_time --;
		
		if (ending_logo_text_alpha < 1){
			ending_logo_text_alpha += 0.0025;
		}
	}else{
		if (ending_logo_text_alpha > 0){
			ending_logo_text_alpha -= 0.005;
		}else{
			if (ending_credits_text_alpha < 1){
				ending_credits_text_alpha += 0.005;
			}
		}
	}
	
	draw_set_alpha(ending_back_alpha);
	draw_set_colour(c_black);
	draw_rectangle(0, 0, dwidth, dheight, false);
	
	draw_set_font(fnt_cambria_6);
	draw_set_halign(fa_center);
	draw_set_alpha(ending_logo_text_alpha);
	scr_text_shadow(dwidth / 2, dheight / 2, "MANIC", c_white);
	
	draw_set_font(fnt_cambria_3);
	draw_set_halign(fa_center);
	draw_set_alpha(ending_credits_text_alpha);
	scr_text_shadow(dwidth / 2, (dheight / 2) - 200, "A GAME BY GETA", c_white);
	
	draw_set_font(fnt_cambria_2);
	scr_text_shadow(dwidth / 2, (dheight / 2) - 120, "Programming, artwork and game design by Harry White", c_white);
	scr_text_shadow(dwidth / 2, (dheight / 2) - 60, "Music and sound effects created by Frank Albrecht and Kare Abrahamsen", c_white);
	scr_text_shadow(dwidth / 2, (dheight / 2), "Art assistance for character design by Ulkenstride", c_white);
	scr_text_shadow(dwidth / 2, (dheight / 2) + 60, "Programming assistance from Gideon the Bard and Zyro", c_white);
	scr_text_shadow(dwidth / 2, (dheight / 2) + 120, "Thanks for playing!", c_white);
}

draw_set_alpha(1);