if (fade == false){
    if (alpha < 1){
        alpha += increase_speed ;
    }else{
        alpha = 1;
        fade = true;
        
        if (script!=-1){
            script_execute(script);
        }
    }
}else{
    if (alpha > 0){
        alpha -= decrease_speed ;
    }else{
        alpha = 0;
        instance_destroy();
    }
}

