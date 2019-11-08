///@param damage
///@param knockback_speed
///@param knockback_direction
///@param invincibility_time
var dmg = round(argument0);
var kbs = argument1;
var kbd = argument2;
var it = argument3;

if (object_get_parent(object_index) == obj_p_enemy){
	if (scr_player_has_upgrade(PlayerUpgrade.IronGlove)) && (kbs != 0){
		if (global.player_melee_attack_counter >= global.player_melee_attack_counter_max){
			kbs *= 3;
			global.player_melee_attack_counter = 0;
			
			repeat(7){
				part_particles_create(global.ps_front, x + random_range(-4, 4), y + random_range(-4, 4), global.pt_powerhit_0, 1);
				part_type_direction(global.pt_powerhit_0, kbd - 20, kbd + 20, 0, 0.1);
			}
		}
	}
}

health_current -= dmg;
knockback_speed = kbs;
knockback_direction = kbd;
i_time = it;
i_blend_time = 5;
health_scale = 1.5;
health_flash = 1;

var corpse = noone;

if (object_index == obj_enemy_3){
	initiated = true;
}

if (health_current <= 0){
	switch(object_index){
		case obj_enemy_0:
			corpse = instance_create(x, y - 16, obj_enemy_corpse);
			if (type == Enemy0_Type.Crazy){
				corpse.sprite_index = spr_enemy_0_brain_corpse_0;
			}
			
			if (type == Enemy0_Type.Healer){
				corpse.sprite_index = spr_enemy_0_healer_corpse_0;
			}
			
			if (type == Enemy0_Type.TrainBoss){
				corpse.sprite_index = spr_enemy_0_sniperboss_corpse_0;
			}
			
			if (type == Enemy0_Type.Fly){
				corpse.sprite_index = spr_enemy_0_fly_corpse_0;
			}
			
			if (headless){
				corpse.sprite_index = spr_enemy_0_headless_corpse_0;
			}
			
			repeat(4){
				part_type_speed(global.pt_bodypart_enemy_0, 2.2 + (knockback_speed / 15), 2.9 + (knockback_speed / 15), -0.075, 0);
				part_type_direction(global.pt_bodypart_enemy_0, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_particles_create(global.ps_bottom, x + random_range(-6, 6), y + random_range(-6, 6), global.pt_bodypart_enemy_0, 1);
			}
			break;
		
		case obj_enemy_1:
			repeat(3){
				part_type_speed(global.pt_bodypart_enemy_1, 2.2 + (knockback_speed / 15), 2.9 + (knockback_speed / 15), -0.075, 0);
				part_type_direction(global.pt_bodypart_enemy_1, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_particles_create(global.ps_bottom, x + random_range(-6, 6), y + random_range(-6, 6), global.pt_bodypart_enemy_1, 1);
			}
			break;
		
		case obj_enemy_2:
			corpse = instance_create(x, y, obj_enemy_corpse);
			corpse.sprite_index = spr_enemy_2_corpse_0;
			
			if (headless){
				corpse.sprite_index = spr_enemy_2_headless_corpse_0;
			}
			
			repeat(4){
				part_type_speed(global.pt_bodypart_enemy_2, 2.2 + (knockback_speed / 15), 2.9 + (knockback_speed / 15), -0.075, 0);
				part_type_direction(global.pt_bodypart_enemy_2, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_particles_create(global.ps_bottom, x + random_range(-6, 6), y + random_range(-6, 6), global.pt_bodypart_enemy_2, 1);
			}
			break;
		
		case obj_enemy_3:
			repeat(5){
				part_type_speed(global.pt_bodypart_enemy_3, 2.2 + (knockback_speed / 15), 2.9 + (knockback_speed / 15), -0.075, 0);
				part_type_direction(global.pt_bodypart_enemy_3, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_particles_create(global.ps_bottom, x + random_range(-6, 6), y + random_range(-6, 6), global.pt_bodypart_enemy_3, 1);
			}
			break;
		
		case obj_enemy_4:
			corpse = instance_create(x, y, obj_enemy_corpse);
			corpse.sprite_index = spr_enemy_4_corpse_0;
			
			repeat(4){
				part_type_speed(global.pt_bodypart_enemy_4, 2.2 + (knockback_speed / 15), 2.9 + (knockback_speed / 15), -0.075, 0);
				part_type_direction(global.pt_bodypart_enemy_4, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_particles_create(global.ps_bottom, x + random_range(-10, 10), y + random_range(-6, 6), global.pt_bodypart_enemy_4, 1);
			}
			break;
		
		case obj_enemy_5:
			var cblock = noone;
			
			corpse = instance_create(x, y, obj_enemy_corpse);
			corpse.sprite_index = spr_enemy_5_corpse_0;
			
			repeat(4){
				part_type_speed(global.pt_bodypart_enemy_5, 2.2 + (knockback_speed / 15), 2.9 + (knockback_speed / 15), -0.075, 0);
				part_type_direction(global.pt_bodypart_enemy_5, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_particles_create(global.ps_bottom, x + random_range(-6, 6), y + random_range(-6, 6), global.pt_bodypart_enemy_5, 1);
			}
			
			if (global.game_objective_current == Objectives.KillDeer){
				if (global.objective_counter[global.game_objective_current] == 0){
					cblock = instance_create(x, y, obj_block_cutscene);
					cblock.index = 4;
					cblock.destroy_on_activate = true;
					cblock.image_xscale = 8;
					cblock.image_yscale = 8;
					cblock.x -= sprite_get_width(spr_block_cutscene) * 4;
					cblock.y -= sprite_get_height(spr_block_cutscene) * 4;
				}
			}
			
			var flesh = instance_create(x, y + 6, obj_collectable_pickup);
			flesh.spd = knockback_speed * 1.25;
			flesh.dir = knockback_direction;
			flesh.listnum = -1;
			flesh.index = Collectables.DeerMeat;
			flesh.angle = irandom_range(-5, 5);
			flesh.x -= sprite_get_width(spr_collectable_0) / 2;
			flesh.y -= sprite_get_height(spr_collectable_0) / 2;
			
			if (cblock != noone){
				flesh.deer_flesh_cblock = cblock;
				flesh.deer_flesh_cblock_xoff = flesh.x - cblock.x;
				flesh.deer_flesh_cblock_yoff = flesh.y - cblock.y;
			}
			break;
		
		case obj_thescorched:
			corpse = instance_create(x, y - 16, obj_enemy_corpse);
			corpse.sprite_index = spr_thescorched_corpse_0;
			
			repeat(6){
				part_type_speed(global.pt_bodypart_thescorched_0, 2.2 + (knockback_speed / 15), 2.9 + (knockback_speed / 15), -0.075, 0);
				part_type_direction(global.pt_bodypart_thescorched_0, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_particles_create(global.ps_bottom, x + random_range(-6, 6), y + random_range(-6, 6), global.pt_bodypart_thescorched_0, 1);
			}
			break;
		
		case obj_thedogkeeper:
			corpse = instance_create(x, y - 16, obj_enemy_corpse);
			corpse.sprite_index = spr_thedogkeeper_corpse_0;
			
			repeat(6){
				part_type_speed(global.pt_bodypart_thedogkeeper_0, 2.2 + (knockback_speed / 15), 2.9 + (knockback_speed / 15), -0.075, 0);
				part_type_direction(global.pt_bodypart_thedogkeeper_0, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_particles_create(global.ps_bottom, x + random_range(-6, 6), y + random_range(-6, 6), global.pt_bodypart_thedogkeeper_0, 1);
			}
			break;
		
		case obj_thedogkeeper_dog:
			corpse = instance_create(x, y, obj_enemy_corpse);
			corpse.sprite_index = spr_thedogkeeper_dog_corpse_0;
			
			repeat(4){
				part_type_speed(global.pt_bodypart_thedogkeeper_dog_0, 2.2 + (knockback_speed / 15), 2.9 + (knockback_speed / 15), -0.075, 0);
				part_type_direction(global.pt_bodypart_thedogkeeper_dog_0, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_particles_create(global.ps_bottom, x + random_range(-6, 6), y + random_range(-6, 6), global.pt_bodypart_thedogkeeper_dog_0, 1);
			}
			break;
		
		case obj_giantturret:
			repeat(9){
				part_type_speed(global.pt_bodypart_giantturret_0, 2.2 + (knockback_speed / 15), 2.9 + (knockback_speed / 15), -0.075, 0);
				part_type_direction(global.pt_bodypart_giantturret_0, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_particles_create(global.ps_bottom, x + random_range(-24, 24), y + random_range(-10, 10), global.pt_bodypart_giantturret_0, 1);
			}
			break;
		
		case obj_giantturret_flamethrower:
			repeat(4){
				part_type_speed(global.pt_bodypart_giantturret_flamethrower_0, 2.2 + (knockback_speed / 15), 2.9 + (knockback_speed / 15), -0.075, 0);
				part_type_direction(global.pt_bodypart_giantturret_flamethrower_0, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_particles_create(global.ps_bottom, x + random_range(-6, 6), y + random_range(-6, 6), global.pt_bodypart_giantturret_flamethrower_0, 1);
			}
			break;

		//case obj_companion_0:
		//	corpse = instance_create(x, y - 16, obj_companion_corpse);
		//	corpse.sprite_index = spr_companion_0_corpse_0;
			
		//	if (headless){
		//		corpse.sprite_index = spr_companion_0_headless_corpse_0;
		//	}
			
		//	repeat(4){
		//		part_type_speed(global.pt_bodypart_companion_0, 2.2 + (knockback_speed / 15), 2.9 + (knockback_speed / 15), -0.075, 0);
		//		part_type_direction(global.pt_bodypart_companion_0, knockback_direction - 35, knockback_direction + 35, 0, 0);
		//		part_particles_create(global.ps_bottom, x + random_range(-6, 6), y + random_range(-6, 6), global.pt_bodypart_companion_0, 1);
		//	}
		//	break;
		
		case obj_companion_1:
			corpse = instance_create(x, y - 16, obj_companion_corpse);
			corpse.sprite_index = spr_companion_1_corpse_0;
			
			if (headless){
				corpse.sprite_index = spr_companion_1_headless_corpse_0;
			}
			
			repeat(4){
				part_type_speed(global.pt_bodypart_companion_1, 2.2 + (knockback_speed / 15), 2.9 + (knockback_speed / 15), -0.075, 0);
				part_type_direction(global.pt_bodypart_companion_1, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_particles_create(global.ps_bottom, x + random_range(-6, 6), y + random_range(-6, 6), global.pt_bodypart_companion_1, 1);
			}
			break;
		
		case obj_companion_2:
			corpse = instance_create(x, y - 16, obj_companion_corpse);
			corpse.sprite_index = spr_companion_2_corpse_0;
			
			if (headless){
				corpse.sprite_index = spr_companion_2_headless_corpse_0;
			}
			
			repeat(4){
				part_type_speed(global.pt_bodypart_companion_2, 2.2 + (knockback_speed / 15), 2.9 + (knockback_speed / 15), -0.075, 0);
				part_type_direction(global.pt_bodypart_companion_2, knockback_direction - 35, knockback_direction + 35, 0, 0);
				part_particles_create(global.ps_bottom, x + random_range(-6, 6), y + random_range(-6, 6), global.pt_bodypart_companion_2, 1);
			}
			break;
		
		case obj_companion_3:
			corpse = instance_create(x, y - 16, obj_companion_corpse);
			corpse.sprite_index = spr_companion_3_corpse_0;
			
			if (headless){
				corpse.sprite_index = spr_companion_3_headless_corpse_0;
			}
			
			repeat(4){
				part_type_speed(global.pt_bodypart_companion_3, 2.2 + (knockback_speed / 15), 2.9 + (knockback_speed / 15), -0.075, 0);
				part_type_direction(global.pt_bodypart_companion_3, knockback_direction - 15, knockback_direction + 15, 0, 0);
				part_particles_create(global.ps_bottom, x + random_range(-6, 6), y + random_range(-6, 6), global.pt_bodypart_companion_3, 1);
			}
			break;
		
		case obj_antagonist:
			if (room != rm_level_6_pre_00){
				corpse = instance_create(x, y - 16, obj_antagonist_corpse);
				corpse.sprite_index = spr_antagonist_corpse_0;
			
				var mask = instance_create(x, y + 4, obj_antagonist_mask);
				mask.dir = knockback_direction;
			
				knockback_speed *= 0.7;
			
				if (room == rm_level_10_01){
					obj_controller_gameplay.cutscene_ending_corpse = corpse;
				}
			}
			break;
	}
	
	if (corpse != noone){
		corpse.spd = max(knockback_speed * 2, 1.35) + random_range(-0.5, 1);
		corpse.dir = knockback_direction;
		corpse.move = true;
		corpse.image_xscale = image_xscale;
		corpse.image_yscale = image_yscale;
		
		with(obj_controller_gameplay){
			ds_queue_enqueue(corpse_queue, corpse);
		}
	}
}