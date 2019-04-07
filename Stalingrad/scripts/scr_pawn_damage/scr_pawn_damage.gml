/// @param damage
/// @param knockback_speed
/// @param knockback_direction
/// @param invincibility_time
var dmg = argument0;
var kbs = argument1;
var kbd = argument2;
var it = argument3;

health_current -= dmg;
knockback_speed = kbs;
knockback_direction = kbd;
i_time = it;
i_blend_time = 5;
health_scale = 1.5;
health_flash = 1;

var corpse = noone;

if (health_current <= 0){
	switch(object_index){
		case obj_enemy_0:
			corpse = instance_create(x, y - 16, obj_enemy_corpse);
			if (type == EnemyOneType.Crazy){
				corpse.sprite_index = spr_enemy_0_brain_corpse_0;
			}
			
			if (type == EnemyOneType.Healer){
				corpse.sprite_index = spr_enemy_0_healer_corpse_0;
			}
			
			if (type == EnemyOneType.TrainBoss){
				corpse.sprite_index = spr_enemy_0_sniperboss_corpse_0;
			}
			
			if (type == EnemyOneType.Fly){
				corpse.sprite_index = spr_enemy_0_fly_corpse_0;
			}
			
			if (headless){
				corpse.sprite_index = spr_enemy_0_headless_corpse_0;
			}
			
			repeat(4){
				part_type_direction(global.pt_bodypart_0, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_type_sprite(global.pt_bodypart_0, spr_enemy_0_bodypart_0, false, false, true);
				part_particles_create(global.ps_bottom, x + random_range(-3, 3), y + random_range(-6, 6), global.pt_bodypart_0, 1);
			}
			break;
		
		case obj_enemy_1:
			repeat(4){
				part_type_direction(global.pt_bodypart_0, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_type_sprite(global.pt_bodypart_0, spr_enemy_1_bodypart_0, false, false, true);
				part_particles_create(global.ps_bottom, x + random_range(-3, 3), y + random_range(-6, 6), global.pt_bodypart_0, 1);
			}
			break;
		
		case obj_enemy_2:
			corpse = instance_create(x, y, obj_enemy_corpse);
			corpse.sprite_index = spr_enemy_2_corpse_0;
			
			if (headless){
				corpse.sprite_index = spr_enemy_2_headless_corpse_0;
			}
			
			repeat(4){
				part_type_direction(global.pt_bodypart_0, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_type_sprite(global.pt_bodypart_0, spr_enemy_2_bodypart_0, false, false, true);
				part_particles_create(global.ps_bottom, x + random_range(-3, 3), y + random_range(-6, 6), global.pt_bodypart_0, 1);
			}
			break;
		
		case obj_enemy_3:
			repeat(5){
				part_type_direction(global.pt_bodypart_0, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_type_sprite(global.pt_bodypart_0, spr_enemy_3_bodypart_0, false, false, true);
				part_particles_create(global.ps_bottom, x + random_range(-6, 6), y + random_range(-6, 6), global.pt_bodypart_0, 1);
			}
			break;
		
		case obj_thescorched:
			corpse = instance_create(x, y - 16, obj_enemy_corpse);
			corpse.sprite_index = spr_thescorched_corpse_0;
			
			repeat(7){
				part_type_direction(global.pt_bodypart_0, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_type_sprite(global.pt_bodypart_0, spr_thescorched_bodypart_0, false, false, true);
				part_particles_create(global.ps_bottom, x + random_range(-3, 3), y + random_range(-6, 6), global.pt_bodypart_0, 1);
			}
			break;
		
		case obj_thedogkeeper:
			corpse = instance_create(x, y - 16, obj_enemy_corpse);
			corpse.sprite_index = spr_thedogkeeper_corpse_0;
			
			repeat(7){
				part_type_direction(global.pt_bodypart_0, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_type_sprite(global.pt_bodypart_0, spr_thedogkeeper_bodypart_0, false, false, true);
				part_particles_create(global.ps_bottom, x + random_range(-3, 3), y + random_range(-6, 6), global.pt_bodypart_0, 1);
			}
			break;
		
		case obj_thedogkeeper_dog:
			corpse = instance_create(x, y, obj_enemy_corpse);
			corpse.sprite_index = spr_thedogkeeper_dog_corpse_0;
			
			repeat(4){
				part_type_direction(global.pt_bodypart_0, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_type_sprite(global.pt_bodypart_0, spr_thedogkeeper_dog_bodypart_0, false, false, true);
				part_particles_create(global.ps_bottom, x + random_range(-3, 3), y + random_range(-6, 6), global.pt_bodypart_0, 1);
			}
			break;
		
		case obj_giantturret:
			repeat(7){
				part_type_direction(global.pt_bodypart_0, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_type_sprite(global.pt_bodypart_0, spr_giantturret_bodypart_0, false, false, true);
				part_particles_create(global.ps_bottom, x + random_range(-40, 40), y + random_range(-13, 13), global.pt_bodypart_0, 1);
			}
			break;
		
		case obj_giantturret_flamethrower:
			repeat(4){
				part_type_direction(global.pt_bodypart_0, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_type_sprite(global.pt_bodypart_0, spr_giantturret_flamethrower_bodypart_0, false, false, true);
				part_particles_create(global.ps_bottom, x + random_range(-6, 6), y + random_range(-6, 6), global.pt_bodypart_0, 1);
			}
			break;

		case obj_companion_0:
			corpse = instance_create(x, y - 16, obj_companion_corpse);
			corpse.sprite_index = spr_companion_0_corpse_0;
			
			if (headless){
				corpse.sprite_index = spr_companion_0_headless_corpse_0;
			}
			
			repeat(4){
				part_type_direction(global.pt_bodypart_0, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_type_sprite(global.pt_bodypart_0, spr_companion_0_bodypart_0, false, false, true);
				part_particles_create(global.ps_bottom, x + random_range(-3, 3), y + random_range(-6, 6), global.pt_bodypart_0, 1);
			}
			break;
		
		case obj_companion_1:
			corpse = instance_create(x, y - 16, obj_companion_corpse);
			corpse.sprite_index = spr_companion_1_corpse_0;
			
			if (headless){
				corpse.sprite_index = spr_companion_1_headless_corpse_0;
			}
			
			repeat(4){
				part_type_direction(global.pt_bodypart_0, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_type_sprite(global.pt_bodypart_0, spr_companion_1_bodypart_0, false, false, true);
				part_particles_create(global.ps_bottom, x + random_range(-3, 3), y + random_range(-6, 6), global.pt_bodypart_0, 1);
			}
			break;
		
		case obj_companion_2:
			corpse = instance_create(x, y - 16, obj_companion_corpse);
			corpse.sprite_index = spr_companion_2_corpse_0;
			
			if (headless){
				corpse.sprite_index = spr_companion_2_headless_corpse_0;
			}
			
			repeat(4){
				part_type_direction(global.pt_bodypart_0, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_type_sprite(global.pt_bodypart_0, spr_companion_2_bodypart_0, false, false, true);
				part_particles_create(global.ps_bottom, x + random_range(-3, 3), y + random_range(-6, 6), global.pt_bodypart_0, 1);
			}
			break;
		
		case obj_companion_3:
			corpse = instance_create(x, y - 16, obj_companion_corpse);
			corpse.sprite_index = spr_companion_3_corpse_0;
			
			if (headless){
				corpse.sprite_index = spr_companion_3_headless_corpse_0;
			}
			
			repeat(4){
				part_type_direction(global.pt_bodypart_0, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_type_sprite(global.pt_bodypart_0, spr_companion_3_bodypart_0, false, false, true);
				part_particles_create(global.ps_bottom, x + random_range(-3, 3), y + random_range(-6, 6), global.pt_bodypart_0, 1);
			}
			break;
		
	}
	
	if (corpse != noone){
		corpse.spd = clamp(knockback_speed * 1.5, 1.35, 5) + random_range(-0.5, 1);
		corpse.dir = knockback_direction;
		corpse.move = true;
		corpse.image_xscale = image_xscale;
		corpse.image_yscale = image_yscale;
		
		with(obj_controller_gameplay){
			ds_queue_enqueue(corpse_queue, corpse);
		}
	}
}