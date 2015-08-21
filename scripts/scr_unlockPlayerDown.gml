///scr_unlockPlayerDown(Player,amount)
if global.SubmitScores=true{
    var num=1;
    switch(argument[0]){
        case 1: num=1 break;
        case 2: num=2 break;
        
        case 3: num=1 break;
        case 4: num=2 break;
        case 5: num=3 break;
        
        case 6: num=3 break;
        case 7: num=4 break;
        case 8: num=5 break;
        case 9: num=6 break;
        case 10: num=7 break;
        case 11: num=8 break;
        
        case 12: num=4 break;
    }
    if (argument[0]=1 || argument[0]=2) || (argument[0]>=6 && argument[0]<=11){
        if global._person[num]=1{exit}
    }else{
        if global._Wperson[num]=1{exit}
    }
    
    
    ini_open("Chars.ini")
    if (argument[0]=1 || argument[0]=2) || (argument[0]>=6 && argument[0]<=11){
        var t=ini_read_real("char",string(num)+"L",0)
        ini_write_real("char",string(num)+"L",real(t-argument[1]))
    }else{
        var t=ini_read_real("charW",string(num)+"L",0)
        ini_write_real("charW",string(num)+"L",real(t-argument[1]))
    }
    
    ini_close()
    
    if t-argument[1]<=0{
        scr_unlockPlayer(argument[0])
    }
}
