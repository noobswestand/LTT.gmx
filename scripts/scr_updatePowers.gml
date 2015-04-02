if Crits!=pCrits
|| player_magnet!=pplayer_magnet
|| player_moss!=pplayer_moss
|| player_chestOpen!=pplayer_chestOpen
|| player_MonsterKill!=pplayer_MonsterKill
|| player_GemDamageMult!=pplayer_GemDamageMult
|| player_DigPower!=pplayer_DigPower
|| player_DigSpeed!=pplayer_DigSpeed
|| player_MonsterMeeleHeal!=pplayer_MonsterMeeleHeal
|| player_MonsterExplode!=pplayer_MonsterExplode
|| player_MonsterFire!=pplayer_MonsterFire
|| player_MonsterPosoin!=pplayer_MonsterPosoin
|| player_IceSlide!=pplayer_IceSlide
|| player_Freeze!=pplayer_Freeze
    {
    pCrits=Crits
    pplayer_magnet=player_magnet
    pplayer_moss=player_moss
    pplayer_chestOpen=player_chestOpen
    pplayer_MonsterKill=player_MonsterKill
    pplayer_GemDamageMult=player_GemDamageMult
    pplayer_DigPower=player_DigPower
    pplayer_DigSpeed=player_DigSpeed
    pplayer_MonsterMeeleHeal=player_MonsterMeeleHeal
    pplayer_MonsterExplode=player_MonsterExplode
    pplayer_MonsterFire=player_MonsterFire
    pplayer_MonsterPosoin=player_MonsterPosoin
    pplayer_IceSlide=player_IceSlide
    pplayer_Freeze=player_Freeze
    
    
    
    clearbuffer()
    writebyte(31)
    writefloat(Crits)
    writebyte(player_magnet)
    writebyte(player_moss*10)
    writebyte(player_chestOpen*10)
    writebyte(player_MonsterKill*10)
    writebyte(player_GemDamageMult*10)
    writebyte(player_DigPower)
    writebyte(player_DigSpeed*100)
    writefloat(player_MonsterMeeleHeal)
    writebyte(player_MonsterExplode)
    writebyte(player_MonsterFire)
    writebyte(player_MonsterPosoin)
    writebyte(player_IceSlide)
    writebyte(player_Freeze)
    sendmessage(global.clienttcp)
    
}