var slotcount = global.weapon_slotmax;

for(var i = 0; i < slotcount; i ++){
	global.checkpoint_weapon_slot[i] = (i == 0 ? PlayerWeapon.Revolver : -1);
	global.checkpoint_weapon_slotammo[i] = (i == 0 ? global.weapon_ammomax[PlayerWeapon.Revolver] : -1);
	global.checkpoint_weapon_slotquantity[i] = -1;
}

global.checkpoint_killcount = 0;
global.checkpoint_levelcleared = false;
global.checkpoint_room = noone;
global.checkpoint_goto = false;
global.checkpoint_starttype = 0;