if mouse_x>argument0
&& mouse_y>argument1
&& mouse_x<argument2
&& mouse_y<argument3{
    if (mouse_check_button(mb_left)){
        return true;
    }
}