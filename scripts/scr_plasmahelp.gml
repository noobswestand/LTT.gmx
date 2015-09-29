draw_set_alpha(0.9)
draw_set_color(10979719)
draw_rectangle(15,15+yy[0],room_width-15,room_height-15+yy[0],false)

draw_set_color(13285559)
draw_rectangle(16,16+yy[0],room_width-16,room_height-16+yy[0],false)

draw_set_color(7558741)
draw_rectangle(17,17+yy[0],room_width-17,room_height-17+yy[0],false)

draw_set_alpha(1)
draw_set_font(global.font0) 
draw_set_color(c_white)
draw_set_halign(fa_center)
var _x,_y;
_x=(room_width/2)-150
_y=(room_height/2)-75
draw_text_transformed(_x,_y+yy[1],"Charge",.5,.5,0)
draw_set_color(c_black)
draw_set_alpha(0.9)
draw_rectangle(_x-64,_y+yy[2]+32,_x+64,_y+yy[2]+128,false)

_x=(room_width/2)
_y=(room_height/2)-75
draw_set_color(c_white)
draw_set_alpha(1)
draw_text_transformed(_x,_y+yy[4],"Input",.5,.5,0)
draw_set_color(c_black)
draw_set_alpha(0.9)
draw_rectangle(_x-64,_y+yy[5]+32,_x+64,_y+yy[5]+128,false)

draw_sprite_ext(spr_sign2,0,_x,_y+yy[6]+78+2,2,2,0,c_white,1)
draw_sprite_ext(spr_mouseleftclick,0,_x,_y+yy[7]+78+2,2,2,0,c_white,1)


draw_set_alpha(1)
draw_set_color(c_white)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
var _x,_y;
_x=(room_width/2)-64-16-7
_y=(room_height/2)+8
draw_text_transformed(_x,_y+yy[3]-8,"+",2,2,0)
draw_text_transformed(_x+128+24,_y+yy[3]-8,"=",2,2,0)
draw_set_valign(fa_top)



_x=(room_width/2)-150
_y=(room_height/2)-75
draw_sprite_ext(spr_nitrotut,0,_x,_y+yy[7]+78+2,1,1,0,c_white,1)




_x=(room_width/2)+150
_y=(room_height/2)-75
draw_set_color(c_white)
draw_set_alpha(1)
draw_text_transformed(_x,_y+yy[1],"BOOM!",.5,.5,0)
draw_set_color(c_black)
draw_set_alpha(0.9)
draw_rectangle(_x-64,_y+yy[2]+32,_x+64,_y+yy[2]+128,false)
draw_sprite_ext(spr_boom1tut,0,_x,_y+yy[3]+64+16,1,1,0,c_white,1)

_x=(room_width/2)
_y=(room_height/2)+75
draw_set_color(c_white)
draw_set_alpha(1)
if global.GamePadMouse=0{
    draw_text_transformed(_x,_y+yy[1],"Double click to Dismiss",1,1,0)
}else{
    draw_text_transformed(_x,_y+yy[1],"Press Y to Dismiss",1,1,0)
}
draw_text_transformed(_x,_y+yy[2]-150-32,"HELP",1,1,0)
