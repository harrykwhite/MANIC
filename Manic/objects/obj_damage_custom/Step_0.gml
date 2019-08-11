if (time != -1){
    if (time > 0){
        time--;
    }else{
        instance_destroy();
    }
}

image_xscale = width / sprite_width;
image_yscale = height / sprite_height;