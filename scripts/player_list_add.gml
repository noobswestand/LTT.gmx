///player_list_add(socket)
for(asdf=0;asdf<255;asdf++){
    if global.players[asdf,1]=-1{
        global.players[asdf,1]=argument[0]
        NumClients+=1
        return 1
        break;
    }
}
return 0;