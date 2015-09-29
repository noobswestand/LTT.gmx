///case_message_ping()
if instance_exists(obj_server){
    obj_server.ping_reply=current_time-obj_server.ping_current2
    obj_server.alarm[2]=room_speed
}else{
    obj_client.ping_reply=current_time-obj_client.ping_current2
    obj_client.alarm[2]=room_speed
}
var mon=readdouble()
if mon>0{
    obj_client2.money=mon
}
