///ReceivedPacket()
buffer = argument[ 0 ];
var msgid = buffer_read( buffer , buffer_u8 );
if msgid!=1 && msgid!=27
&& msgid!=3{
    if !instance_exists(obj_client2){exit}
}
TPCmsg=msgid
switch( msgid ) {
    
    case 1://Joining
        global.myid=readbyte()
        servername=readstring()
    break;
    
    case 2:
        /*
        serverroom=readshort()
        if serverroom=rm_game{
            with(obj_select){event_user(0)}
        }
        */
    break;
        
    
    case 3:
        var char0=readbyte();
        nn=instance_create(readshort(),readshort(),obj_client2)
        nn.char=char0
        nn.alarm[0]=1
        
        clearbuffer()
        writebyte(1)
        writebyte(global.char)
        writeshort(obj_player.x)
        writeshort(obj_player.y)
        sendmessage(global.clienttcp)
        
    break;
    
    case 5:
    if instance_exists(obj_client2){
        obj_client2._left=readbyte()
        obj_client2._right=readbyte()
        obj_client2._up=readbyte()
        var xx=readshort();
        var yy=readshort();
        if point_distance(xx,yy,obj_client2.x,obj_client2.y)>20{
            obj_client2.x=xx
            obj_client2.y=yy
        }
    }
    break;
    
    case 6:
        obj_client2.keyGot=readbyte()
    break;
    
    
    case 7://GetShovel
        obj_client2.shovel=readbyte()
    break;
    
    case 8://ShovelAnimate
        if instance_exists(obj_client2){
        obj_client2.shovelanimate=false
        obj_client2.gunshovel=0
        obj_client2.rightmouse=true
        obj_client2.x=readushort()
        obj_client2.y=readushort()
        }
    break;
    
    case 9:
        if instance_exists(obj_client2){
        obj_client2.PlayerMouseRot=readshort()
        }
    break;
    
    case 10:
        obj_control.alarm[7]=readushort()
    break;
    
    case 11://going down
        if room=rm_game{
            obj_control.Playerxx=obj_player.x
            obj_control._floor+=obj_control.moneyCheckMult
            obj_control.Score+=50
            obj_client2.y=0
            if obj_control.shovel=-1{shovel=irandom(1)}
            room_goto(rm_game2)
            global.FloorEarned=true
        }else{
            obj_control.Playerxx=obj_player.x
            obj_control._floor+=obj_control.moneyCheckMult
            obj_control.Score+=50
            obj_client2.y=0
            if obj_control.gun=-1{obj_control.gun=choose(0,2,3)}
            global.keyGot=false
            global.FloorEarned=true
            room_restart()
            
        }
    break;
    
    case 12://Get the terrain
        case_terrain()
    break;
    
    case 13:
        case_monsters()
    break;
    
    case 14:
        case_monsterupdate()
    break; 
    
    case 15:
        //var click=readbyte()
        //obj_client2.mouseleft_pressed=readbyte()
        obj_client2.mouseleft=readbyte()
    break;
    
    
    case 16:
        obj_client2.gun=readbyte()-5
    break;
    
    case 17://updating mis vars
        obj_client2.gun0charge=readfloat()
        obj_client2.BulletShoot=readbyte()
        obj_client2.BulletCount=readbyte()
        obj_client2.ptntGunAmount=readbyte()
        obj_client2.heat=readfloat()
        obj_client2.Maxheat=readfloat()
    break;
    
    case 20:
        case_message_bullets()
    break;
    
    case 21:
        case_message_blockupdate()
    break;
    
    case 22:
        case_message_monsterupdate()
    break;
    
    case 23:
        case_message_updateboss0()
    break;
    /*
    case 24:
        global.GameClock=readdouble()
    break;
    */
    
    /*
    case 25:
        case_message_ping();
    break;
    case 26:
        case_message_ping2()
    break;
    */
    
    case 27://show_message("@#$%@#$")
        if instance_exists(obj_select){
            obj_select.clientclick=readbyte()-1
            
        }
    break;
    
    
    case 28:
        case_player_dead()
    break;
    
    case 29:
        case_message_revive()
    break;
    
    
    case 30:
        case_message_shieldUpdate();
    break;
    
    case 31:
        case_message_updatePowers();
    break;
    
    case 32:
        var tmp=readbyte();
        if tmp=1{
            obj_control.alarm[7]=1
        }
    break;
}