if point_distance(obj_player.x,obj_player.y,obj_client2.x,obj_client2.y)<50{
    if keyboard_check_pressed(vk_space) or mouse_check_button_pressed(mb_left){
        obj_client2.getHealed=true
        obj_player.sprite_index=obj_player.spr_heal
        obj_player.image_speed=0
        obj_player.image_index=!obj_player.image_index
        obj_client2.deadCharge+=5
        
        clearbuffer()
        writebyte(29)
        writebyte(obj_player.image_index)
        writebyte(obj_client2.deadCharge)
        sendmessage(global.clienttcp)
        
    }
}else{
    obj_client2.getHealed=false
}
