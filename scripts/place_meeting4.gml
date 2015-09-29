///place_meeting4(obj)
/*
    DOES NOT WORK--maybe will be useful some time later
*/
obj0=self.id
obj1=argument[0].id
var xxoff0,yyoff0,xxoff1,yyoff2;
var ww0,hh0,ww1,hh1;

//ww0=sprite_get_bbox_right(obj0.sprite_index)-sprite_get_bbox_left(obj0.sprite_index)
//hh0=sprite_get_bbox_bottom(obj0.sprite_index)-sprite_get_bbox_top(obj0.sprite_index)
xxoff0=sprite_get_xoffset(obj0.sprite_index)
yyoff0=sprite_get_yoffset(obj0.sprite_index)

ww1=sprite_get_bbox_right(obj1.sprite_index)-sprite_get_bbox_left(obj1.sprite_index)
hh1=sprite_get_bbox_bottom(obj1.sprite_index)-sprite_get_bbox_top(obj1.sprite_index)
xxoff1=sprite_get_xoffset(obj1.sprite_index)
yyoff1=sprite_get_yoffset(obj1.sprite_index)


if obj0.x>obj1.x
&& obj0.y>obj1.y
&& obj0.x<obj1.x+ww1
&& obj0.y>obj1.y+hh1{
    return true;
}

return false;
