///place_meeting5(x,y)

var xx=round(argument[0]/8);
var yy=round(argument[1]/8);

if instance_exists(obj_control)
&& xx>0 && yy>0
&& xx<round(room_width/8)
&& yy<round(room_height/8){
    if obj_control._Floor[xx,yy]=1{
        return true;
    }else{
        return false;
    }
    
}