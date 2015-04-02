///draw_console()

//limits
if obj_control.ConsoleX+obj_control.ConsoleW>room_width{
    obj_control.ConsoleX=room_width-obj_control.ConsoleW
}
if obj_control.ConsoleY+obj_control.ConsoleH>room_height{
    obj_control.ConsoleY=room_height-obj_control.ConsoleH
}
if obj_control.ConsoleX<0{obj_control.ConsoleX=0}
if obj_control.ConsoleY<0{obj_control.ConsoleY=0}


draw_set_color(c_dkgray)
draw_set_alpha(0.75)
var xx,yy,ww,hh;
xx=obj_control.ConsoleX
yy=obj_control.ConsoleY
ww=obj_control.ConsoleW
hh=obj_control.ConsoleH
draw_rectangle(xx,yy,xx+ww,yy+hh,false)


////////////////////////////////////////Power Ups///////////////////////////////
if obj_control.BrowsePowers=true{
if mouse_check_button_released(mb_right){
        obj_control.BrowsePowers=false
    }
    var xxx,yyy;
    xxx=5;
    yyy=5;
    for(i=0;i<1000;i++){
        if obj_control.PowerUp[i]=-1{break;}//stop it
        
        if object_exists(obj_control.PowerUp[i]){
            draw_sprite_stretched(object_get_sprite(obj_control.PowerUp[i]),0,xxx+xx,yyy+yy,16,16)
            if scr_click(xxx+xx,yyy+yy,xxx+xx+16,yyy+yy+16){
                instance_create(obj_player.x,obj_player.y,obj_control.PowerUp[i])
            }
            
            xxx+=25
            if xxx>ww{xxx=5 yyy+=25}
        }else{break;}
        
    }
}


////////////////////////////////////////////////Change Guns/////////////////////////////////////////////
if obj_control.BrowseGuns=true{
if mouse_check_button_released(mb_right){
        obj_control.BrowseGuns=false
    }
    var xxx,yyy;
    xxx=5;
    yyy=5;
    for(i=0;i<obj_control.totalguns;i++){
        draw_sprite_stretched(obj_control.gun4[i],0,xx+xxx,yy+yyy,24,16)
        if scr_click(xxx+xx,yyy+yy,xxx+xx+16,yyy+yy+16){
            obj_control.gun=i
        }
        xxx+=25
        if xxx>ww{xxx=5 yyy+=25}
    }
}


/////////////////////////////////Normal Cheats///////////////////////////////
if obj_control.BrowsePowers=false && obj_control.BrowseGuns=false{
    draw_set_color(c_white)
    draw_set_alpha(1)
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    draw_set_font(global.font0)
    var str="Rebuild";
    draw_text_transformed(xx+5,yy+5,str,0.5,0.5,0)
    if scr_hover(xx+5,yy+5,xx+5+string_width(str)/2,yy+5+string_height(str)/2)
    && mouse_check_button_released(mb_left){
        with(par_block){instance_destroy()}
        with(par_monster){instance_destroy()}
        with(obj_chest){instance_destroy()}
        with(obj_crate){instance_destroy()}
        with(obj_dynamite){instance_destroy()}
        with(obj_gem){instance_destroy()}
        with(obj_monsterdead){instance_destroy()}
        with(obj_dynamitestick){canExp=false instance_destroy()}
        scr_generateRoom2()
        obj_control.ConsoleDrag=false
    }
    var str="JumpTo";
    draw_text_transformed(xx+5,yy+20,str,0.5,0.5,0)
    if scr_hover(xx+5,yy+20,xx+5+string_width(str)/2,yy+20+string_height(str)/2)
    && mouse_check_button_released(mb_left){
        obj_control._floor=get_integer("Floor?(greater than 0)","2")*obj_control.moneyCheckMult
        Playerxx=obj_player.x
        if global.ONLINE=true{
            clearbuffer()
            writebyte(11)
            sendmessage(global.clienttcp)
        }
        global.FloorEarned=true
        room_restart()
        obj_control.ConsoleDrag=false
    }
    
    var str="GodMode";
    if obj_control.GodMode=true{
        draw_set_alpha(0.8)
        draw_rectangle(xx+5,yy+40,xx+5+string_width(str)/2,yy+40+string_height(str)/2,false)
    }
    draw_set_alpha(1)
    draw_text_transformed(xx+5,yy+40,str,0.5,0.5,0)
    if scr_hover(xx+5,yy+40,xx+5+string_width(str)/2,yy+40+string_height(str)/2)
    && mouse_check_button_released(mb_left){
        obj_control.GodMode=!obj_control.GodMode
        obj_control.ConsoleDrag=false
    }
    
    var str="ChangeMoney";
    draw_text_transformed(xx+5,yy+60,str,0.5,0.5,0)
    if scr_hover(xx+5,yy+60,xx+5+string_width(str)/2,yy+60+string_height(str)/2)
    && mouse_check_button_released(mb_left){
        obj_control.money=(get_integer("How much?","500000"))*obj_control.moneyCheckMult
        global.MoneyEarned=true
        obj_control.ConsoleDrag=false
    }
    
    var str="AddPowerup";
    draw_text_transformed(xx+70,yy+5,str,0.5,0.5,0)
    if scr_hover(xx+70,yy+5,xx+70+string_width(str)/2,yy+5+string_height(str)/2)
    && mouse_check_button_released(mb_left){
        obj_control.BrowsePowers=true
        obj_control.ConsoleDrag=false
    }
    
    var str="ChangeGun";
    draw_text_transformed(xx+70,yy+20,str,0.5,0.5,0)
    if scr_hover(xx+70,yy+20,xx+70+string_width(str)/2,yy+20+string_height(str)/2)
    && mouse_check_button_released(mb_left){
        obj_control.BrowseGuns=true
        obj_control.ConsoleDrag=false
    }
    

}

if scr_hover(xx,yy,xx+ww,yy+hh)
&& mouse_check_button(mb_left){
    if mouse_check_button_pressed(mb_left){
        obj_control.ClickX=mouse_x-obj_control.ConsoleX
        obj_control.ClickY=mouse_y-obj_control.ConsoleY
        obj_control.ConsoleDrag=true
    }
}
if obj_control.ConsoleDrag=true{
    obj_control.ConsoleX=mouse_x-obj_control.ClickX
    obj_control.ConsoleY=mouse_y-obj_control.ClickY
    if mouse_check_button_released(mb_left){
        obj_control.ConsoleDrag=false
    }
}

