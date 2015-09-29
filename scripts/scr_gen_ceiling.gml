///scr_gen_ceiling(maxHieght)
var mat=scr_chooseblock();

var _height=round(irandom_range(16,argument[0])/16)*16

for(i=16;i<(room_width/2);i+=16){
    if irandom(2)=0{
        _height+=(choose(-16,16,-32,32))
        if _height<=16{starth=32}
        if _height>96{starth=96}
    }
    for(a=0;a<_height/2;a+=16){
        var crate=false;
        if a+16<_height/2{
            if irandom(15)=0{
                cho=irandom(4)
                crate=choose(1,2)
                if cho=0 or cho=1 or cho=2 or cho=3{if place_free(i,a) && place_free((room_width-16)-i,a){
                    if crate=1{bb=instance_create(i,a,obj_crate)}
                    else{bb=instance_create((room_width-16)-i,a,obj_crate)}
                    bb.sprite_index=choose(spr_crate0,spr_crate0,spr_crate0,spr_crate0,spr_crate0,spr_crate0,spr_crate0,spr_crate0,spr_crate0,spr_crate0,spr_crate0,spr_crate1,spr_crate1,spr_crate1,spr_crate2)
                    if bb.sprite_index=spr_crate0{bb.value=irandom_range(350,500);}
                    if bb.sprite_index=spr_crate1{bb.value=irandom_range(500,850);}
                    if bb.sprite_index=spr_crate2{bb.value=irandom_range(1500,2500);}
                    //if global.char=5{bb.value=bb.value*2}
                }else{crate=0}}
                if cho=4{
                    if place_free(i,a) && place_free((room_width-16)-i,a){
                        if crate=1{instance_create(i,a,obj_dynamite)}
                        else{instance_create((room_width-16)-i,a,obj_dynamite)}
                    }else{crate=0}
                }
            }
        }
        if place_free(i,a) && crate!=1{instance_create(i,a,mat)}
        if place_free((room_width-16)-i,a) && crate!=2{instance_create((room_width-16)-i,a,mat)}
    }
}
//add variance
