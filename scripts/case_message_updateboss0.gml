///case_message_updateboss0()
//case 23
if instance_exists(obj_boss0){
    obj_boss0.alarm[11]=room_speed*5
}
switch(readbyte()){
    
    case 1://create the boss
        if !instance_exists(obj_boss0){
            var xx=readshort();
            var yy=readshort();
            nn=instance_create(xx,yy,obj_boss0)
            nn.monsterid=readbyte()
            obj_control.alarm[7]=-1
        }
    break;
    
    case 2://set an alarm
        var alrm=readbyte();
        var time=readshort();
        obj_boss0.alarm[alrm]=time
        obj_boss0.image_index=1
    break;
    
    case 3://updating speeds
    if instance_exists(obj_boss0){
        obj_boss0.hspeed=readfloat()
        obj_boss0.vspeed=readfloat()
        var xx,yy;
        xx=readshort()
        yy=readshort()
        if point_distance(xx,yy,obj_boss0.x,obj_boss0.y)>25{
            obj_boss0.x=xx
            obj_boss0.y=yy
        }
        }
    break;
    
    case 4://update the scales
        if instance_exists(obj_boss0){
        obj_boss0.image_xscale=readfloat()
        }
    break;
    
    case 5:
        if instance_exists(obj_boss0){
            obj_boss0.helth=readshort()
            obj_boss0.maxhelth=readshort()
        }
    break;
    
    
}
