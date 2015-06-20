///scr_changePlayerSprite(Char)

//Main
switch(argument0){
    case 1:
    spr_idle=spr_player_1idle
    spr_run=spr_player_1run
    spr_heal=spr_player_1heal
    movespeed=2
    jumpheight=7.25
    break;
    
    case 2:
    spr_idle=spr_player_2idle
    spr_run=spr_player_2run
    spr_heal=spr_player_2heal
    global.BLOOD=true
    break;
    
    
    case 6:
    spr_idle=spr_player_6idle
    spr_run=spr_player_6run
    spr_heal=spr_player_6heal
    break;
    
    
    case 7:
    spr_idle=spr_player_7idle
    spr_run=spr_player_7run
    spr_heal=spr_player_7heal
    break;
    
    case 8:
    spr_idle=spr_player_8idle
    spr_run=spr_player_8run
    spr_heal=spr_player_8heal
    break;
    
    case 9:
    spr_idle=spr_player_9idle
    spr_run=spr_player_9run
    spr_heal=spr_player_9heal
    break;
    
    case 10:
    spr_idle=spr_player_10idle
    spr_run=spr_player_10run
    spr_heal=spr_player_10heal
    break;
    
    case 11:
    spr_idle=spr_player_11idle
    spr_run=spr_player_11run
    spr_heal=spr_player_11idle
    spr_jump=spr_player_11jump
    break;
}



//WAN
switch(argument0){
    case 3:
    spr_idle=spr_player_3idle
    spr_run=spr_player_3run
    spr_heal=spr_player_3heal
    break;
    case 4:
    spr_idle=spr_player_4idle
    spr_run=spr_player_4run
    spr_heal=spr_player_4heal
    break;
    case 5:
    spr_idle=spr_player_5idle
    spr_run=spr_player_5run
    spr_heal=spr_player_5heal
    break;
    
    case 12:
    spr_idle=spr_player_12idle
    spr_run=spr_player_12run
    spr_heal=spr_player_12heal
    break;
    
}
