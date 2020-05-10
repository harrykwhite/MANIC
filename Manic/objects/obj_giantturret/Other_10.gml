draw_self();
scr_draw_attributes_pawn();

if (instance_exists(obj_player)){
	shoot_dir = point_direction(x, y, obj_player.x, obj_player.y);
}

draw_sprite_ext(spr_giantturret_gun_0, 0, x, y, image_xscale, image_yscale, shoot_dir, c_white, 1);