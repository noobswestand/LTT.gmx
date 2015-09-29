

for(devi=0;devi<6;devi++){
    if device_mouse_x(devi)>argument0
    && device_mouse_y(devi)>argument1
    && device_mouse_x(devi)<argument2
    && device_mouse_y(devi)<argument3{
        return true;
    }
}
