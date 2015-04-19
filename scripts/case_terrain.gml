var blockamount=readshort()
repeat(blockamount){
    var xx,yy,blockid;
    xx=readshort()
    yy=readshort()
    blockid=readbyte()
    nn=instance_create2(xx,yy,"obj_block"+string(blockid))
}

var chestamount=readshort()
repeat(chestamount){
    var xx,yy,blockid;
    xx=readushort()
    yy=readushort()
    blockid=readbyte()
    nn=instance_create(xx,yy,obj_chest)
    if blockid=0{nn.sprite_index=spr_chest0}
    if blockid=1{nn.sprite_index=spr_chest1}
    if blockid=2{nn.sprite_index=spr_chest2
        nn.image_xscale=0.64
        nn.image_yscale=0.72727272727272727272727272727273
    }
}


var crateamount=readshort()
repeat(crateamount){
    var xx,yy,blockid;
    xx=readushort()
    yy=readushort()
    blockid=readbyte()
    nn=instance_create(xx,yy,obj_crate)
    if blockid=0{nn.sprite_index=spr_crate0}
    if blockid=1{nn.sprite_index=spr_crate1}
    if blockid=2{nn.sprite_index=spr_crate2}
    nn.value=readushort()
}


var tntamount=readshort()
repeat(tntamount){
    var xx,yy,blockid;
    xx=readushort()
    yy=readushort()
    nn=instance_create(xx,yy,obj_dynamite)
}

var sentryAmount=readshort()
repeat(sentryAmount){
    var xx,yy,angle,tmp,monsID;
    xx=readushort()
    yy=readushort()
    tmp=readbyte()-5;
    angle=readshort()
    monsID=readbyte()
    var obj=obj_monster6
    switch(tmp){
        case 0:
            obj=obj_monster6
        break;
        case 1:
            obj=obj_monster7
        break;
        case 2:
            obj=obj_monster8
        break;
    }
    nn=instance_create(xx,yy,obj)
    nn.image_angle=angle
    nn.monsterid=monsID
    global.MonsterList[nn.monsterid]=nn
}
var spikeAmount=readshort()
repeat(spikeAmount){
    var xx,yy;
    xx=readushort();
    yy=readushort();
    nn=instance_create(xx,yy,obj_spikes)
}

var gunh=readshort()
if obj_control._floor=1{
    instance_create(room_width/2,gunh,choose(obj_gun0,obj_gun1,obj_gun3,obj_gun4,obj_gun2))
    //instance_create(room_width/2,gunh,obj_gun0)
}



obj_control.alarm[9]=1