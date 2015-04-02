///scr_highscore2()

if keyboard_check_pressed(vk_escape){
    alarm[9]=15
    tweenbackyH=-999
    HighFade=false
    obj_highscoresign.draw=false
}
if alarm[7]=-1{
    if gamepad_button_check_released(0,gp_select){
        alarm[9]=15
        tweenbackyH=-999
        HighFade=false
        obj_highscoresign.draw=false
    }
}


///background
for(i=0;i<3;i+=1){
    
    //tween
    if tweenbackyH>i{
        backyH[i]+=(((gui_height*.5)+(i*50))-backyH[i])/4
    }else{
        backyH[i]+=((gui_height+50)-backyH[i])/4
    }
    tweenbackyH+=0.05
    
    //draw the background
    draw_set_color(backcH[i])
    draw_set_alpha(1)
    var yy,xx;
    xx=gui_width/2;
    yy=0
    
    
    //draw the triangles
    draw_primitive_begin(pr_trianglelist)
    draw_vertex((i*20)-50,backyH[i]+gui_height)
    draw_vertex(gui_width/2,backyH[i]+yy)
    draw_vertex(gui_width-(i*20)+50,backyH[i]+gui_height)
    draw_primitive_end();
    
}








///HighScores
if HighFade=1{
    boxa+=(.75-boxa)/5
    boxa1+=(1-boxa1)/7
    boxa2+=(0.9-boxa2)/7
}else{
    boxa+=(0-boxa)/5
    boxa1+=(0-boxa1)/3
    boxa2+=(0-boxa2)/3
}


draw_set_alpha(boxa)
draw_set_color(c_dkgray)
draw_rectangle(25,25,gui_width-25,gui_height-25,false)


draw_set_alpha(boxa1)
draw_set_color(c_white)
draw_set_font(fnt_norm)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text(gui_width/2,45,"HighScores")




//////////////////////////DrawThePEOPLE//////////////////////////
_x=(gui_width/4)
_y=(gui_height/4)+75
var _y2=Scrollt1+17//=highScroll;
var _start=round(highScroll/17);
var _end=clamp(round(highScroll/17)+(24),_start+24,MaxPlayers)
var a=0;
draw_set_font(fnt_norm)
draw_set_valign(fa_top)
Scrollt1+=(0-Scrollt1)/2
HighHover=-1

var cc=-1;
if global.GamePadMouse=1{

if ScrollPad2>ScrollPad1{
    if gamepad_button_check(0,gp_padu){
        ScrollPad-=1
        if ScrollPad<0{ScrollPad=MaxPlayers}
    }
    if gamepad_button_check(0,gp_padd){
        ScrollPad+=1
        if ScrollPad>MaxPlayers{ScrollPad=0}
    }
    ScrollPad1--
    ScrollPad2=0
}

if gamepad_button_check(0,gp_padd) || gamepad_button_check(0,gp_padu){
    ScrollPad2+=0.1
}
if gamepad_button_check_released(0,gp_padd) || gamepad_button_check_released(0,gp_padu){
    ScrollPad2=0
    ScrollPad1=2
}
if gamepad_button_check_pressed(0,gp_padu){
    ScrollPad-=1
    if ScrollPad<0{ScrollPad=MaxPlayers-1}
}
if gamepad_button_check_pressed(0,gp_padd){
    ScrollPad+=1
    if ScrollPad>MaxPlayers-1{ScrollPad=0}
}

    var send=_end;
    while(((ScrollPad+1)>_end)){
        highScroll+=17
        _end=clamp(round(highScroll/17)+(24),_start+24,MaxPlayers)
        if send=_end{
            break;
        }
    }
    if ScrollPad<0{
        ScrollPad=0
    }
    //if ScrollPad
    if ScrollPad!=0 && highScroll>=0{
        while(((ScrollPad)<=_start)){
            highScroll-=17
            _start=clamp(round(highScroll/17),0,999)
            //show_message(highScroll)
            if highScroll<0{
                highScroll=0
                
                break;
            }
        }
    }
}


//clamp(_start,0,999)
//show_message(_start)
for(i=_start;i<_end;i++){
    

    
    if string_count(string_lower(searchStr),string_lower(_name[i])) || searchStr=""{
        draw_set_color(c_ltgray)
        cc++
        if sortGo=false || a>5{
            if scr_hover4(_x-175,_y-144+_y2,_x+175,_y-144+_y2+15){
                draw_set_color(c_ltgray) draw_set_alpha(0.75)
                if global.GamePadMouse=0{draw_rectangle(_x-175,_y-144+_y2+2,_x+175,_y-144+_y2+15+2,false)}
                
                if HighOn=-1{
                    ///Draw other Stats///
                    draw_set_alpha(boxa1)
                    draw_set_halign(fa_center)
                    var xxoff=-32;
                    var yyoff=32;
                    draw_text((gui_width*.75)+xxoff,(gui_height/4)-16,_name[i])
                    
                    draw_text_transformed((gui_width*.75)+xxoff,(gui_height/4)+20,scr_getnumber2(_score[i]),.75,.75,0)
                    
                    draw_set_halign(fa_right)
                    draw_text_transformed((gui_width*.75)+175+xxoff,(gui_height/4)+64+yyoff,scr_getnumber2(_floor[i]),.75,.75,0)
                    draw_text_transformed((gui_width*.75)+175+xxoff,(gui_height/4)+96+yyoff,scr_getnumber2(_money[i]),.75,.75,0)
                    draw_text_transformed((gui_width*.75)+175+xxoff,(gui_height/4)+128+yyoff,scr_getnumber2(_monster[i]),.75,.75,0)
                    draw_text_transformed((gui_width*.75)+175+xxoff,(gui_height/4)+160+yyoff,scr_getnumber2(_chest[i]),.75,.75,0)
                    
                    draw_set_halign(fa_left)
                    draw_text_transformed((gui_width*.75)-175+xxoff,(gui_height/4)+64+yyoff,"Max Floor",.75,.75,0)
                    draw_text_transformed((gui_width*.75)-175+xxoff,(gui_height/4)+96+yyoff,"Max Money",.75,.75,0)
                    draw_text_transformed((gui_width*.75)-175+xxoff,(gui_height/4)+128+yyoff,"Monsters Killed",.75,.75,0)
                    draw_text_transformed((gui_width*.75)-175+xxoff,(gui_height/4)+160+yyoff,"Chests Opened",.75,.75,0)
                }
                if mouse_check_button_released(mb_left) && boxa1>0.97{
                    HighOn=i
                }
                
                draw_set_color(c_dkgray)
                HighHover=i
            }
            
        }
        
        if global.GamePadMouse=1 && ScrollPad=i{
            if gamepad_button_check_released(0,gp_face3) && boxa1>0.97{
                HighOn=i
            }
            HighHover=i
            draw_set_color(c_ltgray) draw_set_alpha(0.75)
            draw_rectangle(_x-175,_y-144+_y2+2,_x+175,_y-144+_y2+15+2,false)
            draw_set_color(c_dkgray)
        }
        
        draw_set_alpha(boxa1)
        draw_set_halign(fa_left)
        draw_text_transformed(_x-175,_y-144+_y2,string(i+1)+". "+_name[i],.5,.5,0)
        draw_set_halign(fa_right)
        draw_text_transformed(_x+175,_y-144+_y2,string(scr_getnumber2(_score[i])),.5,.5,0)
        
        _y2+=17
        a++
    }else{
        _end++
        if _name[_end]=""{break;}
    }
}
if HighOn!=-1{
    if searchStr=""{_y2=(HighOn-_start+1)*17}
    
    if HighOn>=_start && HighOn<_end && searchStr=""{
        draw_set_color(c_ltgray) draw_set_alpha(0.75)
        draw_rectangle(_x-175,_y-144+_y2+2,_x+175,_y-144+_y2+15+2,false)
        draw_set_alpha(boxa1)
        draw_set_color(c_dkgray)
        draw_set_halign(fa_left)
        draw_text_transformed(_x-175,_y-144+_y2,string(HighOn+1)+". "+_name[HighOn],.5,.5,0)
        draw_set_halign(fa_right)
        draw_text_transformed(_x+175,_y-144+_y2,string(scr_getnumber2(_score[HighOn])),.5,.5,0)
    }
    draw_set_color(c_ltgray) 
    ///Draw other Stats///
    draw_set_alpha(boxa1)
    draw_set_halign(fa_center)
    var xxoff=-32;
    var yyoff=32;
    draw_text((gui_width*.75)+xxoff,(gui_height/4)-16,_name[HighOn])
    
    draw_text_transformed((gui_width*.75)+xxoff,(gui_height/4)+20,scr_getnumber2(_score[HighOn]),.75,.75,0)
    
    draw_set_halign(fa_right)
    draw_text_transformed((gui_width*.75)+175+xxoff,(gui_height/4)+64+yyoff,scr_getnumber2(_floor[HighOn]),.75,.75,0)
    draw_text_transformed((gui_width*.75)+175+xxoff,(gui_height/4)+96+yyoff,scr_getnumber2(_money[HighOn]),.75,.75,0)
    draw_text_transformed((gui_width*.75)+175+xxoff,(gui_height/4)+128+yyoff,scr_getnumber2(_monster[HighOn]),.75,.75,0)
    draw_text_transformed((gui_width*.75)+175+xxoff,(gui_height/4)+160+yyoff,scr_getnumber2(_chest[HighOn]),.75,.75,0)
    
    draw_set_halign(fa_left)
    draw_text_transformed((gui_width*.75)-175+xxoff,(gui_height/4)+64+yyoff,"Max Floor",.75,.75,0)
    draw_text_transformed((gui_width*.75)-175+xxoff,(gui_height/4)+96+yyoff,"Max Money",.75,.75,0)
    draw_text_transformed((gui_width*.75)-175+xxoff,(gui_height/4)+128+yyoff,"Monsters Killed",.75,.75,0)
    draw_text_transformed((gui_width*.75)-175+xxoff,(gui_height/4)+160+yyoff,"Chests Opened",.75,.75,0)
}

if HighHover=-1{
    if mouse_check_button_pressed(mb_left){
        HighOn=-1
    }
}
if searchStr=""{
    if mouse_wheel_down(){
        highScroll-=17
        if highScroll>0{
            Scrollt1=-17
        }
        highScroll=clamp(highScroll,0,1700)
    }
    if mouse_wheel_up(){
        highScroll+=17
        Scrollt1=17
        highScroll=clamp(highScroll,0,1700)
    }
}else{
    highScroll=0
}
if phighScroll!=highScroll{
    
}



/////////////Search/////////////
draw_set_alpha(boxa2)
draw_set_color(1644310)
draw_rectangle(gui_width-150-searchw,35,gui_width-35,65,false)
if searchGo=false{
    if searchType=false{searchw+=(0-searchw)/3}
    
    if scr_click4(gui_width-150-searchw,35,gui_width-35,65){
        searchGo=true
        searchType=true
    }
    draw_set_color(c_ltgray)
    draw_set_halign(fa_left)
    if searchType=false{
        draw_text_ext_transformed(gui_width-145-searchw+5,40,"Search",0,9999999,0.5,0.5,0)
    }else{
        draw_text_ext_transformed(gui_width-145-searchw+5,40,searchStr,0,9999999,0.5,0.5,0)
    }
    
}else{
    draw_set_color(c_ltgray)
    draw_set_halign(fa_left)
    //Crusor
    if round(current_second/2)*2=current_second || searchW!=0 && searchType=true{
        draw_set_alpha(boxa1-.2)
        draw_rectangle(gui_width-145-searchw,40,gui_width-140-searchw+searchW,60,false)
        if searchW!=0{draw_set_color(c_dkgray)}
    }
    draw_set_alpha(boxa1)
    draw_text_ext_transformed(gui_width-145-searchw+5,40,string_replace_all(searchStr,"#","\#"),0,9999999,0.5,0.5,0)
    searchStr+=keyboard_string
    keyboard_string=""
    
    if keyboard_check(vk_control) && keyboard_check_pressed(ord("V")){
        searchStr+=clipboard_get_text()
    }
    if keyboard_check(vk_control) && keyboard_check_pressed(ord("C")){
        clipboard_set_text(searchStr)
    }
    
    if searchW!=0{
        if keyboard_check_pressed(vk_anykey){
            searchStr=""
            searchW=0
        }
    }
    if keyboard_check(vk_control) && keyboard_check_pressed(ord("A")){
        searchW=string_width(searchStr)/2
    }
    
    
    if string_width(searchStr)/2>250{
        repeat(((string_width(searchStr)/2)/250)+1){
            searchStr=string_delete(searchStr,string_length(searchStr),1)
        }
    }
    if keyboard_check(vk_backspace){
        if searchB=0{
            searchStr=string_delete(searchStr,string_length(searchStr),1)
        }else{
            if searchB>30{
                searchStr=string_delete(searchStr,string_length(searchStr),1)
            }
        }
        searchB+=1
    }else{searchB=0}
    
    if string_width(searchStr)/2<115{
        searchw+=(25-searchw)/3
    }else{
        searchw+=(((string_width(searchStr)/2)-100)-searchw)/3
    }
    if scr_click4(gui_width-150-searchw,35,gui_width-35,65)=false
    && mouse_check_button_pressed(mb_left){
        if searchStr=""{
            searchGo=false
            searchType=false
        }else{
            searchGo=false
        }
    }
}



////////////Sort////////////
draw_set_alpha(boxa2)
draw_set_color(1644310)
draw_rectangle(35,35,150,65+sortH,false)
draw_set_color(c_ltgray)
draw_set_halign(fa_center)
draw_text_ext_transformed(92.5,40,string_replace_all(sortType,"#","\#"),0,9999999,0.5,0.5,0)

if sortGo=false{
    sortH+=(0-sortH)/3
    if scr_click4(35,35,150,65+sortH){
        sortGo=true
    }
    
}else{
    sortH+=(100-sortH)/3
    if scr_click4(35,35,150,65+sortH)=false
    && mouse_check_button_pressed(mb_left){
        sortGo=false
    }
    
    for(i=0;i<5;i+=1){
        if sortH>(i*25)+15{
                
            if scr_hover4(40,40+(i*25)+25,145,60+(i*25)+25){
                draw_set_color(c_ltgray)
                draw_rectangle(40,40+(i*25)+25,145,60+(i*25)+25,false)
                draw_set_color(c_dkgray)
                if mouse_check_button_released(mb_left){
                    var psort;
                    psort=sortType
                    
                    sortType=sortl[i]
                    sortGo=false
                   
                     var str="http://65.27.50.201/GetHigh.php?act=";
                    switch(i){
                        case 0: str+="GetTop" break;
                        case 1: str+="GetBottom" break;
                        case 2: str+="AZ" break;
                        case 3: str+="ZA" break;
                    }
                    if psort!=sortType{
                        GetHigh=http_get(str)
                        highScroll=0
                    }
                    
                    
                }
            }else{
                draw_set_color(c_ltgray)
            }
            draw_text_ext_transformed(92.5,40+(i*25)+25,sortl[i],0,9999999,0.5,0.5,0)
            
        }
    }
    
}


////////////Back////////////
draw_set_alpha(boxa2)
draw_set_color(1644310)
draw_rectangle(gui_width-35,gui_height-35,gui_width-125,gui_height-65,false)
draw_set_color(c_ltgray)
draw_set_halign(fa_center)
draw_text_ext_transformed(gui_width-80,gui_height-61,"Back",0,9999999,0.5,0.5,0)
if scr_click4(gui_width-125,gui_height-65,gui_width-35,gui_height-35){
    alarm[9]=15
    obj_highscoresign.draw=false
    tweenbackyH=-999
    HighFade=false
}