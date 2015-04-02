if !instance_exists(obj_crits){
    nn=instance_create(x,y,obj_crits)
    nn._color=choose(c_orange,c_purple,c_blue,c_aqua,c_green,c_lime)
    obj_control.player_health+=(obj_control.player_moss)
}