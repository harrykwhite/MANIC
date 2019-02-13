///scr_effect_vignette_flash(colour, alpha, alpha_speed);
///@param colour
///@param alpha
///@param alpha_speed

if (instance_exists(obj_controller_ui)){
	obj_controller_ui.vignette_flash_colour = argument0;
	obj_controller_ui.vignette_flash_alpha = argument1;
	obj_controller_ui.vignette_flash_alpha_speed = argument2;
}