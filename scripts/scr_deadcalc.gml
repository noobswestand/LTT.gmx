if point_distance(obj_player.x,obj_player.y,obj_client2.x,obj_client2.y)<100{
    xx=obj_player.x-(view_wview/2)
    yy=obj_player.y-(view_hview/2)
    view_wview+=(240-view_wview)/3
    view_hview+=(136-view_hview)/3
    view_xview+=(xx-view_xview)/2
    view_yview+=(yy-view_yview)/2
    
}else{
    xx=0
    yy=0
    view_wview+=(480-view_wview)/3
    view_hview+=(272-view_hview)/3
    view_xview+=(xx-view_xview)/2
    view_yview+=(yy-view_yview)/2
}