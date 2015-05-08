if global.ONLINE=true && instance_exists(obj_client2){
    if obj_client2.dead=true && player_health>0{
        scr_revive()
        draw_set_color(c_black)
        draw_set_alpha(1)
        draw_rectangle(obj_client2.x-8,obj_client2.y-8,obj_client2.x+8,obj_client2.y-4,false)
        draw_set_color(c_ltgray)
        draw_rectangle(obj_client2.x-7,obj_client2.y-7,obj_client2.x-7+(14*(obj_client2.deadCharge/obj_client2.deadChargeMax)),obj_client2.y-5,false)
    }
}

if player_health<=0 && global.ONLINE=true{player_health=0
    if obj_client2.deadCharge>=obj_client2.deadChargeMax{
        player_health+=50
        obj_client2.deadCharge=0
        obj_client2.deadChargeMax+=50
        obj_client2.getHealed=false
        gunshovel=0
        obj_player.canmove=true
        canshoot=true
        obj_player.image_angle=0
        obj_player.friction=0
        obj_player.y-=16
        player_justdied=true
        view_xview=0
        view_yview=0
        view_wview=480
        view_hview=272
        exit
    }
    obj_player.canmove=false
    gunshovel=2
    obj_player.sprite_index=obj_player.spr_idle
    obj_player.image_index=0
    obj_player.image_angle=90
    obj_player.friction=0.1
    draw_set_color(c_red)
    draw_set_alpha(1)
    draw_set_font(global.font0)
    draw_set_halign(fa_center)
    draw_set_valign(fa_top)
    draw_text_transformed(obj_player.x+random_range(-1,1),obj_player.y-40+random_range(-1,1),"Waiting on Pal!",1,1,0)
    scr_deadcalc()
    canshoot=false
    if player_justdied=true{scr_unlockPlayerDown(7,1)//Unlock
        obj_player.vspeed=-7
        clearbuffer()
        writebyte(28)
        writestring("dead")
        writeshort(obj_player.x)
        writeshort(obj_player.y)
        sendmessage(global.clienttcp)
        player_justdied=false
        if !place_free(obj_player.x+8,obj_player.y){
            obj_player.hspeed=-3
        }else{
            obj_player.hspeed=3
        }
    }
}

//dead test
if global.ONLINE=true{
if player_health<=0
&& obj_client2.dead=true{
    global.ONLINE=false
    with(obj_client2){instance_destroy()}
    if instance_exists(obj_server){with(obj_server){instance_destroy()}}else{with(obj_client){instance_destroy()}}
    view_xview=0
    view_yview=0
    view_wview=480
    view_hview=272
}
}


if player_health<=0 && global.ONLINE=false{
    room_speed=15
    draw_set_color(c_black)
    draw_set_alpha(0.8)
    draw_rectangle(0,0,room_width,room_height,0)
    obj_player.canmove=false
    obj_player.sprite_index=obj_player.spr_idle
    obj_player.image_index=0
    obj_player.image_angle=90
    //sprite_collision_mask(obj_player.spr_idle,0,2,5,7,8,10,1,0)
    obj_player.friction=0.1
    if player_justdied=true{scr_unlockPlayerDown(7,1)//Unlock
        GunPrevious=gun
        alarm[4]=room_speed*4
        obj_player.vspeed=-7
        
        if !place_free(obj_player.x+8,obj_player.y){
            obj_player.hspeed=-3
        }else{
            obj_player.hspeed=3
        }
        obj_player.depth=-9999
        
        player_justdied=false
        //sound_stop_all()
        //with(obj_sound){event_user(0)}
        //sound_volume(snd_dead,0.7)
        //sound_play(snd_dead)
        audio_pause_sound(obj_sound.currentMainSound)
        //audio_stop_all()
        audio_play_sound(snd_dead,1,1)
        
        
        with(obj_spawn){instance_destroy()}
        /*
        get_string("adfasdf","http://65.29.167.233:82/highscore.php?"+encrypt("act")+"="+encrypt("Submit")+"&"+encrypt("name")+"="+string(encrypt(global.PlayerName))+
        "&"+encrypt("score")+"="+encrypt(string(Score))+"&"+encrypt("floor")+"="+encrypt(string(_floor/moneyCheckMult))+"&"+encrypt("money")+"="+encrypt(string(maxMoney/moneyCheckMult))+
        "&"+encrypt("monster")+"="+encrypt(string(MonstersKilled))+"&"+encrypt("chest")+"="+encrypt(string(ChestsOpened)))
        */
        GetKeyValue2=http_get_file(IP+"high_score.php?"+encrypt2("act")+"="+encrypt2("GetTime"),"prog.txt")
        
    }
    shovel=-1
    gun=-1
    draw_set_color(c_white)
    draw_set_font(global.font0)
    draw_set_alpha(1)
    draw_set_halign(fa_center)
    draw_text(room_width/2,(room_height/2)-125,"Fin")
    if alarm[4]=-1{
        /*
        draw_set_font(global.font0)
        draw_text(room_width/2,(room_height/2)-100,"Press Any Key to Continue##Here is an insult to#encourage you to do better")
        draw_text(room_width/2,(room_height/2),""+global.Insult)
        */
        room_speed=60
    }
    /*
    if (keyboard_check_released(vk_anykey) || check_padpress()=true) && alarm[4]<room_speed{
        //sound_stop_all()
        part_system_clear(global.ps2)
        audio_stop_all()
        game_restart()
    }*/
    
    part_system_automatic_update(global.ps2,false)
    with(par_monster){speed=0 canmove=false image_speed=0 alarm[3]=-1 fire=false}
    exit;
}
