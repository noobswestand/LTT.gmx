///ucase_pos()
//case 0

if instance_exists(obj_client2){
    obj_client2._left=readbyte()
    obj_client2._right=readbyte()
    obj_client2._up=readbyte()
    var xx=readshort();
    var yy=readshort();
    if point_distance(xx,yy,obj_client2.x,obj_client2.y)>20{
        obj_client2.x=xx
        obj_client2.y=yy
    }
}
