///player_list_find_index(socket)
for(asdf2=0;asdf2<255;asdf2+=1){
    if global.players[asdf2,1]=argument[0]{
        return asdf2;
        break;
    }
}
return -1;
