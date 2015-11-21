///draw_gun8(direction,damage,player)
dir=argument[0]
if argument[2]=obj_player{alarm[3]=1}else{alarm[4]=1}
var rot=gun8Speed

gun8Speed=abs(dir-gun8Speed)
//gun8Speed=gun8Speed mod 360
if gun8Speed>180{gun8Speed=180}
var tmp=0;

repeat(gun8Speed){
    draw_sprite_ext(spr_gun8,0,argument[2].x+lengthdir_x(10,rot),argument[2].y+lengthdir_y(10,rot),1,.5,rot,c_white,1)
    
    if tmp=3{
        nn=instance_create(argument[2].x+lengthdir_x(10,rot),argument[2].y+lengthdir_y(10,rot),obj_bullet8)
        nn.image_angle=rot
        nn.damage=(argument[1])/15
        tmp=0
    }
    rot++
    tmp++
}

if gun8Speed>50{
    if !audio_is_playing(snd_lightSwing0)
    && !audio_is_playing(snd_lightSwing1)
    && !audio_is_playing(snd_lightSwing2)
    && !audio_is_playing(snd_lightSwing3){
        audio_play_sound(choose(snd_lightSwing0,snd_lightSwing1,snd_lightSwing2,snd_lightSwing3),5,0)
    }
}



gun8Speed=dir
if argument[2]=obj_player{
    if os_type=os_windows && global.GamePadMouse=0{
        if window_get_fullscreen()=false{
            window_mouse_set((argument[2].x*2)+lengthdir_x(20,dir),(argument[2].y*2)+lengthdir_y(20,dir))
        }else{
            /*  I give up
            var ww,hh;
            ww=3*(display_get_gui_width()/480);
            hh=3*(display_get_gui_height()/272);
            window_mouse_set((argument[2].x*ww)+lengthdir_x(20,dir),(argument[2].y*hh)+lengthdir_y(20,dir))
            */
        }
    }
}else{
    //show_debug_message(string(argument[2])+"   "+string(obj_player))
}
