// Drawing Shadow
draw_set_color(c_black);
draw_set_alpha(0.24);
draw_ellipse(x - 10, y + 23, x + 9, y + 28, false);
draw_set_alpha(1);

// Drawing Arm
var wcurrent = global.weapon_slot[global.weapon_slotcurrent];
var angle;

if (global.weapon_slot_standalone != -1){
	wcurrent = global.weapon_slot_standalone;
}

if (wcurrent != -1) && (instance_exists(obj_player_arm)) && (state != scr_player_dash){
    if (global.weapon_heavy[wcurrent]) && (global.cutscene_current == -1) && (move_xTo == -1) && (move_yTo == -1){
        if (obj_player_arm.image_yscale = -1){
            angle = clamp(obj_player_arm.image_angle, 130, 220);
        }else{
            if (obj_player_arm.image_angle > 0) && (obj_player_arm.image_angle < 90){
                angle = min(obj_player_arm.image_angle, 50);
            }else{
                angle = max(obj_player_arm.image_angle, 320);
            }
        }

        draw_sprite_ext(spr_player_arm, 1, obj_player_arm.x + lengthdir_x(4, angle), (obj_player_arm.y - 1)+lengthdir_y(4, angle), 1, obj_player_arm.image_yscale, angle, c_white, 1);
        
        if (global.player_healthCurrent <= 2){
            gpu_set_fog(true, make_colour_rgb(117, 39, 39), 0, 0);
            draw_sprite_ext(spr_player_arm, 1, obj_player_arm.x + lengthdir_x(4, angle), (obj_player_arm.y - 1)+lengthdir_y(4, angle), 1, obj_player_arm.image_yscale, angle, c_white, wave(0.15, 0.25, 2, 0));
            gpu_set_fog(false, c_black, 0, 0);
        }
		
		if (global.player.burn){
			gpu_set_fog(true, c_white, 0, 0);
			draw_sprite_ext(spr_player_arm, 1, obj_player_arm.x + lengthdir_x(4, angle), (obj_player_arm.y - 1)+lengthdir_y(4, angle), 1, obj_player_arm.image_yscale, angle, c_white, 0.125);
			gpu_set_fog(false, c_black, 0, 0);
		}
		
		if (global.player.poison){
			gpu_set_fog(true, c_white, 0, 0);
			draw_sprite_ext(spr_player_arm, 1, obj_player_arm.x + lengthdir_x(4, angle), (obj_player_arm.y - 1)+lengthdir_y(4, angle), 1, obj_player_arm.image_yscale, angle, c_white, 0.1);
			gpu_set_fog(false, c_black, 0, 0);
		}
    }
}