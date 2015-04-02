///place_meeting3(x,y,obj)
var xx,yy;
xx=round(argument[0]/16)
yy=round(argument[1]/16)
for(a=yy-1;a<yy+1;a++){
if global._block[xx,a]!=-1{
    if instance_exists(global._block[xx,a]){
        return true
    }else{
        global._block[xx,a]=-1
    }
}
}
return false;

/*
for(i=xx-1;i<xx+1;i++){
    for(a=yy-1;a<yy+1;a++){
        
    }
}
*/