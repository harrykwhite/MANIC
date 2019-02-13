enum WeaponType{
    Ranged,
    Melee,
    Throwing,
	Standalone,
}

enum PlayerWeapon{
	MachineGun,
	Stick,
	Revolver,
	Crowbar,
	Knife,
	AssaultRifle,
	Shotgun,
	Machete,
	QuickGun,
	Grenade,
	Rake,
	SniperRifle,
	GrenadeLauncher,
	Uzi,
	Axe,
	Crossbow,
	Sledgehammer,
	MountedMachineGun,
	LandMine,
	FlareGun,
	Flamethrower,
	Katana,
	ToxicGrenade,
	MP5,
	Spear,
	HeavyShotgun,
	Minigun,
	FlareRifle,
	DartGun,
}

enum AmmoType{
	Bullets,
	Fuel,
	Explosives,
	Arrows,
	Darts,
}

global.weapon_name[0]="Machine Gun";
global.weapon_object[0]=obj_weapon_0;
global.weapon_sprite[0]=spr_weapon_0;
global.weapon_type[0]=WeaponType.Ranged;
global.weapon_heavy[0]=true;
global.weapon_ammomax[0]=13;
global.weapon_ammotype[0]=AmmoType.Bullets;
global.weapon_camerarange[0]=35;
global.weapon_mouse[0] = MouseType.Crosshair;
global.weapon_dualhanded[0] = false;

global.weapon_name[1]="Stick";
global.weapon_object[1]=obj_weapon_1;
global.weapon_sprite[1]=spr_weapon_1;
global.weapon_type[1]=WeaponType.Melee;
global.weapon_heavy[1]=false;
global.weapon_camerarange[1]=15;
global.weapon_mouse[1] = MouseType.SmallCircle;
global.weapon_dualhanded[1] = false;

global.weapon_name[2]="Revolver";
global.weapon_object[2]=obj_weapon_2;
global.weapon_sprite[2]=spr_weapon_2;
global.weapon_type[2]=WeaponType.Ranged;
global.weapon_heavy[2]=false;
global.weapon_ammomax[2]=9;
global.weapon_ammotype[2]=AmmoType.Bullets;
global.weapon_camerarange[2]=40;
global.weapon_mouse[2] = MouseType.Crosshair;
global.weapon_dualhanded[2] = false;

global.weapon_name[3]="Crowbar";
global.weapon_object[3]=obj_weapon_3;
global.weapon_sprite[3]=spr_weapon_3;
global.weapon_type[3]=WeaponType.Melee;
global.weapon_heavy[3]=false;
global.weapon_camerarange[3]=15;
global.weapon_mouse[3] = MouseType.SmallCircle;
global.weapon_dualhanded[3] = false;

global.weapon_name[4]="Knife";
global.weapon_object[4]=obj_weapon_4;
global.weapon_sprite[4]=spr_weapon_4;
global.weapon_type[4]=WeaponType.Melee;
global.weapon_heavy[4]=false;
global.weapon_camerarange[4]=10;
global.weapon_mouse[4] = MouseType.SmallCrosshair;
global.weapon_dualhanded[4] = false;

global.weapon_name[5]="Assault Rifle";
global.weapon_object[5]=obj_weapon_5;
global.weapon_sprite[5]=spr_weapon_5;
global.weapon_type[5]=WeaponType.Ranged;
global.weapon_heavy[5]=true;
global.weapon_ammomax[5]=15;
global.weapon_ammotype[5]=AmmoType.Bullets;
global.weapon_camerarange[5]=40;
global.weapon_mouse[5] = MouseType.Crosshair;
global.weapon_dualhanded[5] = false;

global.weapon_name[6]="Shotgun";
global.weapon_object[6]=obj_weapon_6;
global.weapon_sprite[6]=spr_weapon_6;
global.weapon_type[6]=WeaponType.Ranged;
global.weapon_heavy[6]=true;
global.weapon_ammomax[6]=6;
global.weapon_ammotype[6]=AmmoType.Bullets;
global.weapon_camerarange[6]=30;
global.weapon_mouse[6] = MouseType.LargeCircle;
global.weapon_dualhanded[6] = false;

global.weapon_name[7]="Machete";
global.weapon_object[7]=obj_weapon_7;
global.weapon_sprite[7]=spr_weapon_7;
global.weapon_type[7]=WeaponType.Melee;
global.weapon_heavy[7]=false;
global.weapon_camerarange[7]=15;
global.weapon_canburn[7] = false;
global.weapon_mouse[7] = MouseType.SmallCircle;
global.weapon_dualhanded[7] = false;

global.weapon_name[8]="Quick Gun";
global.weapon_object[8]=obj_weapon_8;
global.weapon_sprite[8]=spr_weapon_8;
global.weapon_type[8]=WeaponType.Ranged;
global.weapon_heavy[8]=true;
global.weapon_ammomax[8]=9;
global.weapon_ammotype[8]=AmmoType.Bullets;
global.weapon_camerarange[8]=30;
global.weapon_mouse[8] = MouseType.Crosshair;
global.weapon_dualhanded[8] = false;

global.weapon_name[9]="Grenade";
global.weapon_object[9]=obj_weapon_9;
global.weapon_sprite[9]=spr_weapon_9;
global.weapon_type[9]=WeaponType.Throwing;
global.weapon_heavy[9]=false;
global.weapon_camerarange[9]=10;
global.weapon_mouse[9] = MouseType.SmallCircle;
global.weapon_dualhanded[9] = false;
global.weapon_quantity[9] = 1;

global.weapon_name[10]="Rake";
global.weapon_object[10]=obj_weapon_10;
global.weapon_sprite[10]=spr_weapon_10;
global.weapon_type[10]=WeaponType.Melee;
global.weapon_heavy[10]=true;
global.weapon_camerarange[10]=18;
global.weapon_mouse[10] = MouseType.SmallCircle;
global.weapon_dualhanded[10] = true;

global.weapon_name[11]="Sniper Rifle";
global.weapon_object[11]=obj_weapon_11;
global.weapon_sprite[11]=spr_weapon_11;
global.weapon_type[11]=WeaponType.Ranged;
global.weapon_heavy[11]=true;
global.weapon_ammomax[11]=4;
global.weapon_ammotype[11]=AmmoType.Bullets;
global.weapon_camerarange[11]=50;
global.weapon_mouse[11] = MouseType.Crosshair;
global.weapon_dualhanded[11] = false;

global.weapon_name[12]="Grenade Launcher";
global.weapon_object[12]=obj_weapon_12;
global.weapon_sprite[12]=spr_weapon_12;
global.weapon_type[12]=WeaponType.Ranged;
global.weapon_heavy[12]=true;
global.weapon_ammomax[12]=4;
global.weapon_ammotype[12]=AmmoType.Explosives;
global.weapon_camerarange[12]=24;
global.weapon_mouse[12] = MouseType.SmallCircle;
global.weapon_dualhanded[12] = false;

global.weapon_name[13]="Uzi";
global.weapon_object[13]=obj_weapon_13;
global.weapon_sprite[13]=spr_weapon_13;
global.weapon_type[13]=WeaponType.Ranged;
global.weapon_heavy[13]=false;
global.weapon_ammomax[13]=7;
global.weapon_ammotype[13]=AmmoType.Bullets;
global.weapon_camerarange[13]=24;
global.weapon_mouse[13] = MouseType.Crosshair;
global.weapon_dualhanded[13] = false;

global.weapon_name[14]="Axe";
global.weapon_object[14]=obj_weapon_14;
global.weapon_sprite[14]=spr_weapon_14;
global.weapon_type[14]=WeaponType.Melee;
global.weapon_heavy[14]=false;
global.weapon_camerarange[14]=17;
global.weapon_mouse[14] = MouseType.SmallCircle;
global.weapon_dualhanded[14] = false;

global.weapon_name[15]="Crossbow";
global.weapon_object[15]=obj_weapon_15;
global.weapon_sprite[15]=spr_weapon_15;
global.weapon_type[15]=WeaponType.Ranged;
global.weapon_heavy[15]=true;
global.weapon_ammomax[15]=6;
global.weapon_ammotype[15]=AmmoType.Arrows;
global.weapon_camerarange[15]=30;
global.weapon_mouse[15] = MouseType.SmallCrosshair;
global.weapon_dualhanded[15] = false;

global.weapon_name[16]="Sledgehammer";
global.weapon_object[16]=obj_weapon_16;
global.weapon_sprite[16]=spr_weapon_16;
global.weapon_type[16]=WeaponType.Melee;
global.weapon_heavy[16]=true;
global.weapon_camerarange[16]=18;
global.weapon_mouse[16] = MouseType.SmallCircle;
global.weapon_dualhanded[16] = false;

global.weapon_name[17]="Mounted Machine Gun";
global.weapon_object[17]=obj_weapon_17;
global.weapon_sprite[17]=spr_weapon_17;
global.weapon_type[17]=WeaponType.Ranged;
global.weapon_heavy[17]=true;
global.weapon_ammomax[17]=60;
global.weapon_ammotype[17]=AmmoType.Bullets;
global.weapon_camerarange[17]=35;
global.weapon_mouse[17] = MouseType.Crosshair;
global.weapon_dualhanded[17] = false;

global.weapon_name[18]="Land Mine";
global.weapon_object[18]=obj_weapon_18;
global.weapon_sprite[18]=spr_weapon_18;
global.weapon_type[18]=WeaponType.Throwing;
global.weapon_heavy[18]=false;
global.weapon_camerarange[18]=10;
global.weapon_mouse[18] = MouseType.SmallCircle;
global.weapon_dualhanded[18] = false;
global.weapon_quantity[18] = 1;

global.weapon_name[19]="Flare Gun";
global.weapon_object[19]=obj_weapon_19;
global.weapon_sprite[19]=spr_weapon_19;
global.weapon_type[19]=WeaponType.Ranged;
global.weapon_heavy[19]=false;
global.weapon_ammomax[19]=12;
global.weapon_ammotype[19]=AmmoType.Fuel;
global.weapon_camerarange[19]=32;
global.weapon_mouse[19] = MouseType.SmallCrosshair;
global.weapon_dualhanded[19] = false;

global.weapon_name[20]="Flamethrower";
global.weapon_object[20]=obj_weapon_20;
global.weapon_sprite[20]=spr_weapon_20;
global.weapon_type[20]=WeaponType.Ranged;
global.weapon_heavy[20]=true;
global.weapon_ammomax[20]=120;
global.weapon_ammotype[20]=AmmoType.Fuel;
global.weapon_camerarange[20]=34;
global.weapon_mouse[20] = MouseType.LargeCircle;
global.weapon_dualhanded[20] = false;

global.weapon_name[21]="Katana";
global.weapon_object[21]=obj_weapon_21;
global.weapon_sprite[21]=spr_weapon_21;
global.weapon_type[21]=WeaponType.Melee;
global.weapon_heavy[21]=false;
global.weapon_camerarange[21]=18;
global.weapon_mouse[21] = MouseType.SmallCircle;
global.weapon_dualhanded[21] = false;

global.weapon_name[22]="Toxic Grenade";
global.weapon_object[22]=obj_weapon_22;
global.weapon_sprite[22]=spr_weapon_22;
global.weapon_type[22]=WeaponType.Throwing;
global.weapon_heavy[22]=false;
global.weapon_camerarange[22]=12;
global.weapon_mouse[22] = MouseType.SmallCircle;
global.weapon_dualhanded[22] = false;
global.weapon_quantity[22] = 1;

global.weapon_name[23]="MP5";
global.weapon_object[23]=obj_weapon_23;
global.weapon_sprite[23]=spr_weapon_23;
global.weapon_type[23]=WeaponType.Ranged;
global.weapon_heavy[23]=false;
global.weapon_ammomax[23]=11;
global.weapon_ammotype[23]=AmmoType.Bullets;
global.weapon_camerarange[23]=24;
global.weapon_mouse[23] = MouseType.Crosshair;
global.weapon_dualhanded[23] = false;

global.weapon_name[24]="Spear";
global.weapon_object[24]=obj_weapon_24;
global.weapon_sprite[24]=spr_weapon_24;
global.weapon_type[24]=WeaponType.Melee;
global.weapon_heavy[24]=true;
global.weapon_camerarange[24]=23;
global.weapon_mouse[24] = MouseType.SmallCircle;
global.weapon_dualhanded[24] = true;

global.weapon_name[25]="Heavy Shotgun";
global.weapon_object[25]=obj_weapon_25;
global.weapon_sprite[25]=spr_weapon_25;
global.weapon_type[25]=WeaponType.Ranged;
global.weapon_heavy[25]=true;
global.weapon_ammomax[25]=6;
global.weapon_ammotype[25]=AmmoType.Bullets;
global.weapon_camerarange[25]=35;
global.weapon_mouse[25] = MouseType.LargeCircle;
global.weapon_dualhanded[25] = false;

global.weapon_name[26]="Minigun";
global.weapon_object[26]=obj_weapon_26;
global.weapon_sprite[26]=spr_weapon_26;
global.weapon_type[26]=WeaponType.Ranged;
global.weapon_heavy[26]=true;
global.weapon_ammomax[26]=18;
global.weapon_ammotype[26]=AmmoType.Bullets;
global.weapon_camerarange[26]=18;
global.weapon_mouse[26] = MouseType.Crosshair;
global.weapon_dualhanded[26] = false;

global.weapon_name[27]="Flare Rifle";
global.weapon_object[27]=obj_weapon_27;
global.weapon_sprite[27]=spr_weapon_27;
global.weapon_type[27]=WeaponType.Ranged;
global.weapon_heavy[27]=true;
global.weapon_ammomax[27]=12;
global.weapon_ammotype[27]=AmmoType.Fuel;
global.weapon_camerarange[27]=35;
global.weapon_mouse[27] = MouseType.SmallCrosshair;
global.weapon_dualhanded[27] = false;

global.weapon_name[28]="Dart Gun";
global.weapon_object[28]=obj_weapon_28;
global.weapon_sprite[28]=spr_weapon_28;
global.weapon_type[28]=WeaponType.Ranged;
global.weapon_heavy[28]=false;
global.weapon_ammomax[28]=11;
global.weapon_ammotype[28]=AmmoType.Darts;
global.weapon_camerarange[28]=38;
global.weapon_mouse[28] = MouseType.SmallCrosshair;
global.weapon_dualhanded[28] = false;

global.weapon_slot[0] = PlayerWeapon.Revolver;
global.weapon_slotammo[0] = global.weapon_ammomax[PlayerWeapon.Revolver];

global.weapon_slot[1] = -1;
global.weapon_slotammo[1] = -1;

global.weapon_slot_standalone = -1;
global.weapon_slot_standalone_ammo = -1;
global.weapon_slotcurrent = 0;

if (room == rm_ini){
	var count = array_length_1d(global.weapon_name);
	for(var i = 0; i < count; i++){
		global.weapon_collected[i] = false;
	}
}