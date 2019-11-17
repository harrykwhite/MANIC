with(obj_controller_ui){
	if (global.game_input_type == InputType.Keyboard){
		tutourial_text[TutourialStage.Movement] = "Use the [" + scr_input_get_name(InputBinding.Up, false) + scr_input_get_name(InputBinding.Left, false) + scr_input_get_name(InputBinding.Down, false) + scr_input_get_name(InputBinding.Right, false) + "] keys to move";
		tutourial_text[TutourialStage.Pickup] = "Pick up the rifle in the shed with " + scr_input_get_name(InputBinding.Interact);
		tutourial_text[TutourialStage.Shoot] = "Shoot by pressing " + scr_input_get_name(InputBinding.Attack);
		tutourial_text[TutourialStage.Throw] = "Throw your weapon by pressing " + scr_input_get_name(InputBinding.Throw);
		tutourial_text[TutourialStage.Switch] = "Switch between weapons by using the " + scr_input_get_name(InputBinding.SwitchWeaponForward) + " or the number keys";
		tutourial_text[TutourialStage.Dash] = "Dash by pressing " + scr_input_get_name(InputBinding.Dash);
	}else{
		tutourial_text[TutourialStage.Movement] = "Move with " + scr_input_get_name(InputBinding.Up);
		tutourial_text[TutourialStage.Pickup] = "Pick up the rifle in the shed with " + scr_input_get_name(InputBinding.Interact);
		tutourial_text[TutourialStage.Shoot] = "Shoot by pressing " + scr_input_get_name(InputBinding.Attack);
		tutourial_text[TutourialStage.Throw] = "Throw your weapon by pressing " + scr_input_get_name(InputBinding.Throw);
		tutourial_text[TutourialStage.Switch] = "Switch between weapons by pressing " + scr_input_get_name(InputBinding.SwitchWeaponForward) + " or " + scr_input_get_name(InputBinding.SwitchWeaponBack);
		tutourial_text[TutourialStage.Dash] = "Dash by pressing " + scr_input_get_name(InputBinding.Dash);
	}

	tutourial_text[TutourialStage.PickupMelee] = "Pick up the melee weapon by the crates";
	tutourial_text[TutourialStage.CollectAmmo] = "Break open the crates to retrieve ammo";
	tutourial_text[TutourialStage.ThrowPurpose] = "Weapons can be thrown at opponents to damage them.";
}