var upgradecount = array_length_1d(global.upgrade_name);
surrounding_light_to = 1;

for(var i = 0; i < upgradecount; i ++){
	if (global.upgrade_equipped[i]){
		surrounding_light_to -= surrounding_light_upgradedec;
	}
}