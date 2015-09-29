if obj_control.money/obj_control.moneyCheckMult>=cost{
    obj_control.money-=cost*obj_control.moneyCheckMult
    global.MoneyEarned=true
    obj_control.player_health+=obj_control.player_chestOpen
    var obj=-1
    if sprite_index=spr_chest0{
        obj=choose(obj_PowerUpBronze0,obj_PowerUpBronze1,obj_PowerUpBronze2,obj_PowerUpBronze3,obj_PowerUpBronze4)
    }
    if sprite_index=spr_chest1{
        obj=choose(obj_PowerUpSilver0,obj_PowerUpSilver1,obj_PowerUpSilver2,obj_PowerUpSilver3,obj_PowerUpSilver4,obj_PowerUpSilver5)
    }
    
    if sprite_index=spr_chest2{
        obj=choose(obj_PowerUpGold0,obj_PowerUpGold1,obj_PowerUpGold2,obj_PowerUpGold3,obj_PowerUpGold4,obj_PowerUpGold5)
    }
    
    if obj=-1{
        obj=obj_PowerUpBronze0
    }
    nn=instance_create(x,y-25,obj)
    instance_destroy()
}
