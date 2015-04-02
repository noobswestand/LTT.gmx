/*
eg_draw(index,x,y)
Draws a simple one-color grid
Script made by TheSnidr
www.thesnidr.com
*/
h=eg_h[argument0]
w=eg_w[argument0]-1
i=0
ii=h
for (xx=0;xx<w;xx+=1)
{
    draw_primitive_begin(pr_linestrip)
    for (yy=0;yy<h;yy+=2)
    {
        draw_vertex(argument1+eg_dx[argument0,i],argument2+eg_dy[argument0,i])
        draw_vertex(argument1+eg_dx[argument0,ii],argument2+eg_dy[argument0,ii])
        draw_vertex(argument1+eg_dx[argument0,ii+1],argument2+eg_dy[argument0,ii+1])
        draw_vertex(argument1+eg_dx[argument0,i+1],argument2+eg_dy[argument0,i+1])
        i+=2
        ii+=2
    }
    draw_primitive_end()
}