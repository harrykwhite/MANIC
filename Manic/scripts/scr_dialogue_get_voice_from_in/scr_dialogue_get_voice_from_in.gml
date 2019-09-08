///@param in
///@param list
var in = argument0;
var list = argument1;

switch(in){
	default:
		list[| 0] = noone;
		list[| 1] = noone;
		list[| 2] = noone;
		break;
	
	case snd_character_dialogue_generic_in:
		list[| 0] = snd_character_dialogue_generic_in;
		list[| 1] = snd_character_dialogue_generic_loop;
		list[| 2] = snd_character_dialogue_generic_out;
		break;
	
	case snd_character_dialogue_protagonist_in:
		list[| 0] = snd_character_dialogue_protagonist_in;
		list[| 1] = snd_character_dialogue_protagonist_loop;
		list[| 2] = snd_character_dialogue_protagonist_out;
		break;
	
	case snd_character_dialogue_antagonist_in:
		list[| 0] = snd_character_dialogue_antagonist_in;
		list[| 1] = snd_character_dialogue_antagonist_loop;
		list[| 2] = snd_character_dialogue_antagonist_out;
		break;
	
	case snd_character_dialogue_thescorched_in:
		list[| 0] = snd_character_dialogue_thescorched_in;
		list[| 1] = snd_character_dialogue_thescorched_loop;
		list[| 2] = snd_character_dialogue_thescorched_out;
		break;
	
	case snd_character_dialogue_thedogkeeper_in:
		list[| 0] = snd_character_dialogue_thedogkeeper_in;
		list[| 1] = snd_character_dialogue_thedogkeeper_loop;
		list[| 2] = snd_character_dialogue_thedogkeeper_out;
		break;
	
	case snd_character_dialogue_compfarmer_in:
		list[| 0] = snd_character_dialogue_compfarmer_in;
		list[| 1] = snd_character_dialogue_compfarmer_loop;
		list[| 2] = snd_character_dialogue_compfarmer_out;
		break;
	
	case snd_character_dialogue_compgrenadier_in:
		list[| 0] = snd_character_dialogue_compgrenadier_in;
		list[| 1] = snd_character_dialogue_compgrenadier_loop;
		list[| 2] = snd_character_dialogue_compgrenadier_out;
		break;
}