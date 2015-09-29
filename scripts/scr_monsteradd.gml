///scr_monsteradd(id)
for(abc123=0;abc123<100;abc123++){
    if global.MonsterList[abc123]=-1{
        global.MonsterList[abc123]=argument[0]
        return abc123;
        break;
    }
}
