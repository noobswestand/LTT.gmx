if NOINTERFACE=false{
var viewyy=room_height;
var mult=-1;

if global.AndriodPlay=true{
    
}else{
    draw_set_alpha(1)
    draw_set_color(c_black)
    draw_rectangle_width(0,viewyy+(16*mult),room_width-1,viewyy,2)
    draw_set_color(c_white)
    //draw_rectangle_width(1,room_height-15,room_width-2,room_height-1,2)
    draw_rectangle(1,viewyy+(15*mult),room_width-2,viewyy+(1*mult),false)
    draw_set_color(c_red)
    draw_rectangle(2,viewyy+(14*mult),(room_width-3)*(player_health/player_maxhealth),viewyy+(2*mult),false)
}

//draw a black box covering up the holes
if os_type=os_android
&& !instance_exists(par_boss){
    draw_set_color(c_black)
    draw_set_alpha(1)
    draw_rectangle(0,room_height-17,room_width,room_height,false) 
}


if player_shieldMax>0{
    draw_set_color(c_blue)
    draw_rectangle(2,viewyy+(14*mult),(room_width-3)*(player_shield/player_shieldMax),viewyy+(13*mult),false)
}



//////////////////////////////////////////////////////////////////PLAYER CHARGE BARS/////////////////////////////////////////////////////////////
if global.char=2 && _floorBoss!=_floor/moneyCheckMult{//rage
    draw_set_color(c_orange)
    draw_rectangle(2,viewyy+(14*mult),(room_width-3)*(PlayerRage/PlayerRageMax),viewyy+(13*mult),false)
    if PlayerRage=PlayerRageMax && PlayerRageMode=false{
        draw_set_color(c_white)
        draw_set_font(global.font0)
        draw_set_alpha(1)
        draw_set_halign(fa_center)
        if global.GamePadMouse=0{
            draw_text((room_width/2),(viewyy+(25*mult)),"Press Q")
        }else{
            draw_text((room_width/2),(viewyy+(25*mult)),"Press B")
        }
    }
}


if global.char=6{//slow
    draw_set_color(c_lime)
    draw_rectangle(2,viewyy+(14*mult),(room_width-3)*(PlayerSlow/PlayerSlowMax),viewyy+(13*mult),false)
    if PlayerSlow>PlayerSlowMax{PlayerSlow=PlayerSlowMax}
    if PlayerSlow=PlayerSlowMax && PlayerSlowMode=false{
        draw_set_color(c_white)
        draw_set_font(global.font0)
        draw_set_alpha(1)
        draw_set_halign(fa_center)
        if global.GamePadMouse=0{
            draw_text((room_width/2),(viewyy+(25*mult)),"Press Q")
        }else{
            draw_text((room_width/2),(viewyy+(25*mult)),"Press B")
        }
    }
}




if gun=0{
    draw_set_color(c_black)
    draw_rectangle(room_width-15,room_height-55,room_width-3,room_height-35,false)
    draw_set_color(c_aqua)
    draw_rectangle(room_width-13,room_height-37,room_width-5,room_height-(37+(16*(gun0charge/gun0chargeMax))),false)
}
if gun=2{
    draw_set_color(c_black)
    draw_rectangle(room_width-15,room_height-55,room_width-3,room_height-35,false)
    draw_set_color(1968)
    draw_rectangle(room_width-13,room_height-37,room_width-5,room_height-(37+(16*(heat/Maxheat))),false)
}

if gun=1{
    if tntGunAmount>tntGunAmountMax{
        tntGunAmount=tntGunAmountMax
    }
    if tntGunAmount<0{
        tntGunAmount=0
    }
    draw_set_alpha(1)
    draw_set_color(c_black)
    draw_rectangle(room_width-15,room_height-55,room_width-3,room_height-35,false)
    draw_set_color(3752778)
    if tntGunAmount>0{
        draw_rectangle(room_width-13,room_height-37,room_width-5,room_height-(37+(16*(tntGunAmount/tntGunAmountMax))),false)
    }else{
        if alarm[10]=-1{
            tntGunFlash=!tntGunFlash
            alarm[10]=room_speed/2
        }
        if tntGunFlash=1{
            draw_set_color(c_red)//1342
            draw_rectangle(room_width-13,room_height-37,room_width-5,room_height-(37+(16*(tntGunAmountMax/tntGunAmountMax))),false)
        }
    }
}
}

if global.keyGot=true{
    draw_set_color(c_ltgray)
    draw_set_alpha(1)
    var __yy=-25//-5
    draw_rectangle(2,room_height-40+__yy,18,room_height-20+__yy,false)
    draw_sprite_ext(spr_key,0,10,room_height-30+__yy,2,2,0,c_white,1)
    with(obj_player){
        draw_sprite(spr_key,0,x,y-(sprite_get_height(sprite_index)-sprite_get_yoffset(sprite_index)))
    }
}


if obj_control.gun!=-1{
    gunpickupAlpha+=(gunpickup-gunpickupAlpha)/3
    draw_set_alpha(gunpickupAlpha)
    draw_set_color(c_white)
    draw_set_font(global.font0)
    draw_set_halign(fa_center)
    if global.GamePadMouse=0{
        draw_text_ext_transformed(obj_player.x,obj_player.y-50,"Press "+string(chr(obj_tuthelp.key[3]))+" to switch weapons",20,150,.3,.3,0)
    }else{
        draw_text_ext_transformed(obj_player.x,obj_player.y-50,"Press X to switch weapons",20,150,.3,.3,0)
    }
    draw_set_alpha(1)
}

if NOINTERFACE=false{
var viewyy=room_height;
var mult=-1;
if global.AndriodPlay=false{
    draw_set_color(c_white)
    draw_set_font(global.font0)
    draw_set_halign(fa_right)
    draw_text_transformed(room_width-5,viewyy+(23*mult),string(scr_getnumber(round((obj_player.y/4)+((_floor/moneyCheckMult)*68))))+"M",0.5,0.5,0)
    draw_text_transformed(room_width-5,viewyy+(33*mult),"Floor "+string(scr_getnumber(_floor/moneyCheckMult)),0.5,0.5,0)
    draw_set_halign(fa_left)//ScoreMult
    draw_text_transformed(0,(viewyy+(20*mult))-(moneyScale*3),"$"+string(scr_getnumber(round(money/moneyCheckMult))),0.5*moneyScale,0.5*moneyScale,0)
    if pScoreMult!=ScoreMult{
        pScoreMult=ScoreMult
        ScoreMultC=choose(c_white,c_red,c_blue,c_green,c_purple,c_orange,c_yellow)
        ScoreMultR=irandom_range(-20,20)
        ScoreMultS=5
    }
    if pScore!=round(Score/moneyCheckMult){
        Score+=(abs(pScore-round(Score/moneyCheckMult))*(ScoreMult-1))*moneyCheckMult
        pScore=round(Score/moneyCheckMult)
        ScoreS=2
    }
    ScoreMultS+=(1-ScoreMultS)/7
    ScoreS+=(1-ScoreS)/3
    draw_set_color(ScoreMultC)
    draw_set_valign(fa_center)
    draw_set_halign(fa_center)
    draw_text_transformed(10,(viewyy+(20*mult))-(ScoreMultS*3)-15,string(ScoreMult)+"x",0.75*ScoreMultS,0.75*ScoreMultS,ScoreMultR)
    draw_set_color(c_white)
    draw_set_halign(fa_left)
    draw_text_transformed(25,(viewyy+(20*mult))-(ScoreS*3)-12,string(scr_getnumber(round(Score/moneyCheckMult))),0.5*ScoreS,0.5*ScoreS,0)
    draw_set_valign(fa_top)
    
}else{
    viewyy=0
    draw_set_color(c_white)
    draw_set_font(global.font0)
    draw_set_halign(fa_left)
    draw_text_transformed(5,viewyy,string(scr_getnumber2(round((obj_player.y/4)+((_floor/moneyCheckMult)*68))))+"M",0.5,0.5,0)
    draw_text_transformed(5,viewyy+15,"Floor "+string(scr_getnumber(_floor/moneyCheckMult)),0.5,0.5,0)
    draw_set_halign(fa_right)
    draw_text_transformed(room_width-5,viewyy,"Health: "+string(round(((player_health/player_maxhealth)*100)))+"%",0.5,0.5,0)
    draw_text_transformed(room_width-5,(viewyy+15)-(moneyScale*3),string(scr_getnumber(money/moneyCheckMult))+"$",0.5*moneyScale,0.5*moneyScale,0)
    draw_set_halign(fa_left)
}


}
