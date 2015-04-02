//case 22
monsterid=readbyte()
if monsterid<0 || monsterid>1000{exit}
var xx,yy;
xx=readshort()
yy=readshort()
switch(readbyte()){
    
    case 2:
        if place_meeting(xx,yy,par_monster){
            nn=instance_place(xx,yy,par_monster){
                if nn!=noone{
                    with(nn){
                        if id!=other.id{
                            scr_monsterremove(id)
                            instance_destroy()
                        }
                    }
                }
            }
            
        }
    break;
    
    case 3:
        var mon=global.MonsterList[monsterid];
        //show_message(object_get_name(mon))
        if mon!=-1{
            with(mon){
                if id!=other.id{
                    scr_monsterremove(id)
                    instance_destroy()
                }
            }
        }
    break;
    

}
