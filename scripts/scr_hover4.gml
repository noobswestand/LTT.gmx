if room!=rm_menu{
    if mouse_x>argument0/2
    && mouse_y>argument1/2
    && mouse_x<argument2/2
    && mouse_y<argument3/2{
            return true;
    }
}else{
    if mouse_x>argument0
    && mouse_y>argument1
    && mouse_x<argument2
    && mouse_y<argument3{
            return true;
    }
}
