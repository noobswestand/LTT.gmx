///player_list_delete(i)
global.players[argument[0],0]=-1
global.players[argument[0],1]=-1
NumClients-=1
return 1;
