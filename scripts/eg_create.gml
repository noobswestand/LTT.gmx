/*
eg_create(vtiles,htiles,width,height)
Returns the index of the new grid
h/vtiles: How many tiles should be in the grid
width/height: The size of the grid.
Script made by TheSnidr
www.thesnidr.com
*/
eg_ind=0/*
if !variable_local_exists("eg_ind")
{
    var eg_ind,eg_dots,eg_w,eg_h,eg_tw,eg_th,eg_dsx,eg_dsy,eg_dx,eg_dy;
    eg_ind=0
    /*
    for(i=0;i<=5;i+=1){
    eg_dots[i]=0;
    eg_w[i]=-1;
    eg_h[i]=-1;
    eg_tw[i]=-1;
    eg_th[i]=-1;
    eg_dsx[i,eg_dots[i]]=-1;
    eg_dsy[i,eg_dots[i]]=-1;
    eg_dx[i,eg_dots[i]]=-1;
    eg_dy[i,eg_dots[i]]=-1;
    eg_vx[i,eg_dots[i]]=0;
    eg_vy[i,eg_dots[i]]=0;
    }
}*/
eg_dots[eg_ind]=0
eg_w[eg_ind]=floor(argument0/2)*2
eg_h[eg_ind]=floor(argument1/2)*2
eg_tw[eg_ind]=argument2/eg_w[eg_ind]
eg_th[eg_ind]=argument3/eg_h[eg_ind]
var xx,yy;
for (xx=0;xx<eg_w[eg_ind];xx+=1)
{
    for (yy=0;yy<eg_h[eg_ind];yy+=1)
    {
        eg_dsx[eg_ind,eg_dots[eg_ind]]=xx*(argument2/(eg_w[eg_ind]-1))
        eg_dsy[eg_ind,eg_dots[eg_ind]]=yy*(argument3/(eg_h[eg_ind]-1))
        eg_dx[eg_ind,eg_dots[eg_ind]]=eg_dsx[eg_ind,eg_dots[eg_ind]]
        eg_dy[eg_ind,eg_dots[eg_ind]]=eg_dsy[eg_ind,eg_dots[eg_ind]]
        eg_vx[eg_ind,eg_dots[eg_ind]]=0
        eg_vy[eg_ind,eg_dots[eg_ind]]=0
        eg_dots[eg_ind]+=1
    }
}
//eg_ind+=1;
return eg_ind;
