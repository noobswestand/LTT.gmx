///ucase_updateMonsters()
//case 14

monstpid=readbyte()
monstid=readbyte()
global.tempvar=-1
if monstid<0 or monstid>100{exit}
if global.MonsterList[monstid]=-1{exit}

switch(monstpid){
    
    case 1:
        var mon=global.MonsterList[monstid];
        if !instance_exists(mon){exit}
        if mon=-1{exit}
        
        mon.hspeed=(readbyte())-15
        mon.vspeed=(readbyte())-15
        mon.x=readshort()
        mon.y=readshort()
        
        with(mon){
            hspeed=hspeed*scr_speedCalc()
            vspeed=vspeed*scr_speedCalc()
        }
        
    break;
    
    case 3:
        var mon=global.MonsterList[monstid];
        if !instance_exists(mon){exit}
        if mon=-1{exit}
        //show_message(object_get_name(mon.object_index))
        mon.targ=readbyte()
        //show_message(mon.targ)
        var xx,yy;
        xx=readshort()
        yy=readshort()
        mon.direction=readshort()
        if point_distance(mon.x,mon.y,xx,yy)>25{
            //show_message(point_distance(mon.x,mon.y,xx,yy))
            mon.x=xx
            mon.y=yy
            global.tempvar=mon
            with(obj_monster2_1){
                if master=global.tempvar{
                    x=global.tempvar.x
                    y=global.tempvar.y
                }
            }
        }
    break;
    
    case 4:
        var tmp=readbyte();
        
        if tmp=1{
            var mon=global.MonsterList[monstid];
            if !instance_exists(mon){exit}
            if mon=-1{exit}
            mon.hspeed=readbyte()-15
            mon.vspeed=readbyte()-15
            mon.x=readshort()
            mon.y=readshort()
            with(mon){
                hspeed=hspeed*scr_speedCalc()
                vspeed=vspeed*scr_speedCalc()
            }
        }
        if tmp=2{
            var mon=global.MonsterList[monstid];
            if !instance_exists(mon){exit}
            if mon=-1{exit}
            mon.x=readshort()
            mon.y=readshort()
            nn=instance_create(mon.x,mon.y,obj_monster3_bullet)
            nn.direction=readshort()
            nn.speed=readfloat()
            mon.image_xscale=(readbyte()-5)*0.75
        }
        
    break; 
    
    
    
    case 5:
        var tmp=readbyte()
        if tmp=1{
            var mon=global.MonsterList[monstid];
            if mon=-1{exit}
            if !instance_exists(mon){exit}
            mon.player=readbyte()
            var xx,yy;
            xx=readshort()
            yy=readshort()
            if point_distance(mon.x,mon.y,xx,yy)>25{
                mon.x=xx
                mon.y=yy
            }
        }
        if tmp=2{
            var mon=global.MonsterList[monstid];
            if mon=-1{exit}
            if !instance_exists(mon){exit}
            var mount=readbyte();
            if mount<=0{exit}
            if path_exists(mon.path){path_delete(mon.path)}
            mon.path=path_add()
            for(i=0;i<mount;i+=1){
                xx=readshort()
                yy=readshort()
                path_add_point(mon.path,xx,yy,100)
            }
            path_set_kind(mon.path,1)
            path_set_closed(mon.path,0)
            mon.path_point=0
            mon.alarm[9]=1
            mon.alarm[10]=1
            
        }
    if tmp=3{
        var mon=global.MonsterList[monstid];
        if mon=-1{exit}
        if !instance_exists(mon){exit}
        mon.alarm[4]=1
        mon.blow=true
    }
    break;
}
