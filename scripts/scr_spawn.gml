///scr_spawn()

/*
    More monsters spawn as the time increases on that floor
    floor number a factor on how strong the monsters are

*/

randomize()
spawnrate=abs(-2/(obj_control._floor/obj_control.moneyCheckMult))*5

if global.death_start=true{
    if !instance_exists(par_monster){
        if spawnTime<30{
            spawnrate=3
        }else{
            spawnrate=2
        }
    }
}


if spawnTime>120{
    spawnrate=1
    spawnTime=0
}


//if spawnrate<100{spawnrate=100}

if round(global.GameClock)=round(round(global.GameClock/(spawntime))*spawntime){
    spawnTime=0
    if instance_number(par_monster)<25{
        var spawntype;
        spawntype=floor((obj_control._floor/obj_control.moneyCheckMult)/5)
        if spawntype>3{spawntype=3}
        //spawntype=3
        
        switch(irandom(spawntype)){
            case 0:
                nn=instance_create(16,yspawn+32,obj_monster0)
                nn.helth=(((obj_control._floor/obj_control.moneyCheckMult)/25)*10)+3
                scr_keyspawn(nn)
                bb=instance_create(room_width-16,yspawn+32,obj_monster0)
                bb.helth=(((obj_control._floor/obj_control.moneyCheckMult)/25)*10)+3
                scr_keyspawn(bb)
                nn.monsterid=scr_monsteradd(nn)
                bb.monsterid=scr_monsteradd(bb)
                
                if instance_exists(obj_server){
                    clearbuffer()
                    writebyte(13)
                    writebyte(1)
                    writeshort(nn.x)
                    writeshort(nn.y)
                    writeshort(nn.helth)
                    writebyte(nn.key)
                    writebyte(nn.monsterid)
                    writeshort(bb.x)
                    writeshort(bb.y)
                    writeshort(bb.helth)
                    writebyte(bb.key)
                    writebyte(bb.monsterid)
                    sendmessage(global.clienttcp)
                }
            break; 
            
            case 1:
                var xx=choose(16,room_width-16);
                nn=instance_create(xx,yspawn+32,obj_monster2)
                var _imagex=(obj_control._floor/obj_control.moneyCheckMult)/25;
                _imagex+=(random_range(-0.2,0.2))
                if _imagex<0.25{_imagex=0.25}
                if _imagex>1{_imagex=1}
                nn.helth=(((obj_control._floor/obj_control.moneyCheckMult)/25)*10)+(_imagex*25)
                nn.image_xscale=_imagex
                nn.image_yscale=_imagex
                scr_keyspawn(nn)
                nn.monsterid=scr_monsteradd(nn)
                
                if instance_exists(obj_server){
                    clearbuffer()
                    writebyte(13)
                    writebyte(2)
                    writeshort(nn.x)
                    writeshort(nn.y)
                    writeshort(nn.helth)
                    writebyte(nn.key)
                    writefloat(nn.image_xscale)
                    writebyte(nn.monsterid)
                    sendmessage(global.clienttcp)
                }
            break;
            
            case 2:
                nn=instance_create(16,yspawn+32,obj_monster4)
                nn.helth=(((obj_control._floor/obj_control.moneyCheckMult)/25)*10)+3
                bb=instance_create(room_width-16,yspawn+32,obj_monster4)
                bb.helth=(((obj_control._floor/obj_control.moneyCheckMult)/25)*10)+3
                //scr_keyspawn(bb)
                nn.key=0  bb.key=0
                nn.monsterid=scr_monsteradd(nn)
                bb.monsterid=scr_monsteradd(bb)
                
                 if instance_exists(obj_server){
                    clearbuffer()
                    writebyte(13)
                    writebyte(3)
                    writeshort(nn.x)
                    writeshort(nn.y)
                    writeshort(nn.helth)
                    writebyte(nn.key)
                    writebyte(nn.monsterid)
                    writeshort(bb.x)
                    writeshort(bb.y)
                    writeshort(bb.helth)
                    writebyte(bb.key)
                    writebyte(bb.monsterid)
                    sendmessage(global.clienttcp)
                }
            break;
            
            case 3:
                nn=instance_create(16,yspawn+32,obj_monster3)
                nn.helth=(((obj_control._floor/obj_control.moneyCheckMult)/25)*10)+3
                bb=instance_create(room_width-16,yspawn+32,obj_monster3)
                bb.helth=(((obj_control._floor/obj_control.moneyCheckMult)/25)*10)+3
                scr_keyspawn(nn)
                scr_keyspawn(bb)
                nn.monsterid=scr_monsteradd(nn)
                bb.monsterid=scr_monsteradd(bb)
                
                if instance_exists(obj_server){
                    clearbuffer()
                    writebyte(13)
                    writebyte(4)
                    writeshort(nn.x)
                    writeshort(nn.y)
                    writeshort(nn.helth)
                    writebyte(nn.key)
                    writebyte(nn.monsterid)
                    writeshort(bb.x)
                    writeshort(bb.y)
                    writeshort(bb.helth)
                    writebyte(bb.key)
                    writebyte(bb.monsterid)
                    sendmessage(global.clienttcp)
                }
                
                
            break;
            
            
            
        }
        
        
    }
}else{
    spawnTime+=1
}

















/*
if irandom(spawnrate)=0{
    nn=instance_create(16,yspawn+32,obj_monster0)
    nn.helth=((obj_control._floor/obj_control.moneyCheckMult)/25)+3
    nn=instance_create(room_width-16,yspawn+32,obj_monster0)
    nn.helth=((obj_control._floor/obj_control.moneyCheckMult)/25)+3
}

if irandom(spawnrate*4)=0{
    var xx=choose(16,room_width-16);
    nn=instance_create(xx,yspawn+32,obj_monster2)
    nn.helth=((obj_control._floor/obj_control.moneyCheckMult)/25)+15
    var _imagex=(obj_control._floor/obj_control.moneyCheckMult)/25;
    if _imagex<0.25{_imagex=0.25}
    if _imagex>1{_imagex=1}
    nn.image_xscale=_imagex
    nn.image_yscale=_imagex
}
*/
