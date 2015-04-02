///part_burst(xmin,xmax,ymin,ymax,amount,shape,size,color,minlife,maxlife,alpha0,alpha1,alpha2,speed,direction,depth)

if obj_tuthelp.GraphicsParticles=2
||(obj_tuthelp.GraphicsParticles=1 && fps>50)
/*|| (global.PartsColor0=16777215
&& global.PartsColor1=16747677
&& global.PartsColor2=8388608)*/{

var color0,color1,color2,temp;
color0=global.PartsColor0;
color1=global.PartsColor1;
color2=global.PartsColor2;
temp=argument[7]
if color0=-1{
    color0=temp
}
if color1=-1{
    color1=color0
}
if color2=-1{
    color2=color0
}



repeat(argument[4]){
    nn=instance_create(irandom_range(argument[0],argument[1]),irandom_range(argument[2],argument[3]),obj_parts)
    switch(argument[5]){
        case 0: nn.sprite_index=spr_parts nn.image_index=0 break;
    }
    nn.image_xscale=argument[6]
    nn.image_yscale=argument[6]
    nn.image_blend0=color0
    nn.image_blend1=color1
    nn.image_blend2=color2
    nn.minlife=argument[8]
    nn.maxlife=argument[9]
    nn.alpha0=argument[10]
    nn.alpha1=argument[11]
    nn.alpha2=argument[12]
    nn.collide=global.PartsCollide
    
    nn.speed=argument[13]
    nn.direction=random(argument[14])
    nn.depth=argument[15]
    with(nn){event_user(0)}
}
global.PartsColor0=-1
global.PartsColor1=-1
global.PartsColor2=-1
global.PartsCollide=false
}