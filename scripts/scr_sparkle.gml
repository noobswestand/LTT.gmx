///scr_sparkle(x,y,width,height,color)

if irandom(20)=1{
    var xx,yy;
    xx=argument[0]+random(argument[2])
    yy=argument[1]+random(argument[3])
    nn=instance_create(xx,yy,obj_sparkle)
    nn.image_blend=argument[4]
    nn.ran=180
    nn.image_alpha=0
}