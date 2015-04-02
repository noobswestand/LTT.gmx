//case 28
var temp=readstring();
if temp="dead"{
    obj_client2.canmove=false
    obj_client2.sprite_index=obj_player.spr_idle
    obj_client2.image_index=0
    obj_client2.image_angle=90
    obj_client2.friction=0.1
    obj_client2.canshoot=false
    obj_client2.x=readshort()
    obj_client2.y=readshort()
    obj_client2.dead=true
    obj_client2.vspeed=-7
    if !place_free(obj_client2.x+8,obj_client2.y){
        obj_client2.hspeed=-3
    }else{
        obj_client2.hspeed=3
    }
    
}