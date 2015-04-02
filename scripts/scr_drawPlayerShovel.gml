///scr_drawPlayerShovel()
if shovel!=-1{
    //anti-android
    if os_type!=os_android{
         global.GunShovelToggle=0
    }
    /////////////////////////////////////MESSAGE BOX/////////////////////////////////////////
    if alarm[2]!=-1 && gun=-1{
        draw_set_alpha(1)
        draw_set_font(global.font0) 
        draw_sprite_part(spr_messagebox,0,0,0,10,sprite_get_height(spr_messagebox),2,2)
        draw_sprite_stretched(spr_messagebox2,0,12,2,25+(string_width(shovel1[shovel,1])*0.333),sprite_get_height(spr_messagebox))
        draw_sprite_part(spr_messagebox,0,54,0,10,sprite_get_height(spr_messagebox),12+25+(string_width(shovel1[shovel,1])*0.333),2)
        
        draw_set_color(c_white)
        draw_text_ext_transformed(35,8,shovel1[shovel,0],5,9999,0.5,0.5,0)
        draw_text_ext_transformed(35,21,shovel1[shovel,1],12,999999,0.333,0.333,0)
        
        draw_sprite_stretched(shovel1[shovel,2],0,8,10,16,16)
    }
    
    
    var dir=PlayerMouseRot
    var xscale=1;
    if dir>90 && dir<270{xscale=-1}
    
    var img=spr_shovel0;
    var rot=45;
    var _scale=1
    switch(shovel){
        case 0: img=spr_shovel0 rot=45 break;
        case 1: img=spr_shovel1 rot=0  break;
        case 2: img=spr_shovel2 rot=90 _scale=0.25 xscale=1 break;
        case 3: img=-1 break;
    }
    
    
    
    
    if shovelanimate=false && gunshovel=0 && img!=-1{
        draw_sprite_ext(img,0,obj_player.x+lengthdir_x(10,dir),obj_player.y+lengthdir_y(10,dir),xscale*_scale,xscale*_scale,rot+dir,c_white,1)
    }
    if gunshovel!=2 && shovel!=3{
        obj_player.image_xscale=xscale
    }
    
    var mouseRight=mouse_check_button(mb_right);
    if global.AndriodPlay=true{
        mouseRight=false
    }
    if (mouseRight=true || gamepad_button_check(0,gp_shoulderlb) || global.AndriodPressShovel=true) && shovelanimate=false && canshovel=1 && global.GunShovelToggle=0{gunshovel=0
        shovelanimate=true
        canshovel=false
        if global.ONLINE=true{
            clearbuffer()
            writebyte(8)
            writeushort(obj_player.x)
            writeushort(obj_player.y)
            sendmessage(global.clienttcp)
        }
        alarm[1]=player_DigSpeed
        scr_set_mouse(spr_mousesprite,shovel1[shovel,3])
        with(obj_light){event_user(0)}
        shovelanimateRot=PlayerMouseRot
        switch(shovel){
            case 0: alarm[0]=13 shovelanimateRot-=(45*xscale) break;
            case 1: alarm[0]=13 shovelanimateRot-=(45*xscale) break;
            case 2: alarm[0]=3 break;
            case 3: alarm[0]=5 break;
        }
        
        
        var push=-5;
        if shovel=0 or shovel=1 or shovel=3{
        
            scr_shake2()
            audio_play_sound(snd_dig,2,0)
            pointx=obj_player.x
            pointy=obj_player.y
            
            ////////////////////////////////////////////////////////Destroy blocks!////////////////////////////////////////////////////////
            nn=instance_create(pointx,pointy,obj_col0)
            nn.image_angle=PlayerMouseRot
            with(par_block){if place_meeting(x,y,obj_col0){
                    helth-=(5/point_distance(x,y,obj_player.x+lengthdir_x(10,other.shovelanimateRot),obj_player.y+lengthdir_y(10,other.shovelanimateRot)))*obj_control.player_DigPower
                }
            }
            with(par_monster){if place_meeting(x,y,obj_col0){
                    helth-=(5/point_distance(x,y,obj_player.x+lengthdir_x(10,other.shovelanimateRot),obj_player.y+lengthdir_y(10,other.shovelanimateRot)))*obj_control.player_DigPower
                    obj_control.player_health+=(obj_control.player_MonsterMeeleHeal)
                }
            }
            with(obj_crate){if place_meeting(x,y,obj_col0){
                    helth-=(5/point_distance(x,y,obj_player.x+lengthdir_x(10,other.shovelanimateRot),obj_player.y+lengthdir_y(10,other.shovelanimateRot)))*obj_control.player_DigPower
                }
            }
            
            
            with(obj_col0){instance_destroy()}
            
        }
        
        if shovel=2{
            scr_shake2()
            push=-5
            with(par_block){
                if point_distance(x,y,obj_player.x+lengthdir_x(10,other.shovelanimateRot),obj_player.y+lengthdir_y(10,other.shovelanimateRot))<15{
                    helth-=(1/point_distance(x,y,obj_player.x+lengthdir_x(10,other.shovelanimateRot),obj_player.y+lengthdir_y(10,other.shovelanimateRot)))*5
                    helth--
                }
            }
        }
        
        obj_player.hspeed2=dcos(point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y))*push
        obj_player.hspeed=dcos(point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y))*push
        
        
        
        
        
        with(obj_dynamite){
            if point_distance(x,y,obj_player.x+lengthdir_x(10,other.shovelanimateRot),obj_player.y+lengthdir_y(10,other.shovelanimateRot))<25{
                helth-=(1/point_distance(x,y,obj_player.x+lengthdir_x(10,other.shovelanimateRot),obj_player.y+lengthdir_y(10,other.shovelanimateRot)))*10
                helth--
            }
        }
        
    }
    
    if shovelanimate=true{
        var img=spr_shovel0animte;
        var rot=0;
        var _scale=1
        switch(shovel){
            case 0: img=spr_shovel0animte rot=0 break;
            case 1: img=spr_shovel0animte rot=0 break;
            case 2: img=spr_shovel2animte rot=90 _scale=0.25 break;
            case 3: img=spr_shovel0animte rot=0 break;
        }
        draw_sprite_ext(img,-1,obj_player.x+lengthdir_x(10,shovelanimateRot),obj_player.y+lengthdir_y(10,shovelanimateRot),1*_scale,xscale*_scale,rot+shovelanimateRot,c_white,1)
    }
    
    
}