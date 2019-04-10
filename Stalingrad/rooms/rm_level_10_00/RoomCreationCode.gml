if (!instance_exists(obj_player)){
    instance_create(502, 952, obj_player);
}

global.player_footstep_default = snd_character_footstep_wood;

if (global.game_level_opening_type == 1){
	obj_player.x = 502;
	obj_player.y = 24;
	obj_controller_camera.x = obj_player.x;
	obj_controller_camera.y = obj_player.y;
}

scr_room_spawn_companion();

while(!instance_exists(obj_controller_mouse)){
    instance_create(mouse_x, mouse_y, obj_controller_mouse);
}

instance_activate_all();

// Weapon drops
var weapons = ds_list_create();
var drop;
drop[0] = inst_99560B2;
drop[1] = inst_598D9F40;
drop[2] = inst_2FE8F0B3;
drop[3] = inst_6A66A1A1;
drop[4] = inst_5D159B67;
drop[5] = inst_CD20CD9;

for(var i = 0; i < 6; i ++){
	var dropindex = choose(PlayerWeapon.Grenade, PlayerWeapon.Katana, PlayerWeapon.Spear, PlayerWeapon.MachineGun, PlayerWeapon.GrenadeLauncher, PlayerWeapon.MP5, PlayerWeapon.Sledgehammer);
	
	while(ds_list_find_index(weapons, dropindex) != -1){
		dropindex = choose(PlayerWeapon.Grenade, PlayerWeapon.Katana, PlayerWeapon.Spear, PlayerWeapon.MachineGun, PlayerWeapon.GrenadeLauncher, PlayerWeapon.MP5, PlayerWeapon.Sledgehammer);
	}
	
	if (dropindex == PlayerWeapon.Grenade){
		drop[i].pack = true;
		drop[i].quantity = random_range(7, 9);
	}
	
	drop[i].index = dropindex;
	drop[i].angle = random_range(-30, 30);
	ds_list_add(weapons, dropindex);
}

ds_list_destroy(weapons);