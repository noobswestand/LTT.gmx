///scr_draw_god_rays(x,y,scale,rot)
var _scale=argument[2]
var maxi=18
for(i=0;i<18;i+=3){
    draw_sprite_ext(spr_rays,0,argument[0],argument[1],_scale/3,_scale,((360/maxi)*i)+argument[3],c_white,0.9)
    
}
