// Returns a list of possible resolution options
var options = ds_list_create();
var dwidth = display_get_width();
var dheight = display_get_height();

ds_list_add(options, string(dwidth / 4) + "x" + string(dheight / 4));
ds_list_add(options, string(dwidth / 3) + "x" + string(dheight / 3));
ds_list_add(options, string(dwidth / 2) + "x" + string(dheight / 2));
ds_list_add(options, string(dwidth) + "x" + string(dheight));

return options;