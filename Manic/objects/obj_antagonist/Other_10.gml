scr_pre_draw_attributes_pawn();
draw_self();

if (has_mask){
	var yoffset = 0;
	var img = floor(image_index);
	if (sprite_index == spr_antagonist_idle_0) || (sprite_index == spr_antagonist_idle_1) || (sprite_index == spr_antagonist_idle_2){
		if (img == 1){
			yoffset = 1;
		}
	}

	if (sprite_index == spr_antagonist_walk_0) || (sprite_index == spr_antagonist_walk_1) || (sprite_index == spr_antagonist_walk_2){
		if (img == 2) || (img == 4) || (img == 9) || (img == 11){
			yoffset = 1;
		}
	
		if (img == 3) || (img == 10){
			yoffset = 2;
		}
	}
	
	draw_sprite_ext(spr_antagonist_mask_0, 0, x, y + yoffset, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

scr_draw_attributes_pawn();