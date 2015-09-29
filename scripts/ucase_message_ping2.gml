///ucase_message_ping2()
//case 26
uclearbuffer()
uwritebyte(25)
//writebyte(1)
uwritedouble(round(obj_control.money/obj_control.moneyCheckMult))
usendmessage()

var mon=readdouble()
if mon>0{
    obj_client2.money=mon
}
