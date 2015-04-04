///scr_chunk0(x,y,obj)
/*
    _ _ _ _ _
    * * * * *
    * * * * *
    _ _ _ _ _
*/
var xxx,yyy,obj;
xxx=round(argument[0]/16)*16
yyy=round(argument[1]/16)*16
obj=argument[2]


for(nn=-32;nn<32;nn+=16){
    
    if irandom(8)=0{
        if place_free(xxx+nn,yyy-16){
            switch(irandom(2)){
                case 0:
                    if place_free(xxx+nn,yyy){instance_create(xxx+nn,yyy,obj)}
                break;
                case 1:
                    bb=instance_create(xxx+nn,yyy,obj_crate)
                    bb.sprite_index=choose(spr_crate0,spr_crate0,spr_crate0,spr_crate0,spr_crate0,spr_crate0,spr_crate0,spr_crate0,spr_crate0,spr_crate0,spr_crate1,spr_crate1,spr_crate1,spr_crate2)
                    //if bb.sprite_index=spr_crate0{bb.value=irandom_range(350,500);}
                    //if bb.sprite_index=spr_crate1{bb.value=irandom_range(500,850);}
                    //if bb.sprite_index=spr_crate2{bb.value=irandom_range(1500,2500);}
                    //if global.char=5{bb.value=bb.value*2}
                break;
                case 2:
                    bb=instance_create(xxx+nn,yyy,obj_dynamite)
                break;
                
            }
        }
    }else{if place_free(xxx+nn,yyy){instance_create(xxx+nn,yyy,obj)}}
    
    
    //don't create them on the bottom-otherwise they will fall out
    if place_free(xxx+nn,yyy+16){instance_create(xxx+nn,yyy+16,obj)}
    
    if irandom(6)=0{
        if place_free(xxx+nn,yyy-16){
            switch(irandom(2)){
                case 0:
                    randomize()
                    bb=instance_create(xxx+nn,yyy-16,obj_chest)
                    var test=irandom_range(0,15);
                    if test<13{bb.sprite_index=spr_chest0}
                    if test=13 || test=14{bb.sprite_index=spr_chest1}
                    if test=15{bb.sprite_index=spr_chest2}
                    //bb.sprite_index=choose(spr_chest0,spr_chest0,spr_chest0,spr_chest0,spr_chest0,spr_chest0,spr_chest0,spr_chest0,spr_chest0,spr_chest0,spr_chest0,spr_chest0,spr_chest1,spr_chest1,spr_chest1,spr_chest2)
                    bb.powerup=irandom_range(0,7)
                    if bb.sprite_index=spr_chest2{
                        bb.image_xscale=0.64
                        bb.image_yscale=0.72727272727272727272727272727273
                    }
                break;
                case 1:
                    instance_create(xxx+nn,yyy-16,obj)
                break;
                case 2:
                    instance_create(xxx+nn,yyy-16,obj)
                break;
            }    
        }
    }else{
        if place_free(xxx+nn,yyy-16){
            instance_create(xxx+nn,yyy-16,obj)
            if irandom(4)=0{
                if place_free(xxx+nn,yyy-32){
                    instance_create(xxx+nn,yyy-32,obj_spikes)
                }
            }
        }
    }
}
