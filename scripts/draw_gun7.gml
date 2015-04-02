///draw_gun7()
var dir=argument[1];
var damage=argument[2]
var rate=argument[0];
var spread=argument[3];

if argument[4]=obj_player{alarm[3]=1}else{alarm[4]=1}

if !instance_exists(obj_gun7Holder){
    instance_create(argument[4].x+50,argument[4].y,obj_gun7Holder)
}
nn=obj_gun7Holder.id
nn.x=argument[4].x+lengthdir_x(10,dir)
nn.y=argument[4].y+lengthdir_y(10,dir)
/*

nn.phy_position_x=argument[4].x+lengthdir_x(10,dir)
nn.phy_position_y=argument[4].y+lengthdir_y(10,dir)
*/

if argument[4]=obj_player{
    if os_type=os_windows && global.GamePadMouse=0{
        window_mouse_set((argument[4].x*2)+lengthdir_x(20,dir),(argument[4].y*2)+lengthdir_y(20,dir))
    }
}
