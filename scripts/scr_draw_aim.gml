//used for the g launcher
//arg0=gravity
//arg1=init velocity
//arg2=angle
//arg3=player id-used for x+y

var g,vi,angle,obj;
g=argument0
vi=argument1;
angle=degtorad(argument2+180);
obj=argument3
var deltay,t;
nn=collision_line(mouse_x,mouse_y,mouse_x,mouse_y+350,par_block,0,1)
if nn>0{
deltay=abs(obj.y-nn.y-16);}else{deltay=0;}
t=sqrt((2*deltay)/g)*(6/10)



for(xx=0;xx<=t*2;xx+=.75){
draw_circle_color(obj.x+lengthdir_x(30,argument2)-(vi*cos(angle))*xx,obj.y+lengthdir_y(30,argument2)+.5*(vi*sin(angle)+(vi*sin(angle)+g*xx))*xx,1,c_white,c_white,true)
}
if nn>0 && global.GamePadMouse=0{
draw_circle_color(mouse_x,nn.y,2,c_white,c_white,true)
}

draw_set_color(c_white)


