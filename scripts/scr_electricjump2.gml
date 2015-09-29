with(par_monster){
    if id!=other.id{
        if obj_client2.jumps>0 && obj_client2.gun0charge>0{
            if point_distance(x,y,other.x,other.y)<50{
                if scr_checkJump2()=false{
                    scr_lightning(other.x,other.y,0,x,y,0,4,6)
                    //helth-=3
                    obj_client2.jumps--
                    obj_client2.gun0charge-=025
                    image_blend=_color
                    alarm[0]=3
                    scr_addJump2()
                    scr_electricjump2()
                }
            } 
            
            
        }else{break;}
    }
}

with(obj_crate){
    if id!=other.id{
        if obj_client2.jumps>0{
            if point_distance(x,y,other.x,other.y)<50{
                if scr_checkJump2()=false{
                    scr_lightning(other.x,other.y,0,x,y,0,4,6)
                    helth-=0.5
                    obj_client2.jumps--
                    obj_client2.gun0charge-=0.025
                    scr_addJump2()
                    scr_electricjump2()
                }
            } 
            
            
        }else{break;}
    }
}
