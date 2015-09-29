monster=readbyte()
switch(monster){
    case 1:
        repeat(2){
            var xx,yy;
            xx=readshort()
            yy=readshort()
            nn=instance_create(xx,yy,obj_monster0)
            nn.helth=readshort()
            nn.key=readbyte()
            nn.monsterid=readbyte()
            global.MonsterList[nn.monsterid]=nn
        }
    break;
    
    
    case 2:
        var xx,yy;
        xx=readshort()
        yy=readshort()
        nn=instance_create(xx,yy,obj_monster2)
        nn.helth=readshort()
        nn.key=readbyte()
        var scale=readfloat();
        nn.image_xscale=scale
        nn.image_yscale=scale
        nn.monsterid=readbyte()
        global.MonsterList[nn.monsterid]=nn
    break;
    
    case 3:
        repeat(2){
            var xx,yy;
            xx=readshort()
            yy=readshort()
            nn=instance_create(xx,yy,obj_monster4)
            nn.helth=readshort()
            nn.key=readbyte()
            nn.monsterid=readbyte()
            global.MonsterList[nn.monsterid]=nn
        }
    break;
    
    case 4:
        repeat(2){
            var xx,yy;
            xx=readshort()
            yy=readshort()
            nn=instance_create(xx,yy,obj_monster3)
            nn.helth=readshort()
            nn.key=readbyte()
            nn.monsterid=readbyte()
            global.MonsterList[nn.monsterid]=nn
        }
    break;
}
