/*
eg_explode(index,x,y,radius,force)
A positive force makes the points move away from the explosion area.
A negative force makes the points move towards the explosion area.
Script made by TheSnidr
www.thesnidr.com
*/
var i;
a0=argument0
xx=round(argument1/eg_tw[a0])
yy=round(argument2/eg_th[a0])
r=ceil(argument3/eg_tw[a0])
minx=max(xx-r,0)
maxx=min(xx+r,eg_w[a0]-1)
r=ceil(argument3/eg_th[a0])
miny=max(yy-r,0)
maxy=min(yy+r,eg_h[a0]-1)
scl=pi/argument3
for (xx=minx;xx<=maxx;xx+=1)
{
    _xx=xx*eg_h[a0]
    for (yy=miny;yy<=maxy;yy+=1)
    {
        i=_xx+yy
        di=(point_distance(argument1,argument2,eg_dsx[a0,i],eg_dsy[a0,i]))
        if di<=argument3
        {
            dir=point_direction(argument1,argument2,eg_dsx[a0,i],eg_dsy[a0,i])
            dist=argument4*sin(scl*(argument3-di))
            eg_vx[a0,i]+=(eg_dsx[a0,i]+lengthdir_x(dist,dir)-eg_dx[a0,i])/5
            eg_vy[a0,i]+=(eg_dsy[a0,i]+lengthdir_y(dist,dir)-eg_dy[a0,i])/5
        }
    }
}