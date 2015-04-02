draw_set_alpha(0.9)
draw_set_color(10979719)
draw_rectangle(15,15+yy[0],room_width-15,room_height-15+yy[0],false)

draw_set_color(13285559)
draw_rectangle(16,16+yy[0],room_width-16,room_height-16+yy[0],false)

draw_set_color(7558741)
draw_rectangle(17,17+yy[0],room_width-17,room_height-17+yy[0],false)
var canclick2=1

if obj_highscoresign.player!=-1{
//draw the blocks
_x=(room_width/2)
_y=(room_height/2)+75-16
draw_sprite(spr_tutblock,0,_x,_y+yy[3])
draw_sprite(spr_tutblock,0,_x-16,_y+yy[4])
draw_sprite(spr_tutblock,0,_x+16,_y+yy[2])
draw_sprite(spr_tutblock,0,_x+32,_y+yy[3])
draw_sprite(spr_tutblock,0,_x-32,_y+yy[5])
draw_sprite(spr_tutblock,0,_x,_y+yy[3]-16)
draw_sprite(spr_tutblock,0,_x,_y+yy[2]-32)
draw_sprite(spr_tutblock,0,_x-16,_y+yy[5]-32)
draw_sprite(spr_tutblock,0,_x+16,_y+yy[3]-32)
draw_sprite(spr_tutblock,0,_x+16,_y+yy[7]-16)
draw_sprite(spr_tutblock,0,_x-16,_y+yy[5]-16)
draw_sprite(spr_tutblock,0,_x-32,_y+yy[1]-16)
draw_sprite(spr_tutblock,0,_x+32,_y+yy[2]-16)
draw_sprite(spr_tutblock,0,_x+48,_y+yy[4]-16)
draw_sprite(spr_tutblock,0,_x-48,_y+yy[3]-16)
draw_sprite(spr_tutblock,0,_x-48,_y+yy[1])
draw_sprite(spr_tutblock,0,_x+48,_y+yy[5])
draw_sprite(spr_tutblock,0,_x-64,_y+yy[2])
draw_sprite(spr_tutblock,0,_x+64,_y+yy[3])
draw_sprite(spr_tutblock,0,_x+80,_y+yy[6])
draw_sprite(spr_tutblock,0,_x-80,_y+yy[1])

//draw the characters
draw_sprite_ext(obj_highscoresign.char[0],obj_highscoresign.jump,_x,_y+yy[5]-46-sprite_get_height(obj_highscoresign.char[0])+5-(obj_highscoresign.jump*15),2,2,0,c_white,1)
draw_sprite_ext(obj_highscoresign.char[1],0,_x-40,_y+yy[1]-30-sprite_get_height(obj_highscoresign.char[1])+5,2,2,0,c_white,1)
draw_sprite_ext(obj_highscoresign.char[2],0,_x+40,_y+yy[2]-30-sprite_get_height(obj_highscoresign.char[2])+5,2,2,0,c_white,1)
draw_sprite_ext(obj_highscoresign.char[3],0,_x-80,_y+yy[3]-14-sprite_get_height(obj_highscoresign.char[3])+5,2,2,0,c_white,1)
draw_sprite_ext(obj_highscoresign.char[4],0,_x+80,_y+yy[4]-14-sprite_get_height(obj_highscoresign.char[4])+5,2,2,0,c_white,1)
}else{
    _x=(room_width/2)
    _y=(room_height/2)+75-16+8
    draw_set_color(c_white)
    var _y2=0;
    for(i=0;i<10;i++){
        if obj_highscoresign._name[i]!=""{
            if scr_hover(_x-175,_y+yy[3]-144+_y2,_x+175,_y+yy[4]-144+_y2+15){
                draw_set_color(c_dkgray) draw_set_alpha(0.75)
                draw_rectangle(_x-175,_y+yy[3]-144+_y2,_x+175+4,_y+yy[4]-144+_y2+15,false)
                draw_set_color(c_white)
                draw_set_alpha(1)
                if mouse_check_button_released(mb_left){
                    obj_highscoresign.player=i
                    /*
                    switch(obj_highscoresign._char[i]){
                        case 0: obj_highscoresign.char[0]=spr_linus_select break;
                        case 1: obj_highscoresign.char[0]=spr_luke_select break;
                        case 2: obj_highscoresign.char[0]=spr_logan_select break;
                        case 3: obj_highscoresign.char[0]=spr_wendell_select break;
                        case 4: obj_highscoresign.char[0]=spr_pistol_select break;
                    }
                    //obj_highscoresign.pen[0]=obj_highscoresign._char[i]
                    with(obj_highscoresign){event_user(0)}
                    */
                    canclick2=false
                }
            }
            draw_set_halign(fa_left)
            draw_text_transformed(_x-175,_y+yy[3]-144+_y2,string(i+1)+". "+obj_highscoresign._name[i],.5,.5,0)
            draw_set_halign(fa_right)
            draw_text_transformed(_x+175,_y+yy[4]-144+_y2,string(scr_getnumber2(obj_highscoresign._score[i])),.5,.5,0)
            _y2+=15
        }
    }


}


_x=(room_width/2)
_y=(room_height/2)+75
draw_set_alpha(1)
draw_set_font(global.font0) 
draw_set_color(c_white)
draw_set_halign(fa_center)
if global.GamePadMouse=0{
    draw_text_transformed(_x,_y+yy[1],"Double click to Dismiss",1,1,0)
}else{
    draw_text_transformed(_x,_y+yy[1],"Press Y to Dismiss",1,1,0)
}
draw_text_transformed(_x,_y+yy[2]-150-32,"Online High Scores",1,1,0)
draw_set_halign(fa_left)
if obj_highscoresign.player!=-1{
draw_text_transformed(_x-175,_y+yy[3]-144,"Name:",.5,.5,0)
draw_text_transformed(_x-175,_y+yy[2]-128,"Score:",.5,.5,0)
draw_text_transformed(_x-175,_y+yy[2]-112,"Max Floor:",.5,.5,0)
draw_text_transformed(_x-175,_y+yy[4]-96,"Max Money:",.5,.5,0)
draw_text_transformed(_x-175,_y+yy[5]-80,"Monsters Killed:",.5,.5,0)
draw_text_transformed(_x-175,_y+yy[2]-64,"Chests Opened",.5,.5,0)
draw_set_halign(fa_right)
draw_text_transformed(_x+175,_y+yy[4]-144,string(obj_highscoresign._name[obj_highscoresign.player]),.5,.5,0)
draw_text_transformed(_x+175,_y+yy[4]-128,string(scr_getnumber2(obj_highscoresign._score[obj_highscoresign.player])),.5,.5,0)
draw_text_transformed(_x+175,_y+yy[3]-112,string(scr_getnumber2(obj_highscoresign._floor[obj_highscoresign.player])),.5,.5,0)
draw_text_transformed(_x+175,_y+yy[2]-96,string(scr_getnumber2(obj_highscoresign._money[obj_highscoresign.player])),.5,.5,0)
draw_text_transformed(_x+175,_y+yy[4]-80,string(scr_getnumber2(obj_highscoresign._monster[obj_highscoresign.player])),.5,.5,0)
draw_text_transformed(_x+175,_y+yy[1]-64,string(scr_getnumber2(obj_highscoresign._chest[obj_highscoresign.player])),.5,.5,0)
//draw_text_transformed(_x,_y+yy[1],"Double click to Dismiss",1,1,0)
draw_set_halign(fa_center)
if canclick2=true{
if global.GamePadMouse=0{
    draw_text_transformed(_x,_y+yy[1]-16,"Click to go back",1,1,0)
    if mouse_check_button_released(mb_left){obj_highscoresign.player=-1}
}else{
    draw_text_transformed(_x,_y+yy[1]-16,"Press X to go back",1,1,0)
    if gamepad_button_check_released(0,gp_face3){obj_highscoresign.player=-1}
}
}

}


draw_set_halign(fa_left)