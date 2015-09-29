///scr_chunk1()
//Places sentries

if obj_control._floor/obj_control.moneyCheckMult>=10{
    var sen=obj_monster6;
    if obj_control._floor/obj_control.moneyCheckMult<13{
        var sen=obj_monster6;
    }else{
        if obj_control._floor/obj_control.moneyCheckMult<16{
            var sen=choose(obj_monster6,obj_monster7);
        }else{
            var sen=choose(obj_monster6,obj_monster7,obj_monster8);
        }
    }
    
    var xxx,yyy,obj;
    xxx=round(argument[0]/16)*16
    yyy=round(argument[1]/16)*16
    if place_free(xxx,yyy){
        nn=instance_create(xxx,yyy,sen)
        nn.monsterid=scr_monsteradd(nn)
    }
}
