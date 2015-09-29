///scr_drawOptions()



op1[0]="Key-Bindings"
op1[1]="Tutorial Pop-Ups"
op1[2]="Default Options"
op1[3]="Option 4"

op2[0]="Particles"
op2[1]="Full-Screen"
op2[2]="V-Sync"
op2[3]="Option 4"

op3[0]="Audio"
op3[1]="HighScores"
op3[2]="ReName Profile"
op3[3]="Clear Progress"

//key buttons
if keyboard_check_pressed(vk_backspace)
|| keyboard_check_pressed(vk_escape){
    if op0Select!=-1 && op0Select!=-2{
        op0Select=-1
    }else{
        if alarm[9]=-1{
            op0Select=-2
            alarm[9]=15
        }
    }
}

//if os_type=os_windows{DrawBackground=0}
if DrawBackground=true{
///background
for(i=0;i<3;i+=1){
    
    //tween
    if tweenbackx>i && op0Select!=-2{
        backx[i]+=((gui_width-50)-backx[i])/4
    }else{
        backx[i]+=((-100)-backx[i])/4
    }
    tweenbackx+=0.05
    
    //draw the background
    draw_set_color(backc[i])
    draw_set_alpha(1)
    var _yy,xx;
    xx=backxoff[i]
    _yy=gui_height/2;
    //draw the triangles
    draw_primitive_begin(pr_trianglelist)
    draw_vertex(backx[i]-250+xx,backy[i])
    draw_vertex(backx[i]+xx,backy[i]+_yy)
    draw_vertex(backx[i]-250+xx,backy[i]+gui_height)
    draw_primitive_end();
    //draw rectangles
    draw_rectangle(backx[i]-250+xx,backy[i],0,backy[i]+gui_height,false)
    //draw_set_color(c_white)
    //draw_rectangle(random(500),random(500),random(500),random(500),false)
}
}



if gamepad_button_check_released(0,gp_padu){
    SelectOP0--
    if SelectOP0<0{SelectOP0=3}
}

if gamepad_button_check_released(0,gp_padd){
    SelectOP0++
    if SelectOP0>3 && op3a[i]<0.25{SelectOP0=0}
    else{if SelectOP0>4{SelectOP0=0}}
}
if op0Select=4{
    SelectOP0=0
}

if SelectOP0=0 && global.GamePadMouse=1{
draw_set_color(c_black)
draw_set_font(fnt_norm)
draw_set_alpha(0.8)
draw_rectangle_width(0,0,(0+(string_width("Back")))+2,0+((string_height("Back"))),5)
if gamepad_button_check_released(0,gp_face3) && alarm[7]=-1{
    if op0Select!=-1{
        op0Select=-1
        DrawBackground=true
    }else{
        if alarm[9]=-1{
            audio_play_sound(choose(snd_select0,snd_select1,snd_select7),2,0)
            op0Select=-2
            alarm[9]=15
        }
    }
}
}

//back button
if op0Select!=-1{
    tweenbackAlpha+=(1-tweenbackAlpha)/4
    if DrawBackground=true{
        draw_set_color(c_black)
    }else{
        draw_set_color(c_ltgray)
    }
    draw_set_alpha(tweenbackAlpha)
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    draw_set_font(fnt_norm)
    xxx=2
    yyy=15+(-tweenbackAlpha*15)
    draw_text(xxx,yyy,"Back")
    www=string_width("Back")
    hhh=string_height("Back")
    draw_line_width(xxx,yyy+(hhh),(xxx+(www)*tweenbackAlpha),yyy+(hhh),3)
    if scr_click3(xxx,yyy,(xxx+(www)),yyy+(hhh)){
        op0Select=-1
        DrawBackground=true
    }
}else{
    tweenbackAlpha+=(0-tweenbackAlpha)/4
    draw_set_color(c_black)
    draw_set_alpha(1-tweenbackAlpha)
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    draw_set_font(fnt_norm)
    xxx=2
    yyy=15+(-(1-tweenbackAlpha)*15)
    draw_text(xxx,yyy,"Exit")
    www=string_width("Exit")
    hhh=string_height("Exit")
    draw_line_width(xxx,yyy+(hhh),(xxx+(www)*(1-tweenbackAlpha)),yyy+(hhh),3)
    if scr_click3(xxx,yyy,(xxx+(www)),yyy+(hhh)){
        if alarm[9]=-1{
            audio_play_sound(choose(snd_select0,snd_select1,snd_select7),2,0)
            op0Select=-2
            alarm[9]=15
        }
    }
}


///options0
for(i=0;i<3;i+=1){
    
    //tween
    if tweenop>i+2 && op0Select=-1  && op0Select!=-2{
        opy[i]+=(0-opy[i])/4
        opa[i]+=(1-opa[i])/4
    }else{
        opy[i]+=(50-opy[i])/4
        opa[i]+=(0-opa[i])/4
    }
    tweenop+=0.05
    
    //draw the background
    draw_set_color(1776411)
    draw_set_alpha(opa[i])
    var _yy,xx;
    xx=200
    _yy=(gui_height/2)-150+(i*150);
    var xxx,yyy,www,hhh;
    xxx=xx+opx[i]
    yyy=_yy+opy[i]
    www=string_width(op[i])
    hhh=string_height(op[i])
    
    //Gamepad
    if SelectOP0=i+1 && global.GamePadMouse=1 && opa[i]>0.75{
        draw_rectangle_width(xxx-(www/2)-5,yyy-(hhh/2)-5,xxx+(www/2)+5,yyy+(hhh/2),5)
        if gamepad_button_check_released(0,gp_face3) && alarm[7]=-1{
            op0Select=i
            alarm[7]=5
            audio_play_sound(choose(snd_select0,snd_select1,snd_select7),2,0)
        }
    }
    
    //draw the text
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    draw_set_font(fnt_norm)
    draw_text(xx+opx[i],_yy+opy[i],op[i])
    draw_set_valign(fa_top)
    
    if scr_click3(xxx-(www/2),yyy-(hhh/2),xxx+(www/2),yyy+(hhh/2)) && op0Select=-1{
        op0Select=i
        audio_play_sound(choose(snd_select0,snd_select1,snd_select7),2,0)
    }
    www=250
    draw_set_color(c_black)
    draw_line_width((xxx-(www/2)*opa[i]),yyy+(hhh/2),(xxx+(www/2)*opa[i]),yyy+(hhh/2),3)
    
}









///options1
for(i=0;i<3;i+=1){
    
    //tween
    if tweenop1>i+2 && op0Select=0 && op0Select!=-2{
        op1y[i]+=(0-op1y[i])/4
        op1a[i]+=(1-op1a[i])/4
    }else{
        op1y[i]+=(50-op1y[i])/4
        op1a[i]+=(0-op1a[i])/4
        if op1a[i]<0.01 && op0Select!=0{tweenop1=0}
    }
    tweenop1+=0.05
    
    //draw the background
    draw_set_color(1776411)
    draw_set_alpha(op1a[i])
    var _yy,xx;
    xx=200
    _yy=(gui_height/2)-150+(i*150);
    //draw the text
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    draw_set_font(fnt_norm)
    draw_text(xx+op1x[i],_yy+op1y[i],op1[i])
    draw_set_halign(fa_left)
    switch(i){
        
        case 1:
            if GamePlayHelpScreens=true{
                draw_set_color(30251)
                draw_text(xx+op1x[i]+(string_width(op1[i])/2)+15,_yy+op1y[i],"-Enabled")
            }else{
                draw_set_color(1574290)
                draw_text(xx+op1x[i]+(string_width(op1[i])/2)+15,_yy+op1y[i],"-Disabled")
            }
        break;
    }
    draw_set_valign(fa_top)
    var xxx,yyy,www,hhh;
    xxx=xx+op1x[i]
    yyy=_yy+op1y[i]
    www=string_width(op1[i])
    hhh=string_height(op1[i])
    //Gamepad
    if SelectOP0=i+1 && global.GamePadMouse=1 && op1a[i]>0.75{
        draw_rectangle_width(xxx-(www/2)-5,yyy-(hhh/2)-5,xxx+(www/2)+5,yyy+(hhh/2),5)
        if gamepad_button_check_released(0,gp_face3) && alarm[7]=-1{alarm[7]=5
            switch(i){
            case 0:
                show_message2("Sorry, you can't rebind controller keys")
                op0Select=4
            break;
            
            case 1:
                GamePlayHelpScreens=!GamePlayHelpScreens
                ini_open("settings.ini") ini_write_real("Settings","Help",GamePlayHelpScreens) ini_close()
            break;
            
            case 2:
                show_question2("Are you sure you want to reset all options?")
            break;
            }
        }
    }
    
    
    if scr_click3(xxx-(www/2),yyy-(hhh/2),xxx+(www/2),yyy+(hhh/2)) && op0Select=0{
        audio_play_sound(choose(snd_select0,snd_select1,snd_select7),2,0)
        switch(i){
            case 0:
                op0Select=4
            break;
            
            case 1:
                GamePlayHelpScreens=!GamePlayHelpScreens
                ini_open("settings.ini") ini_write_real("Settings","Help",GamePlayHelpScreens) ini_close()
            break;
            
            case 2:
                show_question2("Are you sure you want to reset all options?")
            break;
        }
    }
    www=300
    draw_set_color(c_black)
    draw_line_width((xxx-(www/2)*op1a[i]),yyy+(hhh/2),(xxx+(www/2)*op1a[i]),yyy+(hhh/2),3)
}

if global.AnsweredQuestion=true
&& global.MyQuestion="Are you sure you want to reset all options?"{
    if global.AnsweredQuestionResult=true{
        if file_exists("settings.ini"){
            file_delete("settings.ini")
            with(obj_tuthelp){event_user(0)}
            show_message2("Your options has been reset")
        }
    }
    global.AnsweredQuestion=false
}













///options2
for(i=0;i<3;i+=1){
    
    //tween
    if tweenop2>i+2 && op0Select=1 && op0Select!=-2{
        op2y[i]+=(0-op2y[i])/4
        op2a[i]+=(1-op2a[i])/4
    }else{
        op2y[i]+=(50-op2y[i])/4
        op2a[i]+=(0-op2a[i])/4
        if op2a[i]<0.01 && op0Select!=1{tweenop2=0}
    }
    tweenop2+=0.05
    
    //draw the background
    draw_set_color(1776411)
    draw_set_alpha(op2a[i])
    var _yy,xx;
    xx=200
    _yy=(gui_height/2)-150+(i*150);
    //draw the text
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    draw_set_font(fnt_norm)
    draw_text(xx+op2x[i],_yy+op2y[i],op2[i])
    draw_set_halign(fa_left)
    switch(i){
        
        case 0:
            if GraphicsParticles=2{
                draw_set_color(30251)
                draw_text(xx+op2x[i]+(string_width(op2[i])/2)+15,_yy+op2y[i],"-ALL")
            }
            if GraphicsParticles=1{
                draw_set_color(104868)
                draw_text(xx+op2x[i]+(string_width(op2[i])/2)+15,_yy+op2y[i],"-SOME")
            }
            if GraphicsParticles=0{
                draw_set_color(1574290)
                draw_text(xx+op2x[i]+(string_width(op2[i])/2)+15,_yy+op2y[i],"-NONE")
            }
        break;
        
        case 1:
            if GraphicsFullScreen=true{
                draw_set_color(30251)
                draw_text(xx+op2x[i]+(string_width(op2[i])/2)+15,_yy+op2y[i],"-Enabled")
            }else{
                draw_set_color(1574290)
                draw_text(xx+op2x[i]+(string_width(op2[i])/2)+15,_yy+op2y[i],"-Disabled")
            }
        break;
        
        case 2:
            if GraphicsVSync=true{
                draw_set_color(30251)
                draw_text(xx+op2x[i]+(string_width(op2[i])/2)+15,_yy+op2y[i],"-Enabled")
            }else{
                draw_set_color(1574290)
                draw_text(xx+op2x[i]+(string_width(op2[i])/2)+15,_yy+op2y[i],"-Disabled")
            }
        break;
    }
    draw_set_valign(fa_top)
    var xxx,yyy,www,hhh;
    xxx=xx+op2x[i]
    yyy=_yy+op2y[i]
    www=string_width(op2[i])
    hhh=string_height(op2[i])
    //Gamepad
    if SelectOP0=i+1 && global.GamePadMouse=1 && op2a[i]>0.75{
        draw_rectangle_width(xxx-(www/2)-5,yyy-(hhh/2)-5,xxx+(www/2)+5,yyy+(hhh/2),5)
        if gamepad_button_check_released(0,gp_face3) && alarm[7]=-1{alarm[7]=5
            switch(i){
            case 0:
                GraphicsParticles++
                if GraphicsParticles>2{GraphicsParticles=0}
                ini_open("settings.ini") ini_write_real("Settings","Parts",GraphicsParticles) ini_close()
            break;
            
            case 1:
                GraphicsFullScreen=!GraphicsFullScreen
                window_set_fullscreen(GraphicsFullScreen)
                ini_open("settings.ini") ini_write_real("Settings","FullScreen",GraphicsFullScreen) ini_close()
            break;
            
            case 2:
                GraphicsVSync=!GraphicsVSync
                display_reset(0, GraphicsVSync);
                ini_open("settings.ini") ini_write_real("Settings","VSync",GraphicsVSync) ini_close()
            break;
            }
        }
    }
    
    
    if scr_click3(xxx-(www/2),yyy-(hhh/2),xxx+(www/2),yyy+(hhh/2)) && op0Select=1{
        audio_play_sound(choose(snd_select0,snd_select1,snd_select7),2,0)
        switch(i){
            case 0:
                GraphicsParticles++
                if GraphicsParticles>2{GraphicsParticles=0}
                ini_open("settings.ini") ini_write_real("Settings","Parts",GraphicsParticles) ini_close()
            break;
            
            case 1:
                GraphicsFullScreen=!GraphicsFullScreen
                window_set_fullscreen(GraphicsFullScreen)
                ini_open("settings.ini") ini_write_real("Settings","FullScreen",GraphicsFullScreen) ini_close()
            break;
            
            case 2:
                GraphicsVSync=!GraphicsVSync
                display_reset(0, GraphicsVSync);
                ini_open("settings.ini") ini_write_real("Settings","VSync",GraphicsVSync) ini_close()
            break;
            
        }
    }
    www=300
    draw_set_color(c_black)
    draw_line_width((xxx-(www/2)*op2a[i]),yyy+(hhh/2),(xxx+(www/2)*op2a[i]),yyy+(hhh/2),3)
    
}














///options3
for(i=0;i<4;i+=1){
    
    //tween
    if tweenop3>i+2 && op0Select=2 && op0Select!=-2{
        op3y[i]+=(0-op3y[i])/4
        op3a[i]+=(1-op3a[i])/4
    }else{
        op3y[i]+=(50-op3y[i])/4
        op3a[i]+=(0-op3a[i])/4
        if op3a[i]<0.01 && op0Select!=2{tweenop3=0}
    }
    tweenop3+=0.05
    
    //draw the background
    draw_set_color(1776411)
    draw_set_alpha(op3a[i])
    var _yy,xx;
    xx=200
    _yy=(gui_height/2)-150+(i*100);
    //draw the text
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    draw_set_font(fnt_norm)
    draw_text(xx+op3x[i],_yy+op3y[i],op3[i])
    draw_set_halign(fa_left)
    switch(i){
    
        case 1:
            if GeneralHighScore=true{
                draw_set_color(30251)
                draw_text(xx+op3x[i]+(string_width(op3[i])/2)+15,_yy+op3y[i],"-Enabled")
            }else{
                draw_set_color(1574290)
                draw_text(xx+op3x[i]+(string_width(op3[i])/2)+15,_yy+op3y[i],"-Disabled")
            }
        break;
        
        case 2:
            draw_set_color(c_black)
            draw_text(xx+op3x[i]+(string_width(op3[i])/2)+15,_yy+op3y[i],"-"+string(global.PlayerName))
        break;
    }
    draw_set_valign(fa_top)
    var xxx,yyy,www,hhh;
    xxx=xx+op3x[i]
    yyy=_yy+op3y[i]
    www=string_width(op3[i])
    hhh=string_height(op3[i])
    //Gamepad
    if SelectOP0=i+1 && global.GamePadMouse=1 && op3a[i]>0.75{
        draw_rectangle_width(xxx-(www/2)-5,yyy-(hhh/2)-5,xxx+(www/2)+5,yyy+(hhh/2),5)
        if gamepad_button_check_released(0,gp_face3) && alarm[7]=-1{alarm[7]=5
            switch(i){
            case 0:
                op0Select=3
            break;
            case 1:
                GeneralHighScore=!GeneralHighScore
                ini_open("settings.ini") ini_write_real("Settings","High",GeneralHighScore) ini_close()
            break;
            case 2:
                get_string2("What is your name?#(Only used for online high scores)","")
            break;
            
            case 3:
                show_question2("Are you sure you want to clear your progress?")
            break;
            }
        }
    }
    
    
    if scr_click3((xxx-(www/2))*op3a[i],yyy-(hhh/2),(xxx+(www/2))*op3a[i],yyy+(hhh/2)) && op0Select=2{
        audio_play_sound(choose(snd_select0,snd_select1,snd_select7),2,0)
        switch(i){
            case 0:
                op0Select=3
            break;
            case 1:
                GeneralHighScore=!GeneralHighScore
                ini_open("settings.ini") ini_write_real("Settings","High",GeneralHighScore) ini_close()
            break;
            case 2:
                get_string2("What is your name?#(Only used for online high scores)","")
            break;
            
            case 3:
                show_question2("Are you sure you want to clear your progress?")
            break;
            
            
        }
    }
    www=300
    draw_set_color(c_black)
    draw_line_width((xxx-(www/2)*op3a[i]),yyy+(hhh/2),(xxx+(www/2)*op3a[i]),yyy+(hhh/2),3)
    
}

if global.AnsweredQuestion=true
&& (global.MyQuestion="What is your name?#(Only used for online high scores)"
|| global.MyQuestion="Invalid name.#Please put something in and do not enter symbols"){
    global.PlayerName=global.AnsweredQuestionResultStr
    if name_get_chars(global.PlayerName)=true
    or global.PlayerName=""{
        get_string2("Invalid name.#Please put something in and do not enter symbols","")
    }else{
        file=file_text_open_write("Settings.txt")
        file_text_write_string(file,global.PlayerName)
        file_text_close(file)
    }
    global.AnsweredQuestion=false
}




if global.AnsweredQuestion=true
&& global.MyQuestion="Are you sure you want to clear your progress?"{
    if global.AnsweredQuestionResult=true{
        if file_exists("Chars.ini"){
            file_delete("Chars.ini")
            show_message2("Your progress has been reset")
        }
    }
    global.AnsweredQuestion=false
}






//////////////////////////////////////AUDIO////////////////////////////////////
for(i=0;i<3;i++){
    
    //Tween
    if tweenAud>(i+2) && op0Select=3{
        auda[i]+=(1-auda[i])/4
        audy[i]+=(0-audy[i])/4
    }else{
        auda[i]+=(0-auda[i])/4
        audy[i]+=(50-audy[i])/4
        if auda[i]<0.01 && op0Select!=3{tweenAud=0}
    }
    tweenAud+=0.05
    
    var _yy,xx;
    xx=200
    _yy=(gui_height/2)-150+(i*150);
    var xxx,yyy,www,hhh;
    xxx=xx+audx[i]
    yyy=_yy+audy[i]
    www=string_width(aud[i])
    hhh=string_height(aud[i])
    
    draw_set_alpha(auda[i])
    //draw the text
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    draw_set_font(fnt_norm)
    draw_set_color(c_black)
    draw_text(xx+audx[i],_yy+audy[i],string(aud[i])+"   "+string(round(audS[i]*100))+"%")//+"   "+string(audS[i])
    draw_set_halign(fa_left)
    www=string_width(aud[i])
    draw_line_width((xxx-(www/2)*auda[i]),yyy+(hhh/2),(xxx+(www/2)*auda[i]),yyy+(hhh/2),3)
    
    yyy+=50
    www=350
    //Gamepad
    if SelectOP0=i+1 && global.GamePadMouse=1 && auda[i]>0.75{
        draw_rectangle_width((xxx-(www/2)*auda[i])-15,yyy+(hhh/2)-15,(xxx+(www/2)*auda[i])+15,yyy+(hhh/2)+15,5)
        
        var pS=round(audS[i]*100);
        var h=gamepad_axis_value(0, gp_axislh)
        h=(round(h*3)/3)
        if gamepad_button_check(0,gp_padr) || h>0.5{
            audscale[i]+=(2-audscale[i])/4
            audS[i]=clamp((((audS[i]+.57)*www)+AudCon1),xxx,xxx+www)
            audS[i]=(audS[i]/www)-.57
            AudCon0=true
        }
        if gamepad_button_check(0,gp_padl) || h<-0.5{
            audscale[i]+=(2-audscale[i])/4
            audS[i]=clamp((((audS[i]+.57)*www)-AudCon1),xxx,xxx+www)
            audS[i]=(audS[i]/www)-.57
            AudCon0=true
        }
        
        if AudCon0=true{
            AudCon1+=0.25
        }else{
            AudCon1=1
        }
        if pS!=round(audS[i]*100){
            audio_play_sound(snd_volumeChange,2,0)
        }else{
            if AudCon0=true{
                ini_open("settings.ini")
                ini_write_real("Settings","Vol"+string(i),audS[i])
                ini_close()
                AudCon0=false
            }
        }
        if gamepad_button_check_released(0,gp_padr) || gamepad_button_check_released(0,gp_padl){
            ini_open("settings.ini")
            ini_write_real("Settings","Vol"+string(i),audS[i])
            ini_close()
        }
        
        
        
        
    }
    
    //draw the sliders
    draw_set_color(c_gray)
    draw_set_alpha(1)
    draw_line_width((xxx-(www/2)*auda[i]),yyy+(hhh/2),(xxx+(www/2)*auda[i]),yyy+(hhh/2),2)
    
    draw_set_alpha(auda[i])
    draw_set_color(c_dkgray)
    draw_circle_width(((xxx-(www/2))+((www)*audS[i])),yyy+(hhh/2),10*audscale[i],2)
    
    if op0Select=3{
    if scr_click4(((xxx-(www/2))+((www)*audS[i]))-15,yyy+(hhh/2)-15,
    ((xxx-(www/2))+((www)*audS[i]))+15,yyy+(hhh/2)+15){
        audC[i]=true
    }
    if mouse_check_button_released(mb_left){
        if audC[i]=true{
            audC[i]=false
            //save the thing
            ini_open("settings.ini")
            ini_write_real("Settings","Vol"+string(i),audS[i])
            ini_close()
        }
    }
    if mouse_x<5{
        if audC[i]=true{
            audC[i]=false
            //save the thing
            ini_open("settings.ini")
            ini_write_real("Settings","Vol"+string(i),audS[i])
            ini_close()
        }
    }
    
    }else{
        if audC[i]=true{
            audC[i]=false
            //save the thing
            ini_open("settings.ini")
            ini_write_real("Settings","Vol"+string(i),audS[i])
            ini_close()
        }
    }
    
    if audC[i]=true{
        var pS=round(audS[i]*100);
        audscale[i]+=(2-audscale[i])/4
        audS[i]=clamp((mouse_x*2)+www/2,xxx,xxx+www)//((clamp((mouse_x*2),xxx,xxx+www))/(www+xxx))
        audS[i]=(audS[i]/www)-.57
        
        if pS!=round(audS[i]*100){
            audio_play_sound(snd_volumeChange,2,0)
        }
        
        switch(i){
            case 0:
                audio_master_gain(audS[0])
            break;
            case 1:
                audio_group_set_gain(Sounds,audS[1],0)
                //audio_group_set_gain(Sounds,0,0)
            break;
            case 2:
                audio_group_set_gain(Music,audS[2],0)
            break
        }
    }else{
        audscale[i]+=(1-audscale[i])/4
    }
}





//////////////////////////////////////KEY-BINDINGS////////////////////////////////////
if os_type=os_windows{
for(i=0;i<4;i++){
    
    //Tween
    if tweenKey>(i+2) && op0Select=4{
        keya[i]+=(1-keya[i])/4
        keyy[i]+=(0-keyy[i])/4
    }else{
        keya[i]+=(0-keya[i])/4
        keyy[i]+=(50-keyy[i])/4
        if keya[i]<0.01 && op0Select!=4{tweenKey=0}
        for(a=0;a<4;a++){
            keyS[a]=false
        }
    }
    tweenKey+=0.05
    
    var _yy,xx;
    xx=200
    _yy=(gui_height/2)-150+(i*100);
    var xxx,yyy,www,hhh,_str;
    _str=chr2(key[i])
    xxx=xx+keyx[i]
    yyy=_yy+keyy[i]
    draw_set_alpha(keya[i])
    //draw the text
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    draw_set_font(fnt_norm)
    draw_set_color(c_black)
    if keyS[i]=true{
        _str=keystr[i]+"    "
    }else{
        _str=keystr[i]+"      "+string(_str)
    }
    www=string_width(_str)
    hhh=string_height(_str)
    
    
    draw_text(xx+keyx[i],_yy+keyy[i],_str)//+"   "+string(audS[i])
    draw_set_halign(fa_left)
    www=string_width(_str)
    draw_line_width((xxx-(www/2)*keya[i]),yyy+(hhh/2),(xxx+(www/2)*keya[i]),yyy+(hhh/2),3)
    //get the keys
    if scr_click3((xxx-(www/2))*keya[i],yyy-(hhh/2),(xxx+(www/2))*keya[i],yyy+(hhh/2)){
        //cancel the operation
        for(a=0;a<4;a++){
            keyS[a]=false
        }
        keyS[i]=true
        
    }
    if keyS[i]=true{
        if keyboard_check_pressed(vk_anykey){
            
            ini_open("settings.ini")
            
            switch(keyboard_key){
                case vk_left:
                    key[i]=vk_left
                    ini_write_real("Settings","Key"+string(i),real(keyboard_lastkey))
                break;    
                case vk_right:
                    key[i]=vk_right
                    ini_write_real("Settings","Key"+string(i),real(keyboard_lastkey))
                break;
                case vk_up:
                    key[i]=vk_up
                    ini_write_real("Settings","Key"+string(i),real(keyboard_lastkey))
                break;
                case vk_down:
                    key[i]=vk_down
                    ini_write_real("Settings","Key"+string(i),real(keyboard_lastkey))
                break;
            
                default:
                    key[i]=real(keyboard_lastkey)
                    ini_write_real("Settings","Key"+string(i),real(key[i]))
                break;
            }
            
            
            keyS[i]=false
            ini_close()
        }
    }
    
}

}else{
    if op0Select=4{
        DrawBackground=false
        instance_activate_object(obj_touchscreen)
        with(obj_touchscreen){
            //draw the buttons
            for(i=0;i<numButtons;i++){
                var xx,yy,ww,hh;
                xx=buttonx[i]
                yy=buttony[i]
                ww=buttonw[i]
                hh=buttonh[i]
                if global.GunShovelToggle=1 && i=3{
                    draw_rectangle(xx,yy,xx+ww,yy+hh,false)
                    draw_set_color(c_black)
                    draw_rectangle(xx+2,yy+2,xx+ww-2,yy+hh-2,false)
                    draw_set_color(c_white)
                }else{
                    draw_rectangle(xx,yy,xx+ww,yy+hh,false)
                    draw_set_color(c_white)
                }
                if i!=3{
                    draw_sprite_stretched(spr_arrow,buttonRot[i],xx,yy,ww,hh)
                }
                
                //draw the scaler
                draw_set_color(c_dkgray)
                draw_set_alpha(1)
                draw_circle_width(xx+ww-3,yy+hh-3,6*(buttDrag2[i]+1),2)
                //draw_rectangle(xx+ww-10,yy+hh-10,xx+ww+10,yy+hh+10,false)
                if scr_click4(xx+ww-10,yy+hh-10,xx+ww+10,yy+hh+10) && buttDrag[i]=false{
                    buttDrag2[i]=true
                    buttDrag2X=(mouse_x*2)-buttonw[i]
                    buttDrag2Y=(mouse_y*2)-buttonh[i]
                }
                if buttDrag2[i]=true{
                    buttonw[i]=(mouse_x*2)-buttDrag2X
                    buttonh[i]=(mouse_y*2)-buttDrag2Y
                    
                }
                
                
                if scr_click4(xx,yy,xx+ww,yy+hh) && buttDrag2[i]=false{
                    buttDrag[i]=true
                }
                if mouse_check_button_released(mb_left){
                    if buttDrag[i]=true{
                        buttDrag[i]=false
                        //save
                        ini_open("settings.ini")
                        ini_write_real("Settings","Touchx"+string(i),buttonx[i])
                        ini_write_real("Settings","Touchy"+string(i),buttony[i])
                        ini_close()
                        }
                    if buttDrag2[i]=true{
                        buttDrag2[i]=false
                        //save
                        ini_open("settings.ini")
                        ini_write_real("Settings","Touchw"+string(i),buttonw[i])
                        ini_write_real("Settings","Touchh"+string(i),buttonh[i])
                        ini_close()
                        
                    }
                    
                }
                
                if buttDrag[i]=true{
                    buttonx[i]=(mouse_x*2)-(ww/2)
                    buttony[i]=(mouse_y*2)-(hh/2)
                    
                    
                    if buttonx[i]<0{buttonx[i]=0}
                    if buttony[i]<0{buttony[i]=0}
                    if buttonx[i]+ww>gui_width{buttonx[i]=gui_width-ww}
                    if buttony[i]+hh>gui_height{buttony[i]=gui_height-hh}
                }
                
            }
            
            //draw the joy
            draw_sprite_ext(spr_joy_center,0,JoyX,JoyY,2,2,0,c_white,1)
            
            if scr_click4(JoyX-64,JoyY-64,JoyX+64,JoyY+64){
                DragJoy=true
            }
            
            if DragJoy=true{
                JoyX=mouse_x*2
                JoyY=mouse_y*2
            }
            if mouse_check_button_released(mb_left){
                DragJoy=false
                //save
                ini_open("settings.ini")
                ini_write_real("Settings","JoyX",JoyX)
                ini_write_real("Settings","JoyY",JoyY)
                ini_close()
            }
            
            
        }
        
    }else{
        DrawBackground=true
    }
}
