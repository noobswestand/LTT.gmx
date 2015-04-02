with(par_monster){
    if id!=other.id{
        if obj_control.jumps>0{
            if point_distance(x,y,other.x,other.y)<50{
                if scr_checkJump()=false{
                    scr_lightning(other.x,other.y,0,x,y,0,4,6)
                    helth-=0.5*obj_control.damagemult
                    obj_control.jumps--
                    obj_control.gun0charge-=0.025
                    image_blend=_color
                    alarm[0]=3
                    scr_addJump()
                    scr_electricjump()
                }
            } 
            
            
        }else{break;}
    }
}


with(obj_crate){
    if id!=other.id{
        if obj_control.jumps>0{
            if point_distance(x,y,other.x,other.y)<50{
                if scr_checkJump()=false{
                    scr_lightning(other.x,other.y,0,x,y,0,4,6)
                    helth-=0.5*obj_control.damagemult
                    obj_control.jumps--
                    obj_control.gun0charge-=0.025
                    scr_addJump()
                    scr_electricjump()
                }
            } 
            
            
        }else{break;}
    }
}