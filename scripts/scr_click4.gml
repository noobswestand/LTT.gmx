if mouse_x>argument0/2
&& mouse_y>argument1/2
&& mouse_x<argument2/2
&& mouse_y<argument3/2{
    if (mouse_check_button_pressed(mb_left)){
        return true;
    }
}
return false