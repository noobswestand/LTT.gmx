/*
eg_draw_tex(index,x,y,texture_index)
Draws the grid with a texture
Script made by TheSnidr
www.thesnidr.com
*/
var h,w,xtex,ytex,xtex1,xtex2,ytex1,xx,yy;
h=eg_h[argument0]
w=eg_w[argument0]-1
xtex=texture_get_width(argument3)/w
ytex=texture_get_height(argument3)/(h-1)
for (xx=0;xx<w;xx+=1)
{
    xtex1=xtex*xx
    xtex2=xtex1+xtex
    _xx=h*xx
    draw_primitive_begin_texture(pr_trianglestrip,argument3)
    for (yy=0;yy<h;yy+=1)
    {
        i=_xx+yy
        ytex1=ytex*yy
        draw_vertex_texture(argument1+eg_dx[argument0,i],argument2+eg_dy[argument0,i],xtex1,ytex1)
        draw_vertex_texture(argument1+eg_dx[argument0,i+h],argument2+eg_dy[argument0,i+h],xtex2,ytex1)
    }
    draw_primitive_end()
}
