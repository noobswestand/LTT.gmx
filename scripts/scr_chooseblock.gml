///scr_chooseblock()


if obj_control._floor/obj_control.moneyCheckMult<2{
    return obj_block0
}

if obj_control._floor/obj_control.moneyCheckMult>=2 && obj_control._floor/obj_control.moneyCheckMult<5{
    return choose(obj_block0,obj_block1)
}

if obj_control._floor/obj_control.moneyCheckMult>=5 && obj_control._floor/obj_control.moneyCheckMult<7{
    return choose(obj_block0,obj_block1,obj_block1)
}

if obj_control._floor/obj_control.moneyCheckMult>=7 && obj_control._floor/obj_control.moneyCheckMult<10{
    return choose(obj_block1,obj_block1,obj_block1,obj_block4)
}

if obj_control._floor/obj_control.moneyCheckMult>=10 && obj_control._floor/obj_control.moneyCheckMult<15{
    return obj_block4
}

if obj_control._floor/obj_control.moneyCheckMult>=15 && obj_control._floor/obj_control.moneyCheckMult<17{
    return choose(obj_block4,obj_block4,obj_block5)
}
if obj_control._floor/obj_control.moneyCheckMult>=17 && obj_control._floor/obj_control.moneyCheckMult<22{
    return choose(obj_block4,obj_block5)
}
if obj_control._floor/obj_control.moneyCheckMult>=22 && obj_control._floor/obj_control.moneyCheckMult<25{
    return obj_block5
}

if obj_control._floor/obj_control.moneyCheckMult>=25 && obj_control._floor/obj_control.moneyCheckMult<30{
    return choose(obj_block4,obj_block5)
}

if obj_control._floor/obj_control.moneyCheckMult>=30 && obj_control._floor/obj_control.moneyCheckMult<35{
    return choose(obj_block4,obj_block4,obj_block1)
}
if obj_control._floor/obj_control.moneyCheckMult>=35 && obj_control._floor/obj_control.moneyCheckMult<40{
    return choose(obj_block4,obj_block4,obj_block6)
}
if obj_control._floor/obj_control.moneyCheckMult>=40 && obj_control._floor/obj_control.moneyCheckMult<43{
    return obj_block6
}
if obj_control._floor/obj_control.moneyCheckMult>=43 && obj_control._floor/obj_control.moneyCheckMult<47{
    return choose(obj_block4,obj_block6,obj_block6)
}

return obj_block0
