///scr_menudraw_santa2(sprite)
if CHRISTMAS=true{
    var yy=(2*sprite_get_yoffset(argument[0]))-4
    var xx=-4
    draw_sprite_ext(spr_santahat,0,argument[1]+xx,argument[2]-yy,2,2,0,c_white,1)
}
if PARTY=true{
    var yy=(5*sprite_get_yoffset(argument[0]))-34
    var xx=-2
    draw_sprite_ext(spr_santahat,0,argument[1]+xx,argument[2]-yy,1,1,0,person[i,99],1)
}