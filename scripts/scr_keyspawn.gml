///scr_keyspawn(id)
if instance_exists(obj_block3) && global.key=false && global.keyGot=false{
    if global.death_start=false{
    
        if alarm[7]>room_speed*5{
            if irandom(10)=1{
                argument0.key=true
                global.key=true
                argument0.helth=argument0.helth*7
            }
        }else{
            if irandom(4)=1{
                argument0.key=true
                global.key=true
                argument0.helth=argument0.helth*7
            }
        }
    }else{
        if irandom(0)=0{
            argument0.key=true
            global.key=true
            argument0.helth=argument0.helth*10
        }
    }
}
