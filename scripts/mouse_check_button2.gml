///mouse_check_button2(x1,y1,x2,y2)
for(devi=0;devi<6;devi++){
    if device_mouse_x(devi)>argument0
    && device_mouse_y(devi)>argument1
    && device_mouse_x(devi)<argument2
    && device_mouse_y(devi)<argument3{
        if device_mouse_check_button_pressed(devi, mb_left){
            return true;
        }
    }
}