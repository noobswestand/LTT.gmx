//case 20
var guntype=readbyte();
switch(guntype){
    
    case 1:
        var dir=readshort();
        var xx,yy;
        xx=readshort()
        yy=readshort()
        nn=instance_create(xx,yy,obj_bullet1)
        nn.direction=dir
        nn.speed=readbyte()-10
        nn.alarm[1]=readshort()
        obj_client2.gunshovel=1
        audio_play_sound(snd_shoot1,2,0)
    break;
    
    case 3:
        var dir=readshort();
        var xx,yy;
        xx=readshort()
        yy=readshort()
        nn=instance_create(xx,yy,obj_bullet3)
        nn.direction=dir;
        nn.speed2=readbyte()-10
        nn.damage=readbyte()
        nn.image_xscale=readfloat()-25
        nn.image_yscale=readfloat()-25
        obj_client2.gunshovel=1
        audio_play_sound(choose(snd_rocket0,snd_rocket1,snd_rocket2),2,0)
    break;
    
    case 4:
        audio_stop_sound(snd_charge)
        audio_play_sound(choose(snd_plasm0,snd_plasm1,snd_plasm2,snd_plasm3),3,0)
        var dir=readshort();
        var xx,yy;
        xx=readshort()
        yy=readshort()
        nn=instance_create(xx,yy,obj_bullet4)
        nn.direction=dir;
        nn.speed=readbyte()
        nn.speed2=readbyte()
        nn.image_xscale=readfloat()-20
        nn.image_yscale=readfloat()-20
        nn.damage=readfloat()
        obj_client2.push=-3
        obj_client2.movespeed=1.5
        obj_client2.jumpheight=7
        obj_client2.canshoot=false
        obj_client2.alarm[4]=60
    break;

}