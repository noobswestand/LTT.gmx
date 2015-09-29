///draw_gun6(reload,direction,damage,spread,player)

if argument[4]=obj_player{alarm[3]=1}else{alarm[4]=1}

gun6Speed=argument[1];
var damage=argument[2];

laser_x=argument[4].x+lengthdir_x(10,gun6Speed)
laser_y=argument[4].y+lengthdir_y(10,gun6Speed)


left=3
repeat(3){
with(instance_create(laser_x,laser_y,objLaser_messenger)){
    move_contact_solid(point_direction(x,y,x+lengthdir_x(50,other.gun6Speed),y+lengthdir_y(50,other.gun6Speed)),500)
    draw_set_color(c_red)
    draw_set_alpha((other.left)/5)
    draw_line_width(xstart,ystart,x,y,3)
    other.laser_x=x other.laser_y=y
    var tmp=other.gun6Speed;
    other.gun6Speed=2*(0)-((other.gun6Speed+180) mod 360)
    var xx,yy;
    xx=round(x)
    yy=round(y)
    move_contact_solid(point_direction(x,y,x+lengthdir_x(50,other.gun6Speed),y+lengthdir_y(50,other.gun6Speed)),5)
    if xx=round(x) && yy=round(y){
        other.gun6Speed=2*(90)-((tmp+180) mod 360)
    }
    x=xx
    y=yy
    
    nn=collision_line(xstart,ystart,x,y,par_monster,0,1)
    if nn>0{
        nn.helth-=argument[2]*((other.left)/3)
        nn.image_blend=nn._color
        nn.alarm[0]=3
        nn.hitBullet=true
    }
    nn=collision_line(xstart,ystart,x,y,obj_crate,0,1)
    if nn>0{
        nn.helth-=argument[2]*((other.left)/3)
    }
    nn=collision_line(xstart,ystart,x,y,obj_dynamite,0,1)
    if nn>0{
        nn.helth-=argument[2]*((other.left)/3)
    }
    
    instance_destroy(); 
    other.left--
}
}
if !audio_is_playing(snd_laser2){
    audio_play_sound(snd_laser2,19,1)
}

gun6Speed=0
