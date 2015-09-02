var iii,iiii;
iii=0
iiii=3
for(i=0;i<6;i+=1){
    
    //tween
    if _tweenLine>i{
        //if _liner[i]=0{iii+=1}else{iiii+=1}
        if i<3{
            _linex[i]+=((200-(i*55))-_linex[i])/4
        }else{
            _linex[i]+=((500-(i*55))-_linex[i])/4
        }
    }
    _tweenLine+=0.05
}
//draw the background
var yy,xx;
xx=0
yy=0

//1
for(a=0;a<6;a+=1){
    var i;
    if a=0{i=3}//
    if a=1{i=0}//
    if a=2{i=4}////////
    if a=3{i=1}//0/////
    if a=4{i=5}////////
    if a=5{i=2}//5
    //i=3;
    draw_set_color(c_black)
    draw_set_alpha(0.1)
    draw_rectangle_rotated(_linex[i]+xx-4,_liney[i]-25-4,_linex[i]+xx+35+4,_liney[i]+(room_height*4)+4,_liner[i],0,0,false)
    draw_set_alpha(0.25)
    draw_rectangle_rotated(_linex[i]+xx-3,_liney[i]-25-3,_linex[i]+xx+35+3,_liney[i]+(room_height*4)+3,_liner[i],0,0,false)
    draw_set_alpha(0.35)
    draw_rectangle_rotated(_linex[i]+xx-2,_liney[i]-25-2,_linex[i]+xx+35+2,_liney[i]+(room_height*4)+2,_liner[i],0,0,false)
    draw_set_alpha(0.5)
    draw_rectangle_rotated(_linex[i]+xx-1,_liney[i]-25-1,_linex[i]+xx+35+1,_liney[i]+(room_height*4)+1,_liner[i],0,0,false)
    
    draw_set_color(_linec[i])
    draw_set_alpha(1)
    draw_rectangle_rotated(_linex[i]+xx,_liney[i]-25,_linex[i]+xx+35,_liney[i]+(room_height*4),_liner[i],0,0,false)

}






/////////////////////////////////DRAW POWERUPS/////////////////////////////////////
var xx,yy;
xx=300
yy=250
for(i=0;i<1000;i++){
    if PowerCount[i]!=-1{
        if PowerCountNum>i{
            
            //play sound
            if PowerCountShow[i]=false{
                audio_play_sound(snd_PowerUpDead,3,0)
                PowerCountShow[i]=true
            }else{
                draw_sprite_stretched(PowerCountS[i],0,xx,yy,35,35)
                xx+=45
                if xx>300+550{xx=300 yy+=45}
            }
            
            
        }
    }else{
        if i!=0{
            if PowerCountShow[i-1]=true{
                //start the Options
                DrawDeathOptions=true
            }
        }else{
            DrawDeathOptions=true
        }
        break;
    }
}

PowerCountNum+=PowerCountNum2
PowerCountNum2+=0.001


if gamepad_button_check_released(0,gp_padu){
    DeathSelect0--
    if DeathSelect0<0{DeathSelect0=2}
}

if gamepad_button_check_released(0,gp_padd){
    DeathSelect0++
    if DeathSelect0>2{DeathSelect0=0}
}



///////////////////////////////////////////////////OPTIONS///////////////////////////////////////////////////
var gui_width=960
var gui_height=544
///DeathOptions0
for(i=0;i<3;i+=1){
        
    if DrawDeathOptions=true{
        //tween
        if tweenDeathOp>i+2 && DeathOp0Select=-1{
            DeathOpy[i]+=(0-DeathOpy[i])/4
            DeathOpa[i]+=(1-DeathOpa[i])/4
        }else{
            DeathOpy[i]+=(50-DeathOpy[i])/4
            DeathOpa[i]+=(0-DeathOpa[i])/4
        }
        tweenDeathOp+=0.05
    }else{
        tweenDeathOp=0
        DeathOpy[i]+=(50-DeathOpy[i])/4
        DeathOpa[i]+=(0-DeathOpa[i])/4
    }
    
    
    //draw the background
    draw_set_color(1776411)
    draw_set_alpha(DeathOpa[i])
    var yy,xx;
    xx=gui_width/2
    yy=(gui_height/2)-150+(i*150);
    //draw the text
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    draw_set_font(fnt_norm)
    draw_set_color(c_white)
    draw_text(xx+DeathOpx[i],yy+DeathOpy[i],DeathOp[i])
    draw_set_valign(fa_top)
    var xxx,yyy,www,hhh;
    xxx=xx+DeathOpx[i]
    yyy=yy+DeathOpy[i]
    www=string_width(DeathOp[i])
    hhh=string_height(DeathOp[i])
        ///GamePad///
    if DeathSelect0=i && global.GamePadMouse=1{
        draw_rectangle_width(xxx-(www/2)-5,yyy-(hhh/2)-5,xxx+(www/2)+5,yyy+(hhh/2)+2,5)
        if gamepad_button_check_released(0,gp_face3){
                switch(i){
                    case 0:
                        audio_stop_all()
                        game_restart()
                    break;    
                    case 1:
                        global.SubmitScores=false
                        player_health=player_maxhealth
                        gunshovel=0
                        obj_player.canmove=true
                        canshoot=true
                        canshovel=true
                        obj_player.image_angle=0
                        obj_player.friction=0
                        obj_player.y-=16
                        player_justdied=true
                        shovelanimate=false
                        shovel=0
                        gun=GunPrevious
                        alarm[3]=1
                        global.death_y=-500
                        global.GunShovelToggle=0
                        part_system_automatic_update(global.ps2,true)
                        audio_stop_sound(snd_dead)
                        audio_resume_sound(obj_sound.currentMainSound)
                        with(par_monster){canmove=1}
                        if instance_exists(obj_block3){
                             global.keyGot=true
                        }
                        view_xview=0
                        view_yview=0
                        view_wview=480
                        view_hview=272
                        for(a=0;a<1000;a++){
                            PowerCountShow[a]=false
                        }
                        PowerCountNum=0
                        PowerCountNum2=0.01
                        DrawDeathOptions=false
                        
                    break;
                    case 2:
                        game_end()
                    break;
            }
        }
    }
    
    
    
    if scr_click3(xxx-(www/2),yyy-(hhh/2),xxx+(www/2),yyy+(hhh/2)){
        switch(i){
            case 0:
                audio_stop_all()
                game_restart()
            break;    
            case 1:
                global.SubmitScores=false
                player_health=player_maxhealth
                gunshovel=0
                obj_player.canmove=true
                canshoot=true
                canshovel=true
                obj_player.image_angle=0
                obj_player.friction=0
                obj_player.y-=16
                player_justdied=true
                shovelanimate=false
                shovel=0
                gun=GunPrevious
                alarm[3]=1
                global.death_y=-500
                global.GunShovelToggle=0
                part_system_automatic_update(global.ps2,true)
                audio_stop_sound(snd_dead)
                audio_resume_sound(obj_sound.currentMainSound)
                with(par_monster){canmove=1}
                if instance_exists(obj_block3){
                     global.keyGot=true
                }
                view_xview=0
                view_yview=0
                view_wview=480
                view_hview=272
                for(a=0;a<1000;a++){
                    PowerCountShow[a]=false
                }
                PowerCountNum=0
                PowerCountNum2=0.01
                DrawDeathOptions=false
                
            break;
            case 2:
                game_end()
            break;
            
        }
    }
    www=250
    draw_line_width((xxx-(www/2)*DeathOpa[i]),yyy+(hhh/2),(xxx+(www/2)*DeathOpa[i]),yyy+(hhh/2),3)
    
}
