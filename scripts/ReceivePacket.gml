buffer = argument[ 0 ];
var socket = argument[ 1 ];
var ip = argument[2];
//check to see if the person exists, or if they are just stopping by to say hello
for(i=0;i<255;i++){
    if global.players[i,1]=socket{
        if global.players[i,0]=-1{
            
            name=readstring()
            
            clearbuffer();
            writebyte(1);
            writebyte(i);
            writestring(global.PlayerName)
            sendmessage(argument[1]);
            
            player = instance_create(104,96,obj_client2);
            player.visible=false
            player.pid = i;
            player.tcp = argument[1];
            player.username = name;
            player.player_mod=4//FS_ini_read_real("AI","mod",0)
            global.players[i,0] = player;
            global.clienttcp=global.players[i,1]
            
        }else{//player exists, send buffer to them
            if instance_exists(global.players[i,0]){
                global.players[i,0].buffer=buffer
                with(global.players[i,0]){event_user(0)}
            }
        
        }
    }
}