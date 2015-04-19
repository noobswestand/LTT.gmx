///scr_unlockPlayer(Player)

var spr,txt,num,txt2;
num=1
spr=spr_player_1idle
txt="Linus"
txt2="NULL"
switch(argument[0]){
    case 1: txt="Linus" num=1 txt2="Null" break;
    case 2: txt="Luke" num=2 txt2="Kill 500 Monsters" break;
    
    case 3: txt="Logan" num=1 txt2="Play 5 games" break;
    case 4: txt="Wendell" num=2 txt2="Blow up 50 TNT" break;
    case 5: txt="Pistol" num=3 txt2="Fire 200 shots with the missle launcher" break;
    
    case 6: txt="Edzel" num=3 txt2="Unlock 3 characters" break;
    case 7: txt="Brandon" num=4 txt2="Die 25 times" break;
    case 8: txt="Nick" num=5 txt2="Collect 25,000 Gems" break;
    case 9: txt="Taran" num=6 txt2="Heal 1500 HP" break;
    case 10: txt="Nick the Other" num=7 txt2="Play One Multiplayer game with a friend" break;
    case 11: txt="Rumble" num=8 txt2="Defeat the first boss" break;
    
    case 12: txt="Kane" num=4 txt2="Break 500 blocks" break;
}


ini_open("Chars.ini")
var te=0;
if (argument[0]=1 || argument[0]=2) || (argument[0]>=6 && argument[0]<=11){
    te=ini_read_real("char",string(num),0)
}else{
    te=ini_read_real("charW",string(num),0)
}
ini_close()


if te=0{
for(i=0;i<1000;i++){
    if sprite_get_name(i)="spr_player_"+string(argument[0])+"idle"{
        spr=i
        break;
    }
}


for(i=0;i<10;i++){
    if obj_control.powerupLife[i]=0{
        obj_control.poweruptxt[i]=txt
        obj_control.poweruptxt2[i]=txt2
        obj_control.powerupspr[i]=spr
        obj_control.powerupLife[i]=300
        break;
    }
}

ini_open("Chars.ini")
var te=0;
if (argument[0]=1 || argument[0]=2) || (argument[0]>=6 && argument[0]<=11){
    te=ini_read_real("char",string(num),0)
    ini_write_real("char",string(num),1)
}else{
    te=ini_read_real("charW",string(num),0)
    ini_write_real("charW",string(num),1)
}
ini_close()


if te=0{
    //do Edzel
    scr_unlockPlayerDown(6,1)
}
}
